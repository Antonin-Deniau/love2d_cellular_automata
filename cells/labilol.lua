local class = require 'libs/middleclass'

Labilol = class('Labilol')

function Labilol:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
end

function Labilol:next_state ()
	return self:conditions ()
end

function Labilol:conditions ()
	if self.state == false then
		if self:neighbourhood () == 3 then
			return true
		else
			return false
		end
	else
		if self:neighbourhood () == (0 or 1) then
			return false
		end
		if self:neighbourhood () == (2 or 3 or 4) then
			return true
		end
		if self:neighbourhood () == (5 or 6 or 7 or 8) then
			return false
		end
	end
	return self.state
end

function Labilol:neighbourhood ()
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