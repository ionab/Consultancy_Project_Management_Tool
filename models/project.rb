require_relative('../db/sql_runner')
require_relative('employee.rb')
require_relative('time_unit.rb')
require_relative('expense.rb')
require("pry-byebug")

class Project

  attr_reader :id
  attr_accessor :name, :client, :time_budget, :expenses_budget, :project_status

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @client = options["client"]
    @time_budget = options["time_budget"].to_f
    @expenses_budget = options["expenses_budget"].to_f
    @project_status = options["project_status"]
  end

  def self.map(project_data)
    return project_data.map {|project| Project.new(project)}
  end

  def save()
    sql = "INSERT INTO projects (name, client, time_budget, expenses_budget, project_status) VALUES ($1, $2, $3, $4, $5) RETURNING id"
    values = [@name, @client, @time_budget, @expenses_budget, @project_status]
    projects = SqlRunner.run(sql, values)
    @id = projects.first["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM projects"
    values = []
    projects = SqlRunner.run(sql, values)
    result = Project.map(projects)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM projects WHERE id = $1"
    values = [id]
    projects = SqlRunner.run(sql, values)
    result = Project.new(projects.first)
    return result
  end

  def update()
    sql = "UPDATE projects SET (name, client, time_budget, expenses_budget, project_status) = ($1, $2, $3, $4, $5) WHERE id = $6"
    values = [@name, @client, @time_budget, @expenses_budget, @project_status, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "SELECT * FROM projects"
    SqlRunner.run(sql)
  end

  def find_time_by_id(id)
    sql = "SELECT * FROM time_units WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
    result_hash = result[0]  #convert here from database object to a ruby object
    return TimeUnit.new(result_hash)
  end

  def total_time_spend()
   sql = "SELECT SUM (employees.hourly_rate * time_units.hours) FROM employees INNER JOIN time_units ON employees.id = time_units.employee_id WHERE time_units.project_id = $1;"
   values = [@id]
   result = SqlRunner.run(sql, values)
   spend = result[0]
   return spend["sum"].to_f
  end
  # binding.pry
  # nil

  def total_expenses_spend()
    sql = "SELECT SUM (expenses.cost_excluding_vat + expenses.vat) FROM expenses WHERE expenses.project_id = $1"
    values = [$1]
    result = SqlRunner.run(sql, values)
    spend = result[0]
    return spend["sum"].to_f
  end
end
