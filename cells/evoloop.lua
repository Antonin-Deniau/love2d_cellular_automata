local class = require 'libs/middleclass'

Evoloop = class('Evoloop')

require 'patterns/evoloop'

function Evoloop:initialize (state, x, y, board)
	self.state = state
	self.x = x
	self.y = y
	self.board = board
end

Evoloop.colors = {
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

function Evoloop:next_state ()
	return self:conditions ()
end

Evoloop.static.transitions = {
	{{0,0,0,0,1}, 2}, {{1,0,2,0,2}, 1}, {{1,1,2,7,2}, 7}, {{2,0,1,7,2}, 2}, {{2,1,3,2,2}, 2}, {{4,0,1,2,5}, 0},
	{{0,0,0,0,4}, 3}, {{1,0,2,1,1}, 1}, {{1,1,2,7,3}, 5}, {{2,0,2,0,2}, 2}, {{2,1,4,2,2}, 2}, {{4,0,1,6,2}, 0},
	{{0,0,0,1,2}, 2}, {{1,0,2,1,2}, 1}, {{1,1,3,2,2}, 1}, {{2,0,2,0,3}, 2}, {{2,1,6,2,2}, 2}, {{4,0,2,1,2}, 0},
	{{0,0,0,1,5}, 2}, {{1,0,2,1,3}, 1}, {{1,1,3,3,2}, 1}, {{2,0,2,0,5}, 2}, {{2,1,7,2,2}, 2}, {{4,0,2,1,5}, 0},
	{{0,0,0,2,1}, 2}, {{1,0,2,2,1}, 1}, {{1,1,5,4,2}, 4}, {{2,0,2,0,6}, 5}, {{2,2,2,2,4}, 2}, {{4,0,2,2,2}, 1},
	{{0,0,0,2,4}, 2}, {{1,0,2,2,4}, 4}, {{1,1,5,7,2}, 7}, {{2,0,2,0,7}, 3}, {{2,2,2,2,7}, 2}, {{4,0,2,3,2}, 1},
	{{0,0,0,4,2}, 2}, {{1,0,2,2,7}, 7}, {{1,1,6,2,4}, 4}, {{2,0,2,1,2}, 2}, {{2,2,2,3,4}, 2}, {{4,0,2,6,2}, 6},
	{{0,0,0,4,5}, 2}, {{1,0,2,3,2}, 4}, {{1,1,6,2,7}, 7}, {{2,0,2,1,5}, 2}, {{2,2,2,3,7}, 2}, {{4,0,3,1,2}, 0},
	{{0,0,0,7,5}, 2}, {{1,0,2,4,1}, 4}, {{1,2,2,2,4}, 4}, {{2,0,2,2,1}, 2}, {{2,2,2,4,3}, 2}, {{4,0,3,2,2}, 1},
	{{0,0,1,0,2}, 2}, {{1,0,2,4,2}, 4}, {{1,2,2,2,7}, 7}, {{2,0,2,2,2}, 2}, {{2,2,2,4,4}, 2}, {{5,0,0,0,2}, 5},
	{{0,0,2,1,4}, 1}, {{1,0,2,4,3}, 4}, {{1,2,2,4,3}, 4}, {{2,0,2,2,3}, 2}, {{2,2,2,7,3}, 2}, {{5,0,0,1,2}, 5},
	{{0,0,2,1,7}, 1}, {{1,0,2,5,1}, 1}, {{1,2,2,7,3}, 7}, {{2,0,2,3,2}, 3}, {{2,2,2,7,7}, 2}, {{5,0,0,2,1}, 5},
	{{0,0,2,3,2}, 2}, {{1,0,2,5,2}, 7}, {{1,2,3,2,4}, 4}, {{2,0,2,4,2}, 2}, {{2,2,3,2,4}, 3}, {{5,0,0,2,3}, 2},
	{{0,1,1,2,2}, 1}, {{1,0,2,5,4}, 3}, {{1,2,3,2,7}, 7}, {{2,0,2,4,5}, 2}, {{2,2,3,2,7}, 3}, {{5,0,0,2,4}, 5},
	{{0,1,2,1,2}, 1}, {{1,0,2,5,7}, 7}, {{1,2,4,2,6}, 6}, {{2,0,2,5,2}, 5}, {{3,0,0,0,1}, 3}, {{5,0,0,2,7}, 5},
	{{0,1,2,3,2}, 1}, {{1,0,2,7,1}, 7}, {{1,2,4,3,3}, 3}, {{2,0,2,6,2}, 0}, {{3,0,0,0,2}, 2}, {{5,0,0,4,2}, 5},
	{{0,1,2,4,2}, 1}, {{1,0,2,7,2}, 7}, {{1,2,6,2,7}, 6}, {{2,0,2,6,5}, 0}, {{3,0,0,0,3}, 2}, {{5,0,0,7,2}, 5},
	{{0,1,2,4,5}, 1}, {{1,0,2,7,3}, 5}, {{2,0,0,0,1}, 2}, {{2,0,2,7,2}, 2}, {{3,0,0,0,4}, 3}, {{5,0,2,0,2}, 2},
	{{0,1,2,5,2}, 6}, {{1,0,5,1,2}, 1}, {{2,0,0,0,2}, 2}, {{2,0,2,7,5}, 2}, {{3,0,0,0,7}, 4}, {{5,0,2,0,5}, 2},
	{{0,1,2,6,2}, 6}, {{1,0,5,4,2}, 4}, {{2,0,0,0,4}, 2}, {{2,0,3,1,2}, 2}, {{3,0,0,1,2}, 3}, {{5,0,2,1,2}, 5},
	{{0,1,2,7,2}, 1}, {{1,0,5,7,2}, 7}, {{2,0,0,0,5}, 2}, {{2,0,3,2,2}, 2}, {{3,0,0,3,2}, 2}, {{5,0,2,1,5}, 2},
	{{0,1,2,7,5}, 1}, {{1,0,6,2,1}, 1}, {{2,0,0,0,6}, 0}, {{2,0,3,4,2}, 2}, {{3,0,0,4,2}, 1}, {{5,0,2,4,2}, 5},
	{{0,1,3,4,2}, 1}, {{1,0,6,2,4}, 4}, {{2,0,0,0,7}, 1}, {{2,0,3,4,5}, 2}, {{3,0,1,0,2}, 1}, {{5,0,2,7,2}, 5},
	{{0,1,3,7,2}, 1}, {{1,0,6,2,7}, 7}, {{2,0,0,1,2}, 2}, {{2,0,3,7,2}, 2}, {{3,0,1,2,5}, 0}, {{5,0,3,1,2}, 0},
	{{0,1,4,2,2}, 1}, {{1,1,1,1,2}, 1}, {{2,0,0,1,5}, 2}, {{2,0,4,1,2}, 2}, {{3,0,2,1,2}, 3}, {{6,0,2,0,2}, 2},
	{{0,1,4,2,5}, 1}, {{1,1,1,2,2}, 1}, {{2,0,0,2,1}, 2}, {{2,0,4,2,2}, 2}, {{3,0,2,4,2}, 3}, {{6,0,2,1,2}, 2},
	{{0,1,4,3,2}, 1}, {{1,1,1,2,4}, 4}, {{2,0,0,2,2}, 2}, {{2,0,4,4,2}, 2}, {{3,0,2,5,2}, 1}, {{6,0,2,2,2}, 0},
	{{0,1,4,3,5}, 1}, {{1,1,1,2,5}, 1}, {{2,0,0,2,3}, 2}, {{2,0,5,1,2}, 2}, {{3,0,2,7,2}, 3}, {{6,0,2,4,2}, 2},
	{{0,1,4,4,2}, 1}, {{1,1,1,2,7}, 7}, {{2,0,0,2,4}, 2}, {{2,0,5,4,2}, 5}, {{3,0,3,3,2}, 1}, {{6,0,2,7,2}, 2},
	{{0,1,4,6,2}, 1}, {{1,1,1,6,2}, 1}, {{2,0,0,2,6}, 0}, {{2,0,5,7,2}, 5}, {{3,1,2,1,2}, 3}, {{6,1,2,2,2}, 0},
	{{0,1,7,2,2}, 1}, {{1,1,2,1,2}, 1}, {{2,0,0,2,7}, 2}, {{2,0,6,1,2}, 5}, {{3,1,2,4,2}, 3}, {{6,2,2,2,4}, 0},
	{{0,1,7,2,5}, 1}, {{1,1,2,1,3}, 1}, {{2,0,0,3,2}, 4}, {{2,0,6,2,1}, 2}, {{3,1,2,5,2}, 1}, {{6,2,2,2,7}, 0},
	{{0,1,7,5,6}, 1}, {{1,1,2,1,5}, 1}, {{2,0,0,4,2}, 3}, {{2,0,6,4,2}, 5}, {{3,1,2,7,2}, 3}, {{7,0,1,0,2}, 0},
	{{0,1,7,6,2}, 1}, {{1,1,2,2,2}, 1}, {{2,0,0,4,5}, 2}, {{2,0,6,7,2}, 5}, {{3,2,4,2,4}, 3}, {{7,0,1,1,2}, 0},
	{{0,1,7,7,2}, 1}, {{1,1,2,2,4}, 4}, {{2,0,0,5,4}, 5}, {{2,0,7,1,2}, 2}, {{3,2,4,2,5}, 1}, {{7,0,1,2,2}, 0},
	{{1,0,0,0,1}, 1}, {{1,1,2,2,7}, 7}, {{2,0,0,5,7}, 5}, {{2,0,7,2,2}, 2}, {{3,2,4,2,7}, 3}, {{7,0,1,2,5}, 0},
	{{1,0,0,1,2}, 1}, {{1,1,2,3,2}, 1}, {{2,0,0,6,2}, 0}, {{2,0,7,7,2}, 2}, {{3,2,5,2,7}, 1}, {{7,0,1,6,2}, 0},
	{{1,0,0,2,1}, 1}, {{1,1,2,4,2}, 4}, {{2,0,0,7,2}, 2}, {{2,1,1,2,2}, 2}, {{3,2,7,2,7}, 3}, {{7,0,2,1,2}, 0},
	{{1,0,0,2,4}, 4}, {{1,1,2,4,3}, 4}, {{2,0,0,7,5}, 2}, {{2,1,2,2,2}, 2}, {{4,0,0,0,0}, 1}, {{7,0,2,1,5}, 0},
	{{1,0,0,2,7}, 7}, {{1,1,2,5,2}, 7}, {{2,0,1,0,2}, 2}, {{2,1,2,2,3}, 2}, {{4,0,0,0,2}, 1}, {{7,0,2,2,2}, 1},
	{{1,0,1,2,1}, 1}, {{1,1,2,5,4}, 3}, {{2,0,1,1,2}, 2}, {{2,1,2,2,4}, 2}, {{4,0,1,0,2}, 0}, {{7,0,2,3,2}, 0},
	{{1,0,1,2,4}, 4}, {{1,1,2,5,7}, 7}, {{2,0,1,2,2}, 2}, {{2,1,2,2,7}, 2}, {{4,0,1,1,2}, 0}, {{7,0,2,6,2}, 6},
	{{1,0,1,2,7}, 7}, {{1,1,2,6,2}, 6}, {{2,0,1,4,2}, 2}, {{2,1,2,3,2}, 3}, {{4,0,1,2,2}, 0}, {{7,0,3,1,2}, 0},
}



function Evoloop:conditions ()

	local a,b,c,d,e = self:neighbourhood_state()


	if self.state == 0  and self:neighbourhood_zero() == true then
		return 0
	end


	for k, v in pairs(Evoloop.transitions) do
		if v[1][1] == a then
			if v[1][2] == b then
				if v[1][3] == c then
					if v[1][4] == d then
						if v[1][5] == e then
							return v[2]
						end
					end
				end
			end

			if v[1][2] == e then
				if v[1][3] == b then
					if v[1][4] == c then
						if v[1][5] == d then
							return v[2]
						end
					end
				end
			end
			if v[1][2] == d then
				if v[1][3] == e then
					if v[1][4] == b then
						if v[1][5] == c then
							return v[2]
						end
					end
				end
			end
			if v[1][2] == c then
				if v[1][3] == d then
					if v[1][4] == e then
						if v[1][5] == b then
							return v[2]
						end
					end
				end
			end
		end
	end

	if self.state == 8 then
		return 0
	end

	if self:neighbourhood_eight() >= 1 then
		if self:neighbourhood_other() >= 1 then
			if self.state == 0 or self.state == 1 then
				return 8
			end
		else
			if self.state == 0 then
				return 0
			end
			if self.state == 1 then
				return 1
			end
		end
		if self.state == 2 or self.state == 3 or self.state == 5 then
			return 0
		end
		if self.state == 4 or self.state == 6 or self.state == 7 then
			return 1
		end
	end

	if self.state == 0 then
		return 0
	end

	return 8
end

function Evoloop:neighbourhood_other ()
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

	local ret = 0
	local a = coordinate_state(self.x,self.y+1)
	local b = coordinate_state(self.x+1,self.y)
	local c = coordinate_state(self.x,self.y-1)
	local d = coordinate_state(self.x-1,self.y)

	for k, v in pairs({a,b,c,d}) do
		if v == 2 or  v == 3  or  v == 4  or  v == 5 or  v == 6  or v == 7  then
			ret = ret + 1
		end
	end

	return ret
end

function Evoloop:neighbourhood_zero ()
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

	local ret = 0
	local a = coordinate_state(self.x,self.y+1)
	local b = coordinate_state(self.x+1,self.y)
	local c = coordinate_state(self.x,self.y-1)
	local d = coordinate_state(self.x-1,self.y)

	if a == 0 and  b == 0  and  c == 0  and  d == 0 then
		return true
	else
		return false
	end
end

function Evoloop:neighbourhood_eight ()
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

	local ret = 0
	local a = coordinate_state(self.x,self.y+1)
	local b = coordinate_state(self.x+1,self.y)
	local c = coordinate_state(self.x,self.y-1)
	local d = coordinate_state(self.x-1,self.y)

	for k, v in pairs({a,b,c,d}) do
		if v == 8 then
			ret = ret + 1
		end
	end

	return ret
end


function Evoloop:neighbourhood_state ()
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

	local a = coordinate_state(self.x,self.y-1)
	local b = coordinate_state(self.x+1,self.y)
	local c = coordinate_state(self.x,self.y+1)
	local d = coordinate_state(self.x-1,self.y)


	return self.state, a,b,c,d
end
