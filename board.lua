local class = require 'libs/middleclass'

Board = class('Board')

function Board:initialize (cell_class)
	Board.xsize = 160
	Board.ysize = 120
	Board.cell_class = cell_class

	Board.colors = {
		{0,0,0},
		{0,0,255},
		{255,0,0},
		{0,255,0},
		{0, 185, 15},
		{255, 255, 0},
		{255, 0, 255},
		{0, 255, 255},
		{255, 255, 48}
	}

	Board.present = {}
	for x=1, Board.xsize do
		Board.present[x] = {}
		for y=1, Board.ysize do
			Board.present[x][y] = Board.cell_class:new(0, x, y, self)
		end
	end

	Board.future = {}
	for x=1, Board.xsize do
		Board.future[x] = {}
		for y=1, Board.ysize do
			Board.future[x][y] = Board.cell_class:new(0, x, y, self)
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
			Board.future[x][y] = Board.cell_class:new(0, x, y, self)
		end
	end
end

function Board:draw ()
	for x=1, Board.xsize do
		for y=1, Board.ysize do
			if Board.present[x][y].state then
			    love.graphics.setColor( Board.colors[Board.present[x][y].state + 1][1], Board.colors[Board.present[x][y].state + 1][2], Board.colors[Board.present[x][y].state + 1][3])
			    love.graphics.rectangle( "fill", (x * 5) - 5, (y * 5) -5, 4, 4 )
			end
		end
	end
end

function Board:add_cell (x, y, state)
	Board.present[x][y] = Board.cell_class:new(state, x, y, self)
end

