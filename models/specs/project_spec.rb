require('minitest/autorun')

require_relative("../project.rb")

class TestProject < MiniTest::Test
  def setup()
    @project1 = Project.new(
        {
          "name" => "project jupiter",
          "client" => "FDDC development",
          "time_budget" => 10000.00,
          "expenses_budget" => 1000.00
        }
      )
  end
  def test_get_name()
    assert_equal("project jupiter", @project1.name)
  end
  def test_get_client()
    assert_equal("FDDC development", @project1.client)
  end
  def test_get_time_budget()
    assert_equal(10000.00, @project1.time_budget)
  end
  def test_get_expenses_budget()
    assert_equal(1000.00, @project1.expenses_budget)
  end
end
