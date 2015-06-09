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

  def test_it_will_not_delete_a_single_star
    input = "6 * 6 = **36**"
    output = Emboldener.convert(input)
    assert_equal "6 * 6 = <strong>36</strong>", output
  end

end