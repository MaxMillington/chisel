#read input from input.md, apply the renderer.rb file to it, and send it to output_file.html.

require 'renderer'
require 'chunk_maker'
require 'header_machine'
require 'list_machine'
require 'paragraph_machine'

class Chisel
  def initialize(input)
    @input = input
    # @output = output
    @renderer = Renderer.new
  end

  def call
    @output.write(@renderer.render)
  end

end

if __FILE__ == $0
  $LOAD_PATH.unshift(File.expand_path("..", __FILE__))

  input = File.read(ARGV[0])
  output = File.open(ARGV[1], "w")

  chisel = Chisel.new(input)
  output.write(chisel.result)
end
