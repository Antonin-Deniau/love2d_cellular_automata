local class = require 'libs/middleclass'

Patterns = class('Patterns')

function Patterns:initialize ()
	Patterns.list = {}
	Patterns.name = {}

	table.insert(Patterns.name, "dot")
	table.insert(Patterns.list,{
		{1}
	})

	table.insert(Patterns.name, "square")
	table.insert(Patterns.list,{
		{1, 1},
		{1, 1}
	})

	table.insert(Patterns.name, "line")
	table.insert(Patterns.list,{
		{1, 1, 1}
	})

	table.insert(Patterns.name, "ship")
	table.insert(Patterns.list,{
		{0, 1, 0},
		{0, 0, 1},
		{1, 1, 1},
	})

	table.insert(Patterns.name, "frog")
	table.insert(Patterns.list,{
		{0, 1, 1, 1},
		{1, 1, 1, 0}
	})

	table.insert(Patterns.name, "galaxy")
	table.insert(Patterns.list,{
		{1, 1, 0, 1, 1, 1, 1, 1, 1},
		{1, 1, 0, 1, 1, 1, 1, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 0, 0},
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 0, 0, 0, 0, 0, 1, 1},
		{0, 0, 0, 0, 0, 0, 0, 1, 1},
		{1, 1, 1, 1, 1, 1, 0, 1, 1},
		{1, 1, 1, 1, 1, 1, 0, 1, 1}
	})

	table.insert(Patterns.name, "flower")
	table.insert(Patterns.list,{
		{0, 1, 1, 1, 0},
		{1, 0, 1, 0, 1},
		{0, 1, 1, 1, 0},
	})

	table.insert(Patterns.name, "clock")
	table.insert(Patterns.list,{
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0 ,0},
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0 ,0},
		{0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0 ,0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0},
		{1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1 ,1},
		{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 ,0},
		{0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0 ,0},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0},
		{0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0 ,0},
		{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0 ,0},
		{1, 1, 1, 0, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1 ,1},
		{0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 ,0},
		{0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0 ,0},
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0 ,0},
		{0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0 ,0}
	})

	Patterns.current = 1
end


function Patterns:paste (the_board, x, y)
	for px=1, #Patterns.list[Patterns.current] do
		for py=1, #Patterns.list[Patterns.current][px] do
			if Patterns.list[Patterns.current][px][py] == 1 then
				the_board:add_true((x - x%5)/5 + px - 1, (y - y%5)/5 + py - 1)
			end
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
