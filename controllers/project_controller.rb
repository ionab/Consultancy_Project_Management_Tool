require("sinatra")
require("sinatra/contrib/all")


require_relative("../models/projects.rb")

#index
get "/projects" do
  @projects = Expense.all()
  erb(:"projects/index")
end

 #new
get "/projects/new" do
  erb(:"projectss/new_projects")
end

#show
get "/projects/:id" do
  @projects = Project.find_by_id(params[:id])
  erb(:"projects/show")
end

#create
post "/projects" do
  projects = Project.new(params)
  projects.save()
  redirect to "/projects"
end

#edit
get "/projects/:id/edit" do
 @projects = Project.find_by_id(params[:id])
 erb(:"projects/edit")
end

#update
post "/projects/:id/edit" do
  @projects = Project.new(params)
  @projects.update
  redirect to "/projects"
end

 #destroy
post "/projects/:id/delete" do
projects = Project.find(params[:id] )
projects.delete()
redirect to "/projects"
end
