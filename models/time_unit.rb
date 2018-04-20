class TimeUnit

  attr_reader :id, :project_id, :employee_id
  attr_accessor :hours, :category

  def initialize(options)
    @id = options["id"].to_i
    @hours = options["hours"].to_f
    @category = options["category"]
    @project_id = options["project_id"].to_i
    @employee_id = options["employee_id"].to_i
  end

end
