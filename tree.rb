class Tree
  def print(center, height)
    @center = center + height * 3
    @height = height
    print_top_section
    print_middle_section
    print_lower_section
    print_stem
  end

  def print_top_section
    print_triangle(0, @height - 1)
  end

  def print_middle_section
    print_triangle(1, @height)
  end

  def print_lower_section
    print_triangle(2, @height + 1)
  end

  def print_stem
    1.upto(@height) { |i| puts spaces(@center - (@height > 2 ? 1 : 0)) + stars(@height > 2 ? 3 : 1) }
  end

  def print_triangle(up_size, down_size)
    up_size.upto(down_size) { |i| puts spaces(@center - i) + stars(1 + (i * 2)) }
  end

  def spaces(amount)
    " " * amount
  end

  def stars(amount)
    "*" * amount
  end
end

def one_or_more(number)
  number < 1 ? 1 : number
end

def ask_user_center_and_height_of_tree
  print "Tree height (always will be multiplied by three): "
  height = one_or_more(gets.to_i)
  print "Center of the tree (the distance from the left side of the screen): "
  center = one_or_more(gets.to_i)
  return center, height
end

def clear_screen
  print "\e[2J\e[f"
end


center, height = ask_user_center_and_height_of_tree
clear_screen

Tree.new.print(center, height)
