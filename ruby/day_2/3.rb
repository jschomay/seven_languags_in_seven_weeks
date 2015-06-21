class Tree
  attr_accessor :children, :node_name

  def initialize (name, children=[])
    @children = children
    @node_name = name
  end

  def visit_all (&block)
    visit &block
    children.each { |c| c.visit_all &block }
  end

  def visit (&block)
    block.call self
  end
end


# tree = Tree.new("Ruby",
#                 [Tree.new("Reia"),
#                   Tree.new("MacRuby")] )

tree = Tree.new( {'grandpa' => {'dad' => {'child 1' => {}, 'child 2' => {} }, 'uncle' => {'child 3' => {}, 'child 4' => {} } } } )

puts "visiting a node"
tree.visit { |node| puts node.node_name }
puts

puts "visiting tree"
tree.visit_all { |node| puts node.node_name }
