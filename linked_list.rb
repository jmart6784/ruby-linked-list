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
end

class LinkedList
  # Initialize class create list array
  def initialize
    @ary = []
  end

  # Return list
  def list
    @ary
  end

  # Append value to list
  def append(value)
    @ary << Node.new(value)
  end

  # Prepend value ti list
  def prepend(value)
    @ary.unshift(Node.new(value))
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
      str += "(#{node.value}) -> "
    end

    return str

  end

  # Insert new node at given index
  def insert_at(value, index)
    new_node = Node.new(value)
    @ary.insert(index, new_node)
  end

  # Rermove node at given index
  def remove_at(index)
    @ary.delete_at(index)
  end

  # Update next node after mutation
  def update_nodes
    
  end

end

l = LinkedList.new

l.prepend(0)
l.append(2)
l.insert_at(5, 1)

l.remove_at(1)

puts l.list.inspect