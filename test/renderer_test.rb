require 'minitest/autorun'
require 'minitest/pride'

require_relative '../lib/renderer'


class RendererTest < Minitest::Test

  def test_it_chunks
    input = "A\n\nB"
    render = Renderer.new(input)

    assert_equal ["A", "B"], render.chunks
  end

  def test_it_does_not_chunk_without_two_new_lines
    input = "A\nB"
    renderer = Renderer.new(input)
    assert_equal [input], renderer.chunks
  end

  def test_it_returns_true_when_the_input_is_a_header
    input = "# My Life in Desserts"
    assert_equal true, Renderer.new(input).header?(input)
  end

  def test_it_returns_false_when_input_is_not_a_header
    input = "My Life in Desserts"
    assert_equal false, Renderer.new(input).header?(input)
  end

  def test_it_runs_header_machine_on_headers
    input = "# My Life in Desserts"
    renderer = Renderer.new(input)
    assert_equal ["<h1> My Life in Desserts <h1>"], renderer.iterator
  end

  def test_it_converts_paragraphs
    input = "You just have to try the cheesecake"
    renderer = Renderer.new(input)
    assert_equal ["<p>\nYou just have to try the cheesecake\n</p>"], renderer.iterator
  end

  def test_it_can_handle_mixed_text
    input = "# My Life in Desserts\n\n## Chapter 1: The Beginning\n\nYou just have to try the cheesecake, he said. Ever since it appeared in Food & Wine this place has been packed every night."
    renderer = Renderer.new(input)
    assert_equal ["<h1> My Life in Desserts <h1>", "<h2> Chapter 1: The Beginning <h2>", "<p>\nYou just have to try the cheesecake, he said. Ever since it appeared in Food & Wine this place has been packed every night.\n</p>"], renderer.iterator
  end


end