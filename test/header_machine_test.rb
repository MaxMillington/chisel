require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/header_machine'


class HeaderMachineTest < Minitest::Test
  def test_it_can_convert_one_hash_sign
    chunk = "# My Life in Desserts"
    result = HeaderMachine.convert(chunk)
    assert_equal "<h1> My Life in Desserts <h1>", result
  end

  def test_it_can_convert_two_hash_signs
    chunk = "## My Life in Desserts"
    result = HeaderMachine.convert(chunk)
    assert_equal "<h2> My Life in Desserts <h2>", result
  end

  def test_it_can_convert_four_hash_signs
    chunk = "#### My Life in Desserts"
    result = HeaderMachine.convert(chunk)
    assert_equal "<h4> My Life in Desserts <h4>", result
  end

  def test_it_returns_input_with_no_hashes
    chunk = "My Life in Desserts"
    result = HeaderMachine.convert(chunk)
    assert_equal chunk, result
  end

  def test_it_does_not_delete_hashes_in_the_middle
    chunk = "### My Life # in Desserts"
    result = HeaderMachine.convert(chunk)
    assert_equal "<h3> My Life # in Desserts <h3>", result
  end

  def test_it_can_handle_only_hashes_in_the_middle
    chunk = "My ##### Sentence"
    result = HeaderMachine.convert(chunk)
    assert_equal chunk, result
  end

end