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
    listed_results = ListMachine.convert(results)
    emboldeneed_results = Emboldener.convert(listed_results)
    Emphasizer.convert(emboldeneed_results)

  end

  def renderer_for(chunk)
    @sub_renderers.find { |renderer| renderer.handles?(chunk) }
  end
end

# renderer = Renderer.new('# My Life in Desserts
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
# 3. The Third Man' ,[HeaderMachine.new, ListMachine.new, ParagraphMachine.new])
#
# p renderer.formatter
