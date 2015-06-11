class ParagraphMachine
  def self.convert(input)
    new.convert(input)
  end

  def convert(input)
    return input if input[0] == "#"
    "<p>\n" + input + "\n</p>"
  end

  def handles?(*)
    true
  end
end