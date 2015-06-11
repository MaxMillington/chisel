require_relative 'chunk_maker'
require_relative 'paragraph_machine'
require_relative 'header_machine'
require_relative 'emphasizer'
require_relative 'emboldener'
require_relative 'list_machine'

class Renderer
  attr_reader :chunks

  def initialize(input)
    @chunks = ChunkMaker.new.chunk_it(input)
  end

  def iterator
    @chunks.map do |chunk|
      if header?(chunk)
        HeaderMachine.convert(chunk)
      else
        ParagraphMachine.convert(chunk)
      end
    end
  end

  def formatter
    results = iterator.join
    listed_results = ListMachine.convert(results)
    emboldened_results = Emboldener.convert(listed_results)
    emphasized_results = Emphasizer.convert(emboldened_results)
  end

  def header?(chunk)
    chunk[0] == "#"
  end

end

input = "You just have to **try** the *cheesecake*
1. please
2. please"
renderer = Renderer.new(input)
p renderer.formatter