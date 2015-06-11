class HeaderMachine
  def self.convert(input)
    new.convert(input)
  end

  def convert(input)
    count = input.split(" ").first.count("#")
    return input if count == 0
    "<h#{count}>" + input.slice(count..-1) + " </h#{count}>"
  end

  def handles?(chunk)
    is_a_header?(chunk)
  end

  private

  def is_a_header?(chunk)
    chunk.start_with?("#")
  end
end