class Employee
  attr_reader :id
  attr_accessor :name, :job_title, :hourly_rate

  def initialize(options)
    @id = options["id"].to_i
    @name = options["name"]
    @job_title = options["job_title"]
    @hourly_rate = options["hourly_rate"].to_f
  end

end
