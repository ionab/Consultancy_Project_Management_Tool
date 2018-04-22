require("sinatra")
require("sinatra/contrib/all")


require_relative("../models/employee.rb")

#index
get "/employees" do
  @employees = Employee.find_all()
  erb(:"employees/index")
end

 #new
get "/employees/new" do
  erb(:"employees/new_employee")
end

#show
get "/employees/:id" do
  @employee = Employee.find_by_id(params[:id])
  erb(:"employees/show")
end

#create
post "/employees" do
  employee = Employee.new(params)
  employee.save()
  redirect to "/employees"
end

#edit
get "/employees/:id/edit" do
 @employee = Employee.find_by_id(params[:id])
 erb(:"employees/edit")
end

#update
post "/employees/:id/edit" do
  employee = Employee.new(params)
  employee.update
  redirect to "/employees"
end

 #destroy
post "/employees/:id/delete" do
employee = Employee.find(params[:id] )
employee.delete()
redirect to "/employees"
end
