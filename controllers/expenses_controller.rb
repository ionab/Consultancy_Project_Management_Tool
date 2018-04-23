require("sinatra")
require("sinatra/contrib/all")


require_relative("../models/expense.rb")
require_relative("../models/project.rb")
require_relative("../models/employee.rb")

#index
get "/expenses" do
  @expenses = Expense.all()
  @projects = Project.all()
  @employees = Employee.find_all()
  erb(:"expenses/index")
end

 #new
get "/expenses/new" do
  @projects = Project.all()
  @employees = Employee.find_all()
  erb(:"expenses/new")
end

#show
get "/expenses/:id" do
  @expenses = Expense.find_by_id(params[:id])
  erb(:"expenses/show")
end

#create
post "/expenses" do
  expenses = Expense.new(params)
  expenses.save()
  redirect to "/expenses"
end

#edit
get "/expenses/:id/edit" do
 @expenses = Expense.find_by_id(params[:id])
 erb(:"expenses/edit")
end

#update
post "/expenses/:id/edit" do
  @expenses = Expense.new(params)
  @expenses.update
  redirect to "/expenses"
end

 #destroy
post "/expenses/:id/delete" do
expenses = Expense.find(params[:id] )
expenses.delete()
redirect to "/expenses"
end
