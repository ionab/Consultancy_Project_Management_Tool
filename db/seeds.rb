require_relative( "../models/employee.rb" )
require_relative( "../models/expense.rb" )
require_relative( "../models/project.rb" )
require_relative( "../models/time_unit.rb" )
require('pry')

TimeUnit.delete_all()
Expense.delete_all()
Employee.delete_all()
Project.delete_all()


@project1 = Project.new(
  {
    "name" => "jupiter",
    "client" => "FDDC development",
    "time_budget" => 90000.00,
    "expenses_budget" => 9000.00,
    "project_status" => "Proposal Submitted"
  }
)
@project1.save
@project2 = Project.new(
  {
    "name" => "mars",
    "client" => "Scottish Energy Systems",
    "time_budget" => 100000.00,
    "expenses_budget" => 10000.00,
    "project_status" => "Completes"
  }
)
@project2.save
@project3 = Project.new(
  {
    "name" => "pluto",
    "client" => "Finacial Services Company",
    "time_budget" => 450000.00,
    "expenses_budget" => 45000.00,
    "project_status" => "Proposal"
  }
)
@project3.save
@project4 = Project.new(
  {
    "name" => "earth",
    "client" => "Assest Management Systems",
    "time_budget" => 20000.00,
    "expenses_budget" => 2000.00,
    "project_status" => "Open"
  }
)
@project4.save
@project5 = Project.new(
  {
    "name" => "saturn",
    "client" => "Hotel Management Services",
    "time_budget" => 1000.00,
    "expenses_budget" => 100.00,
    "project_status" => "On Hold"
  }
)
@project5.save
@project6 = Project.new(
  {
    "name" => "uranus",
    "client" => "Investment Services",
    "time_budget" => 79000.00,
    "expenses_budget" => 7900.00,
    "project_status" => "Proposal"
  }
)
@project6.save
@project7 = Project.new(
  {
    "name" => "mercury",
    "client" => "Scottish LLP",
    "time_budget" => 190000.00,
    "expenses_budget" => 1900.00,
    "project_status" => "Open"
  }
)
@project7.save
@project8 = Project.new(
  {
    "name" => "venus",
    "client" => "McDonald Construction England",
    "time_budget" => 250000.00,
    "expenses_budget" => 2500.00,
    "project_status" => "Open"
  }
)
@project8.save

@employee1 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "senior consultant",
    "hourly_rate" => 52
  }
)
@employee1.save
@employee2 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "junior consultant",
    "hourly_rate" => 36
  }
)
@employee2.save
@employee3 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "consultant",
    "hourly_rate" => 46
  }
)
@employee3
@employee4 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "senior consultant",
    "hourly_rate" => 52
  }
)
@employee4.save
@employee5 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "director",
    "hourly_rate" => 78
  }
)
@employee5.save
@employee6 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "administator",
    "hourly_rate" => 25
  }
)
@employee6.save

@employee7 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "intern",
    "hourly_rate" => 20
  }
)
@employee6.save
@employee7 = Employee.new(
  {
    "name" => "Joe Bloggs",
    "job_title" => "consultant",
    "hourly_rate" => 46
  }
)
@employee7.save

@expense1 = Expense.new(
  {
    "cost_excluding_vat" => 50.00,
    "vat" => 13.20,
    "category" => "Fuel",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense1.save
@expense2 = Expense.new(
  {
    "cost_excluding_vat" => 5.0,
    "vat" => 1.20,
    "category" => "Hire Car",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense2.save
@expense3 = Expense.new(
  {
    "cost_excluding_vat" => 10.50,
    "vat" => 1.20,
    "category" => "Equipment",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense3.save
@expense4 = Expense.new(
  {
    "cost_excluding_vat" => 50.50,
    "vat" => 15.20,
    "category" => "Accommodation",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense4.save
@expense5 = Expense.new(
  {
    "cost_excluding_vat" => 300,
    "vat" => 25,
    "category" => "Public Transport",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense5.save
@expense6 = Expense.new(
  {
    "cost_excluding_vat" => 900,
    "vat" => 90,
    "category" => "Subsistence",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense6.save
@expense7 = Expense.new(
  {
    "cost_excluding_vat" => 3.00,
    "vat" => 1.20,
    "category" => "Subsistence",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense7.save
@expense8 = Expense.new(
  {
    "cost_excluding_vat" => 90.00,
    "vat" => 15.00,
    "category" => "Hire Car",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense8.save
@expense9 = Expense.new(
  {
    "cost_excluding_vat" => 500,
    "vat" => 0.00,
    "category" => "Hire Car",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense9.save
@expense10 = Expense.new(
  {
    "cost_excluding_vat" => 1.50,
    "vat" => 0.10,
    "category" => "Subsistence",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense10.save
@expense11 = Expense.new(
  {
    "cost_excluding_vat" => 45,
    "vat" => 12.20,
    "category" => "Accommodation",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense11.save
@expense12 = Expense.new(
  {
    "cost_excluding_vat" => 19.50,
    "vat" => 3.20,
    "category" => "Subsistence",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense12.save
@expense13 = Expense.new(
  {
    "cost_excluding_vat" => 86,
    "vat" => 15,
    "category" => "Accomodation",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense13.save
@expense14 = Expense.new(
  {
    "cost_excluding_vat" => 10.50,
    "vat" => 1.20,
    "category" => "Subsistence",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@expense14.save
@expense15 = Expense.new(
  {
    "cost_excluding_vat" => 4,
    "vat" => 1.20,
    "category" => "Subsistence",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@expense15.save
@expense16 = Expense.new(
  {
    "cost_excluding_vat" => 10.50,
    "vat" => 1.20,
    "category" => "Subsistence",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@expense16.save
@expense17 = Expense.new(
  {
    "cost_excluding_vat" => 90,
    "vat" => 1.20,
    "category" => "Accomodation",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@expense17.save
@expense18 = Expense.new(
  {
    "cost_excluding_vat" => 200,
    "vat" => 40,
    "category" => "Accommodation",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@expense18.save

@time_unit1 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Meeting",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit1.save()
@time_unit2 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Meeting",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit2.save()
@time_unit3 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit3.save()
@time_unit4 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit4.save()
@time_unit5 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Data Management",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit5.save()
@time_unit6 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Reporting",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit6.save()
@time_unit7 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Review and Quality Assurance",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit7.save()
@time_unit8 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Proposal",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit8.save()
@time_unit9 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Proposal",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit9.save()
@time_unit10 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit10.save()
@time_unit11 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1
    .id,
    "project_id" => @project2.id
  }
)
@time_unit11.save()
@time_unit12 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1.id,
    "project_id" => @project2.id
  }
)
@time_unit12.save()
@time_unit13 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1.id,
    "project_id" => @project1.id
  }
)
@time_unit13.save()
@time_unit14 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1.id,
    "project_id" => @project1.id
  }
)
@time_unit14.save()
@time_unit15 = TimeUnit.new(
  {
    "hours" => 7.5,
    "category" => "Project Management",
    "employee_id" => @employee1.id,
    "project_id" => @project1.id
  }
)
@time_unit15.save()

binding.pry
nil
