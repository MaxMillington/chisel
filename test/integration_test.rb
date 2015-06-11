require_relative 'test_helper'
require 'chisel'

class IntegrationTest < Minitest::Test
  def test_it_renders_markdown_correctly
    input = read_fixture_file("markdown.md")
    expected_output = read_fixture_file("expected_rendering.html")

    actual_output = Chisel.new(input).result

    assert_equal normalize_whitespace(expected_output), normalize_whitespace(actual_output)
  end

  private

  def read_fixture_file(file_name)
    fixtures_directory = File.expand_path("../fixtures", __FILE__)
    File.read(File.join(fixtures_directory, file_name))
  end

  def normalize_whitespace(string)
    string.gsub(/\s+/, " ").gsub(/(\<[^\>]+\>)\s/, '\1')
  end
end