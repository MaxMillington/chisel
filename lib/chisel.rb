require_relative 'renderer'
require_relative 'chunk_maker'
require_relative 'header_machine'
require_relative 'list_machine'
require_relative 'paragraph_machine'

class Chisel
  def initialize(input)
    @renderer = Renderer.new(input, [
      HeaderMachine.new,
      ListMachine.new,
      ParagraphMachine.new
    ])
  end

  def result
    @renderer.formatter
  end
end

if __FILE__ == $0
#   $LOAD_PATH.unshift(File.expand_path("..", __FILE__))

  input = File.read(ARGV[0])
  chisel = Chisel.new(input).result
  File.write(ARGV[1], chisel)

end














# chisler = Chisel.new('# My Life in Desserts
#
# ## Chapter 1: The Beginning
#
#     "You just *have* to try the cheesecake," he said. "Ever since it appeared in
# **Food & Wine** this place has been packed every night."
#
# * Things are so great
# * The tests are passing
#
# These are my favorite movies:
#
# 1. Vertigo
# 2. 2001
# 3. The Third Man')
#
# p chisler