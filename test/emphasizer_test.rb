require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/emphasizer'


class EmphasizerTest < Minitest::Test

  def test_it_can_emphasize_an_easy_string
    input = "*emphasize*"
    output = Emphasizer.convert(input)
    assert_equal "<em>emphasize</em>", output
  end

  def test_it_can_emphasize_in_the_middle_of_a_string
    input = "Open the *POD* bay doors please HAL."
    output = Emphasizer.convert(input)
    assert_equal "Open the <em>POD</em> bay doors please HAL.", output
  end

  def test_it_will_emphasize_many_words
    input = "*emphasize* and *really* *emphasize*"
    output = Emphasizer.convert(input)
    assert_equal "<em>emphasize</em> and <em>really</em> <em>emphasize</em>", output
  end

  def test_it_can_handle_spaces
    input = "*super emphasis*"
    output = Emphasizer.convert(input)
    assert_equal "<em>super emphasis</em>", output
  end

end