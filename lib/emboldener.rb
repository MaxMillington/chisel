class Emboldener
  def self.convert(input)
    stars = input.split
    stars.map do |word|
      if word[0,2] != "**"
        word
      else
        "<strong>#{word.delete "*"}</strong>"
      end
    end.join(" ")
  end
end

