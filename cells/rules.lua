local class = require 'libs/middleclass'

Rules = class('Rules')

function Rules:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
	self.the_rules = {false,false,false,true,true,true,true,false}
end

function Rules:next_state ()
	return self:conditions ()
end

function Rules:conditions ()
	if self.state == false then
		local a,b,c = self:neighbourhood ()

		if a and b and c then
			return self.the_rules[1]
		end
		if a and b and c == false then
			return self.the_rules[2]
		end
		if a and b == false and c then
			return self.the_rules[3]
		end
		if a and b == false and c == false then
			return self.the_rules[4]
		end
		if a == false and b and c then
			return self.the_rules[5]
		end
		if a == false and b and c == false then
			return self.the_rules[6]
		end
		if a == false and b == false and c then
			return self.the_rules[7]
		end
		if a == false  and b == false  and c == false  then
			return self.the_rules[8]
		end
	else
		return true
	end
end

function Rules:neighbourhood ()
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

	return a,b,c
end