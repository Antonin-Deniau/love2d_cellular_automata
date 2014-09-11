local class = require 'libs/middleclass'

Rule110 = class('Rule110')

function Rule110:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
	self.the_rules = {0,1,1,0,1,1,1,0}
end

function Rule110:next_state ()
	return self:conditions ()
end

function Rule110:conditions ()
	if self.state == 0 then
		local a,b,c = self:neighbourhood ()

		if a == 1 and b == 1 and c == 1 then
			return self.the_rules[1]
		end
		if a == 1 and b == 1 and c == 0 then
			return self.the_rules[2]
		end
		if a == 1 and b == 0 and c == 1 then
			return self.the_rules[3]
		end
		if a == 1 and b == 0 and c == 0 then
			return self.the_rules[4]
		end
		if a == 0 and b == 1 and c == 1 then
			return self.the_rules[5]
		end
		if a == 0 and b == 1 and c == 0 then
			return self.the_rules[6]
		end
		if a == 0 and b == 0 and c == 1 then
			return self.the_rules[7]
		end
		if a == 0  and b == 0  and c == 0  then
			return self.the_rules[8]
		end
	else
		return 1
	end
end

function Rule110:neighbourhood ()
	local a,b,c

	function coordinate_state (x, y)
		if self.board.present[x] == nil then
			return 0
		end
		if self.board.present[x][y] == nil then
			return 0
		end
		return self.board.present[x][y].state
	end

	a = coordinate_state(self.x-1,self.y-1)
	b = coordinate_state(self.x  ,self.y-1)
	c = coordinate_state(self.x+1,self.y-1)

	return a,b,c
end