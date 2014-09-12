Gol.static.patterns = {}
Gol.static.patterns.name ={}
Gol.static.patterns.list ={}

table.insert(Gol.static.patterns.name, "dot")
table.insert(Gol.static.patterns.list,{
	{1}
})

table.insert(Gol.static.patterns.name, "square")
table.insert(Gol.static.patterns.list,{
	{1, 1},
	{1, 1}
})

table.insert(Gol.static.patterns.name, "line")
table.insert(Gol.static.patterns.list,{
	{1, 1, 1}
})

table.insert(Gol.static.patterns.name, "ship")
table.insert(Gol.static.patterns.list,{
	{0, 1, 0},
	{0, 0, 1},
	{1, 1, 1},
})

table.insert(Gol.static.patterns.name, "frog")
table.insert(Gol.static.patterns.list,{
	{0, 1, 1, 1},
	{1, 1, 1, 0}
})

table.insert(Gol.static.patterns.name, "galaxy")
table.insert(Gol.static.patterns.list,{
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

table.insert(Gol.static.patterns.name, "flower")
table.insert(Gol.static.patterns.list,{
	{0, 1, 1, 1, 0},
	{1, 0, 1, 0, 1},
	{0, 1, 1, 1, 0},
})

table.insert(Gol.static.patterns.name, "clock")
table.insert(Gol.static.patterns.list,{
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