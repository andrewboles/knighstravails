class Node
	attr_accessor :moves, :position, :parent_node

	def initialize(position, parent_node = nil, moves = [])
		@position = position
		@moves = moves
		@parent_node = parent_node
	end
end


class BoardTree

	def knight_move(start_position, end_position, positions = [], move_chain = [])
		if positions == []
			a = Node.new(start_position)
			positions << a
		end

		temp_children =[]
		positions.size.times do |idx1|
			temp = create_child_moves(positions[idx1])
			temp.moves.size.times do |idx2|
				temp_children << temp.moves[idx2]
			end
		end

		temp_children.delete(nil)
		temp_children.each do |child|
				if child.position == end_position
					puts "found match"
					next_parent = child.parent_node
					move_chain << child.position
					until next_parent == nil do
						move_chain.unshift(next_parent.position)
						next_parent = next_parent.parent_node
					end
					break
				end
			end

		if move_chain != []
			move_chain
		else
			knight_move(start_position, end_position, temp_children)
		end

	end
		
	def create_child_moves(square)
		a = square
		a.moves << Node.new([a.position[0]+2,a.position[1]+1],a)
		a.moves << Node.new([a.position[0]+2,a.position[1]-1],a)
		a.moves << Node.new([a.position[0]-2,a.position[1]+1],a)
		a.moves << Node.new([a.position[0]-2,a.position[1]-1],a)
		a.moves << Node.new([a.position[0]+1,a.position[1]+2],a)
		a.moves << Node.new([a.position[0]+1,a.position[1]-2],a)
		a.moves << Node.new([a.position[0]-1,a.position[1]+2],a)
		a.moves << Node.new([a.position[0]-1,a.position[1]-2],a)

		8.times do |idx|
			a.moves[idx] = nil if ((a.moves[idx].position[0]<0 || a.moves[idx].position[0]>7) || (a.moves[idx].position[1]<0 || a.moves[idx].position[1]>7))
		end

		a.moves.delete(nil)

		return a
	end

end


board = BoardTree.new

position_example = [3,6]

p board.knight_move([0,0],[4,7])



