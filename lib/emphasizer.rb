class Emphasizer
  def self.convert(input)
    @counter = 0
    input.chars.map do |character|
      if character == "*"
       check_character_count
      else
        character
      end
    end.join("")
  end

  def self.check_character_count
    if @counter.even?
      @counter += 1
      "<em>"
    else
      @counter += 1
      "</em>"
    end
  end
end