#read input from input.md, apply the renderer.rb file to it, and send it to output_file.html.

require_relative '../lib/renderer'



class Chisel

  def initialize(input, output)
    @input = input
    @output = output
  end

  def call
  @input.render

  end
end

  if __FILE__ == $0
    to_be_converted = File.read(ARGV[0])
    converted_file = File.write(ARGV[1])


    render = Renderer.new(to_be_converted, converted_file)
    render.call
    if ARGV[1]
      puts "Created #{ARGV[1]} rendering your markdown into html."

    else
      puts "created output.html rendering your markdown into html"
    end


    chisel = Chisel.new(to_be_converted, converted_file)
    chisel.call

  end
