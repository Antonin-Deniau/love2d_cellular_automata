local class = require 'libs/middleclass'

Board = class('Board')

function Board:initialize (cell_class)
	Board.xsize = 160
	Board.ysize = 120
	Board.cell_class = cell_class

	local vertices = {
        {
            0, 0,
            0, 0,
            255, 255, 255
        },
        {
            4, 0,
            0, 0,
            255, 255, 255
        },
        {
            4, 4,
            0, 0,
            255, 255, 255
        },
        {
            0, 4,
            0, 0,
            255, 255, 255
        },
    }
	Board.cell = love.graphics.newMesh( vertices, nil, 'fan' )

	Board.present = {}
	for x=1, Board.xsize do
		Board.present[x] = {}
		for y=1, Board.ysize do
			Board.present[x][y] = Board.cell_class:new(false, x, y, self)
		end
	end

	Board.future = {}
	for x=1, Board.xsize do
		Board.future[x] = {}
		for y=1, Board.ysize do
			Board.future[x][y] = Board.cell_class:new(false, x, y, self)
		end
	end
end

function Board:change_cell (cell)
	Board.cell_class = cell
end

function Board:iterate ()
	for x=1, Board.xsize do
		for y=1, Board.ysize do
			Board.future[x][y].state = Board.present[x][y]:next_state()
		end
	end

	Board.present = Board.future
	Board.future = {}
	for x=1, Board.xsize do
		Board.future[x] = {}
		for y=1, Board.ysize do
			Board.future[x][y] = Board.cell_class:new(false, x, y, self)
		end
	end
end

function Board:draw ()
	for x=1, Board.xsize do
		for y=1, Board.ysize do
			if Board.present[x][y].state then
				love.graphics.draw(Board.cell, (x * 5) - 5, (y * 5) -5)
			end
		end
	end
end

function Board:add_true (x, y)
	Board.present[x][y] = Board.cell_class:new(true, x, y, self)
end

