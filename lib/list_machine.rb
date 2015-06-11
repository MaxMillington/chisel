require 'pry'

class ListMachine
  def self.convert(input)
    new.convert(input)
  end

  def convert(input)
    lines = input.split("\n")
    groups_of_lists = lines.slice_when do |line, next_line|
      is_a_list_item?(line) != is_a_list_item?(next_line)
    end
    render_lists(groups_of_lists).join("\n")
  end

  def handles?(chunk)
    is_a_list_item?(chunk)
  end

  private

  def render_lists(groups_of_lists)
    groups_of_lists.flat_map do |group|
      if is_a_list_item?(group.first)
        render_list(group)
      else
        group
      end
    end
  end

  def wrap_in_li_tags(group)
    group.map do |line|
      line_without_prefix = line.split(" ").drop(1).join(" ")
      "<li>#{line_without_prefix}</li>"
    end
  end

  def is_a_list_item?(line)
    ordered_list_item?(line) || unordered_list_item?(line)
  end

  def render_list(group)
    if ordered_list_item?(group.first)
      tag = "ol"
    else
      tag = "ul"
    end
    ["<#{tag}>"] + wrap_in_li_tags(group) + ["</#{tag}>"]
  end

  def prefix_for(line)
    line.split(" ").first
  end

  def ordered_list_item?(line)
    prefix = prefix_for(line)
    prefix_except_trailing_dot = prefix[0..-2]
    is_numeric?(prefix_except_trailing_dot) && prefix.end_with?(".")
  end

  def unordered_list_item?(line)
    prefix_for(line) == "*"
  end

  def is_numeric?(string)
    string.chars.all? do |char|
      ("0".."9").include?(char)
    end
  end
end


