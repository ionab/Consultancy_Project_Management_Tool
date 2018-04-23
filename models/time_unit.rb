require_relative('../db/sql_runner')
require_relative('employee.rb')
require_relative('project.rb')

class TimeUnit

  attr_reader :id, :project_id, :employee_id
  attr_accessor :hours, :category

  def initialize(options)
    @id = options["id"].to_i
    @hours = options["hours"].to_f
    @category = options["category"]
    @project_id = options["project_id"].to_i
    @employee_id = options["employee_id"].to_i
  end

  def self.map(time_unit_data)
    return time_unit_data.map {|time_unit| TimeUnit.new(time_unit)}
  end

  def save()
    sql = "INSERT INTO time_units (hours, category, project_id, employee_id) VALUES ($1, $2, $3, $4) RETURNING id;"
    values = [@hours, @category, @project_id, @employee_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i()
  end

  def self.all()
    sql = "SELECT * FROM time_units;"
    time_units = SqlRunner.run(sql)
    return time_units.map{|time_unit| self.new(time_unit)}
  end

  def self.delete_all()
    sql = "DELETE FROM time_units;"
    SqlRunner.run(sql)
  end

  def delete_by_id()
    sql = "DELETE FROM time_units WHERE id = $1;"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def update()
    sql = "UPDATE time_units SET (hours, category, project_id, employee_id) = ($1, $2, $3, $4) WHERE id = $5;"
    values = [@hours, @category, @project_id, @employee_id, @id]
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
    sql = "SELECT * FROM time_units WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
    result_hash = result[0]  #convert here from database object to a ruby object
    return TimeUnit.new(result_hash)
  end

  def find_project()
   sql = "SELECT * FROM projects WHERE id = $1;"
   values = [@project_id]
   project = SqlRunner.run(sql, values).map { |project| Project.new(project) }[0]
   return project
 end
 def find_employee()
  sql = "SELECT * FROM employees WHERE id = $1;"
  values = [@employee_id]
  employee = SqlRunner.run(sql, values).map { |employee| Employee.new(employee) }[0]
  return employee
end
end
