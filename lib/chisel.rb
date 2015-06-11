#read input from input.md, apply the renderer.rb file to it, and send it to output_file.html.

require_relative 'renderer'
require_relative 'chunk_maker'
require_relative 'header_machine'
require_relative 'list_machine'
require_relative 'paragraph_machine'

class Chisel
  def initialize(input)
    @input = input
    #@output = output
    @renderer = Renderer.new(input).formatter
  end

  def call
    @output.write(@renderer.formatter(@input))
  end

end

# if __FILE__ == $0
#   $LOAD_PATH.unshift(File.expand_path("..", __FILE__))
#
#   input = File.open(ARGV[0], "r")
#   output = File.open(ARGV[1], "w")
#
#   chisel = Chisel.new(input)
#   output.write(chisel.result)
# end


input = "You just have to **try** the *cheesecake*
1. please
2. now
* hello
* stop"
chisler = Chisel.new(input)
chisler