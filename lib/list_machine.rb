require 'pry'

class ListMachine
  def self.convert(input)
    new_input = input.split("/n")
    flag = 0
    converted_inputs = []
    new_input.each.with_index do |element,index|
      if element.start_with?("* ") && flag == 0
        flag += 1
        formatted_element = "<ul><li>#{element.slice(2..-1)}</li>"
        converted_inputs << formatted_element
      elsif element.start_with?("* ") && flag > 0
        converted_inputs << "<li>#{element.slice(2..-1)}</li>"
      else
        converted_inputs << element
      end
      if flag > 0 && (index+1 == new_input.length)
      formatted_element = "</ul>"
      converted_inputs << formatted_element
      end
    end
    converted_inputs.join("")
  end
end


