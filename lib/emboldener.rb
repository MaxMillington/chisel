class Emboldener
  def self.convert(input)
    @counter = 0
    broken_down_input = input.chars
    broken_down_input.map.with_index do |character, index|
      if character == "*"
        check_character_count(index, broken_down_input, character)
      else
        character
      end
    end.join("")
  end

  def self.check_character_count(index, input, character)
    @counter += 1 if (character == "*" && (input[index + 1] == "*" || input[index - 1] == "*"))
    if input[index - 1] == "*" && @counter == 2
      "<strong>"
    elsif input[index - 1] == "*" && @counter == 4
      @counter = 0
      "</strong>"
    else
      character unless (input[index + 1] == "*")
    end
  end
end