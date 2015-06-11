class LinkMachine
  def self.convert(input)
    if input.chars.include?("[")
    a = input.chars.slice_when do |i, j|
      i == '[' || j == ')'
    end
    extracted_link = a.to_a[1].join
    link_arrary = extracted_link.split("](")
    "<a href=#{link_arrary[1]}>#{link_arrary[0]}</a>"
    else
      input
  end
  end
end


# string = "Charlie *don't* surf! [Apocalypse Now](http://www.imdb.com/title/tt0078788/)."
# p LinkMachine.convert(string)



# '[Apocalypse Now](http://www.imdb.com/title/tt0078788/)'
# '<a href="http://www.imdb.com/title/tt0078788/">Apocalypse Now</a>'