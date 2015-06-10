require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/emboldener'

class EmboldenerTest < Minitest::Test

  def test_it_can_embolden_an_easy_string
    input = "**bold**"
    output = Emboldener.convert(input)
    assert_equal "<strong>bold</strong>", output
  end

  def test_it_will_not_embolden_an_emphasizer
    input = "*emphasize*"
    output = Emboldener.convert(input)
    assert_equal input, output
  end

  def test_it_can_embolden_in_the_middle_of_a_string
    input = "Open the **POD** bay doors please HAL."
    output = Emboldener.convert(input)
    assert_equal "Open the <strong>POD</strong> bay doors please HAL.", output
  end

  def test_it_will_embolden_many_words
    input = "**bold** and **really** **bold**"
    output = Emboldener.convert(input)
    assert_equal "<strong>bold</strong> and <strong>really</strong> <strong>bold</strong>", output
  end

  def test_it_can_handle_spaces
    input = "**super bold**"
    output = Emboldener.convert(input)
    assert_equal "<strong>super bold</strong>", output
  end

  def test_it_can_handle_many_spaces
    input = "**extremely very much bold**"
    output = Emboldener.convert(input)
    assert_equal "<strong>extremely very much bold</strong>", output
  end

  def test_it_can_handle_no_bold
    input = "extremely very much bold"
    output = Emboldener.convert(input)
    assert_equal "extremely very much bold", output
  end

  def test_worst_case_scenario
    input = "*THIS* is some **extremely very much bold** text."
    output = Emboldener.convert(input)
    assert_equal "*THIS* is some <strong>extremely very much bold</strong> text.", output
  end

  def test_even_worse_case_scenario
    input = "*THIS* is some **extremely *very* much bold** text."
    output = Emboldener.convert(input)
    assert_equal "*THIS* is some <strong>extremely *very* much bold</strong> text.", output
  end
end