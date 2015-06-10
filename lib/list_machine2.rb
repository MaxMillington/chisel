require 'pry'

class ListMachine
  def self.convert(input)
    new_input = input.split("/n")
    flag = 0
    converted_inputs = []
    new_input.each.with_index do |element,index|
      if element.start_with?("* ") && flag == 0
        flag += 1
        converted_inputs << "<ul><li>#{element.slice(2..-1)}</li>"
      elsif element.start_with?("* ") && flag > 0
        converted_inputs << "<li>#{element.slice(2..-1)}</li>"
      elsif element.start_with?("#{1..9}") && flag == 0
        flag += 1
        converted_inputs << "<ol><li>#{element.slice(2..-1)}</li>"
      elsif element.start_with?("#{1..9}") && flag > 0
        converted_inputs << "<li>#{element.slice(2..-1)}</li>"
      else
        converted_inputs << element
      end
      if flag > 0 && (index+1 == new_input.length)
        converted_inputs << "</ul>"
      end
    end
    converted_inputs.join("")
  end
end


