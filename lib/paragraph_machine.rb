class ParagraphMachine
  def self.convert(input)
    return input if input[0] == "#"
    "<p>\n" + input + "\n</p>"
  end
end