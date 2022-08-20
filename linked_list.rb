class LinkedList
  attr_reader :size, :head, :tail
  def initialize
    @size = 0
    @head = nil
    @tail = nil
  end
  
  def append_node(value)
    previous_tail = node_at_index(@size)
    @tail = Node.new(value)
    @head = @tail if @head == nil
    previous_tail.nextNode = @tail
    @size += 1
  end

  def prepend_node(value)
    @head = Node.new(value, @head)

    if @size == 0
      @tail = @head
    else
      @tail = node_at_index(@size)
    end
    @size += 1
  end

  def node_at_index(index)
    if index > 0
      current_node = @head
  
      (index - 1).times { |node| current_node = current_node.nextNode unless current_node.nextNode == nil }
  
      return current_node
    else
      puts "Invalid Number"
    end
  end

  def pop
    node_before_tail = node_at_index(@size-1)

    if @tail = node_before_tail.nextNode
      @tail = node_before_tail
      node_before_tail.nextNode = nil
    end
    @size -= 1
  end

  def list_contains?(value)
    current_node = @head

    (@size).times do |i|
      if current_node.value == value
        return true
      else
        current_node = current_node.nextNode unless current_node.nextNode == nil
      end
    end

    return false
  end

  def find(value)
    current_node = @head

    (@size).times do |i|
      if current_node.value == value
        return "Index: #{i+1}"
      else
        current_node = current_node.nextNode unless current_node.nextNode == nil
      end
    end

    return "No such value"
  end

  def list_to_s
    current_node = @head
    array = []

    (@size).times do |i|
      if current_node.nextNode != nil
        array << "(#{current_node.value}) -> "
        current_node = current_node.nextNode
      else
        array << "nil"
      end
    end
    p array.join('')
  end

end

class Node
  attr_reader :value
  attr_accessor :nextNode
  def initialize(value=nil, nextNode=nil)
    @value = value
    @nextNode = nextNode
  end
end

list = LinkedList.new
list.prepend_node(8)
list.prepend_node(7)
list.prepend_node(6)
list.prepend_node(5)
list.prepend_node(4)
list.prepend_node(3)
list.prepend_node(2)
list.prepend_node(1)
list.append_node(9)
p "Does the list contain it? #{list.list_contains?(9)}"
list.pop
p "Does the list contain it? #{list.list_contains?(9)}"
p "Tail: #{list.tail.value}"
p "Head: #{list.head.value}"
p "List Size: #{list.size}"
p list.find(32)
p list.find(8)
list.list_to_s