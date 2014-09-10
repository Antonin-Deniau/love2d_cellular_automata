local class = require 'middleclass'

Gol = class('Gol')

function Gol:initialize ()
	Gol.xsize = 160
	Gol.ysize = 120


	local vertices = {
        {
            -- top-left corner (red-tinted)
            0, 0, -- position of the vertex
            0, 0, -- texture coordinate at the vertex position
            255, 255, 255 -- color of the vertex
        },
        {
            -- top-right corner (green-tinted)
            4, 0,
            0, 0, -- texture coordinates are in the range of [0, 1]
            255, 255, 255
        },
        {
            -- bottom-right corner (blue-tinted)
            4, 4,
            0, 0,
            255, 255, 255
        },
        {
            -- bottom-left corner (yellow-tinted)
            0, 4,
            0, 0,
            255, 255, 255
        },
    }
	Gol.cell = love.graphics.newMesh( vertices, nil, 'fan' )

	Gol.sb = {}
	for i=0, Gol.xsize do
		Gol.sb[i] = {}
		for j=0, Gol.ysize do
			Gol.sb[i][j] = false
		end
	end

	Gol.psb = {}
	for i=0, Gol.xsize do
		Gol.psb[i] = {}
		for j=0, Gol.ysize do
			Gol.psb[i][j] = false
		end
	end
end


function Gol:iterate ()
	for i=0, Gol.xsize do
		for j=0, Gol.ysize do
			if Gol:testcell(i, j) == 3 then
				Gol.psb[i][j] = true
			end
			if Gol:testcell(i, j) == 2 then
				Gol.psb[i][j] = Gol.sb[i][j]
			end
			if Gol:testcell(i, j) < 2 or Gol:testcell(i, j) > 3 then
				Gol.psb[i][j] = false
			end
		end
	end
	Gol.sb = Gol.psb
	Gol.psb = {}
	for i=0, Gol.xsize do
		Gol.psb[i] = {}
		for j=0, Gol.ysize do
			Gol.psb[i][j] = false
		end
	end
end

function Gol:draw ()
	for i=0, Gol.xsize do
		for j=0, Gol.ysize do
			if Gol.sb[i][j] then
				love.graphics.draw(Gol.cell, i * 5, j * 5)
			end
		end
	end
end

function Gol:add_true (x, y)
	Gol.sb[(x - x%5)/5][(y - y%5)/5] = true
end

function Gol:testcell (x, y)
	local a,b,c,d,e,f,g,h

	function the_coordinates(x, y)
		if Gol.sb[x] == nil then
			return false
		end
		if Gol.sb[x][y] == nil then
			return false
		end
		return Gol.sb[x][y]
	end

	a = the_coordinates(x-1,y-1)
	b = the_coordinates(x-1,y)
	c = the_coordinates(x-1,y+1)
	d = the_coordinates(x,y+1)
	e = the_coordinates(x,y-1)
	f = the_coordinates(x+1,y-1)
	g = the_coordinates(x+1,y)
	h = the_coordinates(x+1,y+1)

	local ret = 0
	local ta = {a,b,c,d,e,f,g,h}

	for k, v in ipairs(ta) do
		if v then
			ret = ret + 1
		end
	end

	return ret
end