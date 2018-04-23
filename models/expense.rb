require_relative('../db/sql_runner')
require_relative('employee.rb')
require_relative('project.rb')

class Expense

  attr_reader :id, :project_id, :employee_id
  attr_accessor :cost_excluding_vat, :vat, :category

  def initialize(options)
    @id = options["id"].to_i
    @cost_excluding_vat = options["cost_excluding_vat"].to_f
    @vat = options["vat"].to_f
    @category = options["category"]
    @project_id = options["project_id"].to_i
    @employee_id = options["employee_id"].to_i
  end

  def self.map(expense_data)
    return expense_data.map {|expense| Expense.new(expense)}
  end

  def save()
    sql = "INSERT INTO expenses (cost_excluding_vat, vat, category, project_id, employee_id) VALUES ($1, $2, $3, $4, $5) RETURNING id;"
    values = [@cost_excluding_vat, @vat, @category, @project_id, @employee_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM expenses;"
    expenses = SqlRunner.run(sql)
    return expenses.map{|expense| self.new(expense)}
  end

  def self.delete_all()
    sql = "DELETE FROM expenses;"
    SqlRunner.run(sql)
  end

  def delete_by_id()
    sql = "DELETE FROM expenses WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE expenses SET (cost_excluding_vat, vat, category, project_id, employee_id) = ($1, $2, $3, $4, $5) WHERE id = $6;"
    values = [@cost_excluding_vat, @vat, @category, @project_id, @employee_id, @id]
    SqlRunner.run(sql, values)
  end

  def projects()
    sql ="SELECT * from projects WHERE id = $1;"
    values = [@project_id]
    result = SqlRunner.run(sql, values)
    projects_hash = result[0]
    return Project.new(projects_hash)
  end

  def employees()
    sql ="SELECT * from employees WHERE id = $1;"
    values = [@employee_id]
    result = SqlRunner.run(sql, values)
    employees_hash = result[0]
    return Employee.new(employees_hash)
  end


  def self.find_by_id(id)
    sql = "SELECT * FROM expenses WHERE id = $1"
    values = [id]
    expenses = SqlRunner.run(sql, values)
    result = Expense.new(expenses.first)
    return result
  end


end
