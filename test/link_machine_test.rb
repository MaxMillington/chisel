require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/link_machine'

class LinkMachineTest < Minitest::Test

  def test_it_converts_links
    input = "Charlie *don't* surf! [Apocalypse Now](http://www.imdb.com/title/tt0078788/)."
    output = LinkMachine.convert(input)
    assert_equal "<a href=http://www.imdb.com/title/tt0078788/>Apocalypse Now</a>", output
  end

  def test_it_returns_non_links
    input = "Charlie *don't* surf!"
    output = LinkMachine.convert(input)
    assert_equal input, output
  end




end