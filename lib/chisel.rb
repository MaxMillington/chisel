#read input from input.md, apply the renderer.rb file to it, and send it to output_file.html.

require_relative 'renderer'
require_relative 'chunk_maker'
require 'pry'



class Chisel


  def initialize(input, output)
    @input = input
    @output = output
    @renderer = Renderer.new
  end

  def call
    binding.pry
    @output.write(@renderer.render)
  end

end

  if __FILE__ == $0
    to_be_converted = File.open(ARGV[0], "r")
    converted_file = File.open(ARGV[1], "w")


    # render = Renderer.new(to_be_converted, converted_file)
    # render.call
    # if ARGV[1]
    #   puts "Created #{ARGV[1]} rendering your markdown into html."
    #
    # else
    #   puts "created output.html rendering your markdown into html"
    # end


    chisel = Chisel.new(to_be_converted, converted_file)
    chisel.call

  end
