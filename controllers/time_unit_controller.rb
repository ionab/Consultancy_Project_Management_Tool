require("sinatra")
require("sinatra/contrib/all")


require_relative("../models/time_unit.rb")
require_relative("../models/project.rb")
require_relative("../models/employee.rb")


#index
get "/time-units" do
  @time_units = TimeUnit.all()
  erb(:"time_units/index")
end

 #new
get "/time-units/new" do
  @projects = Project.all()
  @employees = Employee.find_all()
  erb(:"time_units/new")
end

#show
get "/time-units/:id" do
  @time_units = TimeUnit.find_by_id(params[:id])
  erb(:"time_units/show")
end

#create
post "/time-units" do
  time_units = TimeUnit.new(params)
  time_units.save()
  redirect to "/time-units"
end

#edit
get "/time-units/:id/edit" do
  @employees = Employee.find_all()
  @projects = Project.all()
  @time_units = TimeUnit.find_by_id(params[:id])
 erb(:"time_units/edit")
end

#update
post "/time-units/:id/update" do
  @projects = Project.all()
  @employees = Employee.find_all()
  @time_units = TimeUnit.new(params)
  @time_units.update
  redirect to "/time-units"
end

 #destroy
post "/time-units/:id/delete" do
time_units = TimeUnit.find(params[:id] )
time_units.delete()
redirect to "/time-units"
end
