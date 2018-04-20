class Expense

  attr_reader :id, :project_id, :employee_id
  attr_accessor :cost_excluding_vat, :vat, :category

  def initialize(options)
    @id = options["id"].to_i
    @cost_excluding_vat = options["cost_excluding_vat"].to_f
    @vat = options["vat"].to_f
    @category = options["category"]
    @project_id = options["project_id"].to_i
    @employee_id = options["employee_id"].to_i
  end

end
