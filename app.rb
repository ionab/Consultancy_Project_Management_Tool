require("sinatra")
require("sinatra/contrib/all" )
require_relative("controllers/employee_controller")
require_relative("controllers/expenses_controller")
require_relative("controllers/project_controller")
require_relative("controllers/time_unit_controller")


get "/" do
  erb( :index )
end
