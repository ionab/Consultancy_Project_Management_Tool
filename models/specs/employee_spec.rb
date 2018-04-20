require('minitest/autorun')

require_relative("../employee.rb")

class TestEmployee < MiniTest::Test
  def setup()
    @employee1 = Employee.new(
        {
          "name" => "Kelsie Braidwood",
          "job_title" => "senior consultant",
          "hourly_rate" => 52
        }
      )
  end
  def test_get_name()
    assert_equal("Kelsie Braidwood", @employee1.name)
  end
  def test_get_job_title()
    assert_equal("senior consultant", @employee1.job_title)
  end
  def test_get_hourly_rate()
    assert_equal(52, @employee1.hourly_rate)
  end
end
