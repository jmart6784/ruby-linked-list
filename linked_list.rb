# Create Node class
class Node
  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end

  def value
    @value
  end

  def next_node
    @next_node
  end

  def set_next_node(value)
    @next_node = value
  end
end

class LinkedList
  # Initialize class create list array
  def initialize
    @ary = []
  end

  # Update next node after mutation
  def update_nodes
    i = 0

    @ary.each do |node|
      i += 1

      if @ary[i].nil?
        node.set_next_node(nil)
      else
        node.set_next_node(@ary[i].value)        
      end

    end
  end

  # Return linked list
  def list
    @ary
  end

  # Append value to list
  def append(value)
    @ary[@ary.length - 1].set_next_node(value)

    @ary << Node.new(value)
  end

  # Prepend value in list
  def prepend(value)
    @ary.unshift(Node.new(value))

    update_nodes
  end

  # return list length
  def size
    @ary.length
  end

  # Return first node in list
  def head
    @ary[0]
  end

  # Return last node in list
  def tail
    @ary[@ary.length - 1]
  end

  # Return node at given index
  def at(index)
    @ary[index]
  end

  # Remove last element from list
  def pop
    @ary.pop
    @ary[@ary.length - 1].set_next_node(nil)
  end

  # Return trur or false depending if value is present
  def contains?(value)

    i = 0

    loop do

      if @ary[i].value === value
        return true
        break
      elsif i >= @ary.length - 1 && @ary[i].value != value
        return false
        break
      else
        i += 1
      end

    end

  end

  # Find index of given value else return nil
  def find(value) 
    i = 0

    loop do

      if @ary[i].value === value
        return i
        break
      elsif i >= @ary.length - 1 && @ary[i].value != value
        return nil
        break
      else
        i += 1
      end

    end
  end

  # Print linked list as a string
  def to_s

    str = ""

    @ary.each do |node|
      if node.next_node.nil?
        str += "(#{node.value}) -> nil"
      else
        str += "(#{node.value}) -> "
      end
    end

    return str

  end

  # Insert new node at given index
  def insert_at(value, index)
    new_node = Node.new(value)
    @ary.insert(index, new_node)

    update_nodes
  end

  # Rermove node at given index
  def remove_at(index)
    @ary.delete_at(index)
    update_nodes
  end

end

l = LinkedList.new

l.prepend(0)
l.append(2)
l.append(3)
l.append(21)
l.insert_at(5, 1)

puts "Raw Linked list array object:"
puts l.list.inspect

puts "Linked list as a pretty string:"
puts l.to_s

puts "Linked list size #{l.size}"
puts "Linked list head #{l.head.inspect}"
puts "Linked list tail #{l.tail.inspect}"
puts "Linked list node at index 1 #{l.at(1).inspect}"
puts "Return true or false if 5 is present in linked list: #{l.contains?(5)}"
puts "Find index of 21 else return nil: #{l.find(21)}"