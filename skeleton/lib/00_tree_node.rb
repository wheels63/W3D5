require "byebug"

class PolyTreeNode
attr_reader :value, :parent, :children
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end

  def parent=(parent_node)
    if !parent.nil?
      parent.children.delete(self)
    end
    @parent = parent_node
    unless parent.nil? || parent.children.include?(self) 
        parent.children << self 
    end
  end

  def add_child(child_node)
    child_node.parent=(self)
  end
  
  def remove_child(child_node)
    raise "not a child" if !self.children.include?(child_node)
    child_node.parent=(nil)
  end

  # output is return self.value == target
  def dfs(target)
    return self if self.value == target # first base case
    # iterate through children array
    
    self.children.each do |child|
      search_result = child.dfs(target)
      return search_result unless search_result.nil?
    end

    nil
    # check each node if equals to target
    # 
    
    # return nil if target does not exist in root
    # return target if node == target
    # return nil if self == nil
    # root is a polytreenode instance with instance variables 
    # @children(A) = [b, c] where b and c are also polytreenode instances
    # @children(B) = [d,e]
  end

  def bfs(target)
    # create a queue
    queue = [self] 

    until queue.empty?
      removed_ele = queue.shift
      if removed_ele.value == target
        return removed_ele 
      end

      # grab children of the removed_ele
      queue.concat(removed_ele.children)
      
    end
    nil
  end
end

