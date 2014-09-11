local class = require 'libs/middleclass'

R90 = class('R90')

function R90:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
end

function R90:next_state ()
	return self:conditions ()
end

function R90:conditions ()
	local a, b, c = self:neighbourhood ()
	if self.state == false then
		if a and b and c then
			return false
		end
		if a and b and c == false then
			return true
		end
		if a and b == false and c then
			return false
		end
		if a and b == false and c == false then
			return true
		end
		if a == false and b and c then
			return true
		end
		if a == false and b and c == false then
			return false
		end
		if a == false and b == false and c then
			return true
		end
		if a == false and b == false and c == false then
			return false
		end
	else
		return true
	end
end

function R90:neighbourhood ()
	local a,b,c

	function coordinate_state (x, y)
		if self.board.present[x] == nil then
			return false
		end
		if self.board.present[x][y] == nil then
			return false
		end
		return self.board.present[x][y].state
	end

	a = coordinate_state(self.x-1,self.y-1)
	b = coordinate_state(self.x  ,self.y-1)
	c = coordinate_state(self.x+1,self.y-1)

	return a, b, c
end