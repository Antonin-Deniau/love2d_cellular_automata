Hl.static.patterns = {}
Hl.static.patterns.name ={}
Hl.static.patterns.list ={}

table.insert(Hl.static.patterns.name, "replicator")
table.insert(Hl.static.patterns.list,{
	{0, 0, 1, 1, 1},
	{0, 1, 0, 0, 1},
	{1, 0, 0, 0, 1},
	{1, 0, 0, 1, 0},
	{1, 1, 1, 0, 0},
})

table.insert(Hl.static.patterns.name, "dot")
table.insert(Hl.static.patterns.list,{
	{1}
})

table.insert(Hl.static.patterns.name, "square")
table.insert(Hl.static.patterns.list,{
	{1, 1},
	{1, 1}
})

table.insert(Hl.static.patterns.name, "line")
table.insert(Hl.static.patterns.list,{
	{1, 1, 1}
})

table.insert(Hl.static.patterns.name, "ship")
table.insert(Hl.static.patterns.list,{
	{0, 1, 0},
	{0, 0, 1},
	{1, 1, 1},
})

table.insert(Hl.static.patterns.name, "frog")
table.insert(Hl.static.patterns.list,{
	{0, 1, 1, 1},
	{1, 1, 1, 0}
})

table.insert(Hl.static.patterns.name, "galaxy")
table.insert(Hl.static.patterns.list,{
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

table.insert(Hl.static.patterns.name, "flower")
table.insert(Hl.static.patterns.list,{
	{0, 1, 1, 1, 0},
	{1, 0, 1, 0, 1},
	{0, 1, 1, 1, 0},
})

table.insert(Hl.static.patterns.name, "clock")
table.insert(Hl.static.patterns.list,{
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