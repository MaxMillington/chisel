require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/list_machine'

class ListMachineTest < Minitest::Test

  def test_it_can_order_a_one_item_list
    input = "Meats: /n* bresaola"
    output = ListMachine.convert(input)
    assert_equal "Meats: <ul><li>bresaola</li></ul>", output
  end

  def test_it_recognizes_single_star_as_unordered_list
    input = "My special meats: /n* bresaola/n* prosciutto/n* finocchiona"
    output = ListMachine.convert(input)
    assert_equal "My special meats: <ul><li>bresaola</li><li>prosciutto</li><li>finocchiona</li></ul>", output
  end

  def test_it_will_not_screw_up_my_emphasizer
    input = "Open the *POD* bay doors please HAL."
    output = ListMachine.convert(input)
    assert_equal input, output
  end

  def test_it_will_not_screw_up_my_emboldener
    input = "Open the **POD** bay doors please HAL."
    output = ListMachine.convert(input)
    assert_equal input, output
  end

  def test_it_can_handle_emphasis_and_embolden_in_a_list
    input = "My special meats: /n* *bresaola*/n* **prosciutto**/n* finocchiona"
    output = ListMachine.convert(input)
    assert_equal "My special meats: <ul><li>*bresaola*</li><li>**prosciutto**</li><li>finocchiona</li></ul>", output
  end

end

