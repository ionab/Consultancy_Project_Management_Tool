require('minitest/autorun')

require_relative("../time_unit.rb")

class TestTimeUnit < MiniTest::Test
  def setup()
    @time_unit1 = TimeUnit.new(
        {
          "hours" => 7.5,
          "category" => "project management"
        }
      )
  end
  def test_get_hours()
    assert_equal(7.5, @time_unit1.hours)
  end
  def test_get_category()
    assert_equal("project management", @time_unit1.category)
  end
end
