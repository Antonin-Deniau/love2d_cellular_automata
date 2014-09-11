local class = require 'libs/middleclass'

Rule110 = class('Rule110')

function Rule110:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
	self.the_rules = {false,true,true,false,true,true,true,false}
end

function Rule110:next_state ()
	return self:conditions ()
end

function Rule110:conditions ()
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

function Rule110:neighbourhood ()
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