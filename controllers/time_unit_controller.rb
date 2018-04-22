require("sinatra")
require("sinatra/contrib/all")


require_relative("../models/time_units.rb")

#index
get "/time_units" do
  @time_units = Expense.all()
  erb(:"time_units/index")
end

 #new
get "/time_units/new" do
  erb(:"time_unitss/new_time_units")
end

#show
get "/time_units/:id" do
  @time_units = Project.find_by_id(params[:id])
  erb(:"time_units/show")
end

#create
post "/time_units" do
  time_units = Project.new(params)
  time_units.save()
  redirect to "/time_units"
end

#edit
get "/time_units/:id/edit" do
 @time_units = Project.find_by_id(params[:id])
 erb(:"time_units/edit")
end

#update
post "/time_units/:id/edit" do
  @time_units = Project.new(params)
  @time_units.update
  redirect to "/time_units"
end

 #destroy
post "/time_units/:id/delete" do
time_units = Project.find(params[:id] )
time_units.delete()
redirect to "/time_units"
end
