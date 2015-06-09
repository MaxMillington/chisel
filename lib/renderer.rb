require_relative 'chunk_maker'
require_relative 'paragraph_machine'
require_relative 'header_machine'

class Renderer
  attr_reader :chunks

  def initialize(input)
    @chunks = ChunkMaker.new.chunk_it(input)
  end

  def iterator
    result = @chunks.map do |chunk|
      if header?(chunk)
        HeaderMachine.converter(chunk)
      else
        ParagraphMachine.convert(chunk)
      end
    end
  end

  #build a machine that iterates through the result of my iterator
  #give that machine the ability to convert *txt* into <em>txt</em>
  #give it the ability to convert **txt** into <strong>txt</strong>


  def header?(chunk)
    chunk[0] == "#"
  end

end

# input = "You just have to try the cheesecake"
# renderer = Renderer.new(input)
# p renderer.iterator