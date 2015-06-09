require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/chunk_maker'

class ChunkMakerTest < Minitest::Test

  def test_it_splits_at_an_empty_line
    inputted = "# My Life in Desserts \n\n## Chapter 1: The Beginning"
    cc = ChunkMaker.new
    result = cc.chunk_it(inputted)

    assert_equal ["# My Life in Desserts ",  "## Chapter 1: The Beginning"], result


  end

  def test_it_doesnt_confuse_a_new_line_with_an_empty_line
    input = "# My Life in Desserts \n## Chapter 1: The Beginning"
    cc = ChunkMaker.new
    result = cc.chunk_it(input)
    assert_equal [input], result
  end

end