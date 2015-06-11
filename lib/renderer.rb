require_relative 'chunk_maker'
require_relative 'paragraph_machine'
require_relative 'header_machine'
require_relative 'emphasizer'
require_relative 'emboldener'
require_relative 'list_machine'

class Renderer
  attr_reader :chunks

  def initialize(input, sub_renderers)
    @chunks = ChunkMaker.new.chunk_it(input)
    @sub_renderers = sub_renderers
  end

  def render
    formatter
  end

  def iterator
    @chunks.map do |chunk|
      renderer_for(chunk).convert(chunk)
    end
  end

  def formatter
    results = iterator.join
    new_results = Emboldener.convert(results)
    Emphasizer.convert(new_results)

  end

  def renderer_for(chunk)
    @sub_renderers.find { |renderer| renderer.handles?(chunk) }
  end
end