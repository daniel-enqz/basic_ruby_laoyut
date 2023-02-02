require 'pry-byebug'

class Node
  attr_accessor :value, :next_node
  def initialize(value)
    @value = value
    @next_node = nil
  end

  def to_s
    puts "Found! Value: #{@value} in LinkedList"
  end
end


class LinkedList
  attr_accessor :head

  def initialize
    @head = nil
  end


  def find(value)
    node = @head

    return node if node.value == value

    until theres_not_right?(node)
      return node.to_s if node.value == value

      node = node.next_node
    end

    puts "#{value} not found in #{self}"
  end


  def find_tail
    node = @head

    return node if theres_not_right?(node)

    until theres_not_right?(node)
      node = node.next_node
    end

    node
  end

  def append(value)
    if @head
      find_tail.next_node = Node.new(value)
    else
      @head = Node.new(value)
    end
  end

  def append_after(target, value)
    node = find(target)

    return unless node

    old_next                 = node.next_node
    node.next_node           = Node.new(value)
    node.next_node.next_node = old_next
  end

  def delete(value)
    node = @head

    if node.value == value
      @head = node.next_node
      return
    end

    until theres_not_right?(node)
      if node.next_node.value == value
        node.next_node = node.next_node.next_node
        return
      end

      node = node.next_node
    end

    puts "#{value} not found in #{self}"
  end

  def print
    node = @head
    puts node.to_s

    until theres_not_right?(node)
      node = node.next_node
      puts node.to_s
    end
  end

  private

  def theres_not_right?(node)
    !node.next_node
  end
end


list = LinkedList.new
list.append(23)
list.append(65)
list.append(45)
list.append(21)
list.append(34)

list.delete(21)
list.append_after(65, 99)
list.print
