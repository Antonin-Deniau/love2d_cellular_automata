local class = require 'libs/middleclass'

Patterns = class('Patterns')

function Patterns:initialize (obj)
	Patterns:load(obj)
end

function Patterns:load (theobj)
	Patterns.list = {}
	Patterns.name = {}
	table.insert(Patterns.name, "erase")
	table.insert(Patterns.list,{
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0}
	})

	Patterns.current = 1
	for i=0, #theobj.patterns.list do

		table.insert(Patterns.name, theobj.patterns.name[i])
		table.insert(Patterns.list, theobj.patterns.list[i])
	end
end

function Patterns:paste (the_board, x, y)
	for px=1, #Patterns.list[Patterns.current] do
		for py=1, #Patterns.list[Patterns.current][px] do
			the_board:add_cell((x - x%5)/5 + py , (y - y%5)/5 + px, Patterns.list[Patterns.current][px][py])
		end
	end
end

function Patterns:change (button)
	if button == 'wu' then
		if Patterns.current == #Patterns.list then
			Patterns.current = 1
		else
			Patterns.current = Patterns.current + 1
		end
	end
	if button == 'wd' then
		if Patterns.current == 1 then
			Patterns.current = #Patterns.list
		else
			Patterns.current = Patterns.current - 1
		end
	end

	return Patterns.name[Patterns.current]
end
