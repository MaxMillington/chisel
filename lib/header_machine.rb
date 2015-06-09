class HeaderMachine
  def self.converter(input)
    count = input.split(" ").first.count("#")
    return input if count == 0
    "<h#{count}>" + input.slice(count..-1) + " <h#{count}>"
  end
end