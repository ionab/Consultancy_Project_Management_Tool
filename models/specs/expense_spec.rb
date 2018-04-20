require('minitest/autorun')

require_relative("../expense.rb")


class TestExpense < MiniTest::Test
  def setup()
    @expense1 = Expense.new(
        {
          "cost_excluding_vat" => 10.50,
          "vat" => 1.20,
          "category" => "subsistence"
        }
      )
  end
  def test_get_cost_excluding_vat()
    assert_equal(10.50, @expense1.cost_excluding_vat)
  end
  def test_get_vat()
    assert_equal(1.20, @expense1.vat)
  end
  def test_get_category()
    assert_equal("subsistence", @expense1.category)
  end
end
