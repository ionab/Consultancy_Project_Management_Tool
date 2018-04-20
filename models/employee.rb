require_relative('../db/sql_runner')

class Employee
  attr_reader :id
  attr_accessor :name, :job_title, :hourly_rate

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @job_title = options["job_title"]
    @hourly_rate = options["hourly_rate"].to_f
  end

  def self.map(employee_data)
    return employee_data.map {|employee| Employee.new(employee)}
  end

  def save()
    sql = "INSERT INTO employees (name, job_title, hourly_rate) VALUES ($1, $2, $3) RETURNING id"
    values = [@name, @job_title, @hourly_rate]
    employees = SqlRunner.run(sql, values)
    @id = employees.first["id"].to_i
  end

  def self.find_all()
    sql = "SELECT * FROM employees"
    values = []
    employees = SqlRunner.run(sql, values)
    result = Employee.map(employees)
  end

  def self.find_by_id(id)
    sql = "SELECT * FROM employees WHERE id = $1"
    values = [id]
    employees = SqlRunner.run(sql, values)
    result = Employee.new(employees.first)
    return result
  end
  def update()
    sql = "UPDATE employees SET (name, job_title, hourly_rate) VALUES ($1, $2, $3) WHERE id = $4"
    values = [@name, @job_title, @hourly_rate, @id]
    SqlRunner.run(sql, values)
  end

  def self.delete_all
    sql = "SELECT * FROM employees"
    SqlRunner.run(sql)
  end

end
