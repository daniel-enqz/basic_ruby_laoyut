require "pry-byebug"

class Node
  attr_accessor :value, :next_node

  def initialize(value)
    @value     = value
    @next_node = nil
  end

  def to_s
    "Node: #{@value}"
  end
end

class LinkedList
  attr_accessor :head

  def initialize
    @heaed = nil
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
    node                     = find(target)

    return unless node

    old_next                 = node.next_node
    node.next_node           = Node.new(value)
    node.next_node.next_node = old_next
  end

  def find(value)
    node = @head

    return false if theres_not_right?(node)
    return node if node.value == value

    while (node = node.next_node)
      return node if node.value == value
    end


    until theres_not_right?(node)
      return node if node.value == value
      node = node.next_node
    end
  end

  def delete(value)
    if @head.value == value
      @head = head.next_node
      return
    end

    node           = find_before(value)
    node.next_node = node.next_node.next_node
  end

  def find_before(value)
    node = @head

    return false if theres_not_right?(node)
    return node  if node.next_node.value == value

    while (node = node.next)
      return node if node.next && node.next.value == value
    end
  end

  def print
    node = @head

    until theres_not_right?(node)
      puts node.to_s
      node = node.next_node
    end
  end


  private

  def theres_not_right?(node)
    !node.next_node
  end
end
