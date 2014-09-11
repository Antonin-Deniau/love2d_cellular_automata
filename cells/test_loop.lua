local class = require 'libs/middleclass'

TestLoop = class('TestLoop')

function TestLoop:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
end

function TestLoop:next_state ()
	return self:conditions ()
end

function TestLoop:conditions ()
	--material :
	-- 0 void
	-- 1 solid

	-- dna :
	-- 3 front
	-- 4 left
	-- 5 right
	-- 5 new

	if self.state == 0 then
		return 0
	end

	if self.state == 1 then
		if self:neighbourhood (2) == 1 or self:neighbourhood (2) == 2 then
			return 2
		else
			return 1
		end
	end

	if self.state == 2 then
		return 3
	end
	if self.state == 3 then
		return 1
	end
end

function TestLoop:neighbourhood (state)
	local a,b,c,d

	function coordinate_state (x, y)
		if self.board.present[x] == nil then
			return 0
		end
		if self.board.present[x][y] == nil then
			return 0
		end
		return self.board.present[x][y].state
	end

	a = coordinate_state(self.x-1,self.y)
	b = coordinate_state(self.x,self.y+1)
	c = coordinate_state(self.x,self.y-1)
	d = coordinate_state(self.x+1,self.y)

	local ret = 0
	local ta = {a,b,c,d}

	for k, v in ipairs(ta) do
		if v == state then
			ret = ret + 1
		end
	end

	return ret
end