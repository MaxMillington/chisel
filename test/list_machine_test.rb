require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/list_machine'

class ListMachineTest < Minitest::Test

  def test_it_can_order_a_one_item_list
    input = "Meats: \n* bresaola"
    output = ListMachine.convert(input)
    assert_equal "Meats: \n<ul>\n<li>bresaola</li>\n</ul>", output
  end

  def test_it_recognizes_single_star_as_unordered_list
    input = "My special meats: \n* bresaola\n* prosciutto\n* finocchiona"
    output = ListMachine.convert(input)
    assert_equal "My special meats: \n<ul>\n<li>bresaola</li>\n<li>prosciutto</li>\n<li>finocchiona</li>\n</ul>", output
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
    input = "My special meats: \n* *bresaola*\n* **prosciutto**\n* finocchiona"
    output = ListMachine.convert(input)
    assert_equal "My special meats: \n<ul>\n<li>*bresaola*</li>\n<li>**prosciutto**</li>\n<li>finocchiona</li>\n</ul>", output
  end

  def test_it_can_handle_an_ordered_list
    input = "I like: \n1. cows"
    output = ListMachine.convert(input)
    assert_equal "I like: \n<ol>\n<li>cows</li>\n</ol>", output
  end

  def test_it_can_handle_a_longer_ordered_list
    input = "I like: \n1. cows\n2. pigs"
    output = ListMachine.convert(input)
    assert_equal "I like: \n<ol>\n<li>cows</li>\n<li>pigs</li>\n</ol>", output
  end

  def test_it_ignores_fancy_8th_grade_essay_form_prefixes
    input = "I like: \n1a. stuff"
    output = ListMachine.convert(input)
    assert_equal "I like: \n1a. stuff", output
  end

  def test_it_can_handle_numbers_greater_than_9
    input = "I like: \n11. other things"
    output = ListMachine.convert(input)
    assert_equal "I like: \n<ol>\n<li>other things</li>\n</ol>", output
  end

end

