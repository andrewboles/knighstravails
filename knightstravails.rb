class Node
	attr_accessor :moves, :position

	def initialize(position, moves = [])
		@position = position
		@moves = moves
	end
end


class BoardTree

	def knight_move(start_position, end_position, positions = [], move_chain = [start_position])
		positions << start_position if positions == []
		# puts "starting positions:"
		# p "#{positions}"
		temp_children =[]
		positions.size.times do |idx1|
			temp = create_child_moves(positions[idx1])
			temp.moves.size.times do |idx2|
				temp_children << temp.moves[idx2]
			end
			if temp.moves.include?(end_position)
				move_chain << temp.position
				
				break
			end
		end

		if temp_children.include?(end_position)
			move_chain << end_position
			move_chain
		else
			temp_children.delete(nil)
			knight_move(start_position, end_position, temp_children, move_chain)
		end

	end
		
	def create_child_moves(square)

		a = Node.new(square)
		a.moves[0] = [square[0]+2,square[1]+1]
		a.moves[1] = [square[0]+2,square[1]-1]
		a.moves[2] = [square[0]-2,square[1]+1]
		a.moves[3] = [square[0]-2,square[1]-1]
		a.moves[4] = [square[0]+1,square[1]+2]
		a.moves[5] = [square[0]+1,square[1]-2]
		a.moves[6] = [square[0]-1,square[1]+2]
		a.moves[7] = [square[0]-1,square[1]-2]

		8.times do |idx|
			a.moves[idx] = nil if ((a.moves[idx][0]<0 || a.moves[idx][0]>7) || (a.moves[idx][1]<0 || a.moves[idx][1]>7))
		end

		a.moves.delete(nil)

		return a
	end

end


board = BoardTree.new

position_example = [3,6]

p board.knight_move([0,0],[6,4])