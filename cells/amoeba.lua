local class = require 'libs/middleclass'

Amoeba = class('Amoeba')

require 'patterns/amoeba'


function Amoeba:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
end

Amoeba.colors = {
	{0,0,0},
	{255,255,255}
}
--[[
Board.colors = {
	{0,0,0},
	{0,0,255},
	{255,0,0},
	{0,255,0},
	{0, 185, 15},
	{255, 255, 0},
	{255, 0, 255},
	{0, 255, 255},
	{255, 255, 48},
	{255, 48, 48}
}
]]
function Amoeba:next_state ()
	return self:conditions ()
end

function Amoeba:conditions ()
	if self.state  == 1 then
		if self:neighbourhood () == 1 or self:neighbourhood () == 3 or self:neighbourhood () == 5 or self:neighbourhood () == 8 then
			return 1
		else
			return 0
		end
	else
		if self:neighbourhood () == 3 or self:neighbourhood () == 5 or self:neighbourhood () == 7 then
			return 1
		else
			return 0
		end
	end
end

function Amoeba:neighbourhood ()
	local a,b,c,d,e,f,g,h

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
		if v == 1 then
			ret = ret + 1
		end
	end

	return ret
end