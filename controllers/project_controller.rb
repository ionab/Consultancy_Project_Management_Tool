require("sinatra")
require("sinatra/contrib/all")



require_relative("../models/project.rb")

#index
get "/projects" do
  @projects = Project.all()
  erb(:"projects/index")
end

 #new
get "/projects/new" do
  erb(:"projects/new")
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
 @projects = Project.find_by_id(params[:id].to_i)
 erb(:"projects/edit")
end

#update
post "/projects/:id/update" do
  projects = Project.new(params)
  projects.update
  redirect to "/projects"
end

 #destroy
post "/projects/:id/delete" do
  projects = Project.find(params[:id] )
  projects.delete()
  redirect to "/projects"
end
