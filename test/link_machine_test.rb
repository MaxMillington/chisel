require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/link_machine'

class LinkMachineTest < Minitest::Test

  def test_it_can_convert_a_link
    skip
    input = "[Apocalypse Now](http://www.imdb.com/title/tt0078788/)"
    output = LinkMachine.convert(input)
    assert_equal '<a href="http://www.imdb.com/title/tt0078788">Apocalypse Now</a>', output
  end



end