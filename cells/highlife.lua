local class = require 'libs/middleclass'

Hl = class('Hl')

function Hl:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
end

function Hl:next_state ()
	return self:conditions ()
end

function Hl:conditions ()
	if self.state then
		if self:neighbourhood () == 2 or self:neighbourhood () == 3 then
			return true
		else
			return false
		end
	else
		if self:neighbourhood () == 3 or self:neighbourhood () == 6 then
			return true
		else
			return false
		end
	end
end

function Hl:neighbourhood ()
	local a,b,c,d,e,f,g,h

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
	b = coordinate_state(self.x-1,self.y)
	c = coordinate_state(self.x-1,self.y+1)
	d = coordinate_state(self.x,self.y+1)
	e = coordinate_state(self.x,self.y-1)
	f = coordinate_state(self.x+1,self.y-1)
	g = coordinate_state(self.x+1,self.y)
	h = coordinate_state(self.x+1,self.y+1)

	local ret = 0
	local ta = {a,b,c,d,e,f,g,h}

	for k, v in ipairs(ta) do
		if v then
			ret = ret + 1
		end
	end

	return ret
end