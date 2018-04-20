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

end
