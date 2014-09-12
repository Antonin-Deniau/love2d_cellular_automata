Maze.static.patterns = {}
Maze.static.patterns.name ={}
Maze.static.patterns.list ={}

table.insert(Maze.static.patterns.name, "dot")
table.insert(Maze.static.patterns.list,{
	{1}
})

table.insert(Maze.static.patterns.name, "square")
table.insert(Maze.static.patterns.list,{
	{1, 1},
	{1, 1}
})

table.insert(Maze.static.patterns.name, "line")
table.insert(Maze.static.patterns.list,{
	{1, 1, 1}
})

table.insert(Maze.static.patterns.name, "ship")
table.insert(Maze.static.patterns.list,{
	{0, 1, 0},
	{0, 0, 1},
	{1, 1, 1},
})

table.insert(Maze.static.patterns.name, "frog")
table.insert(Maze.static.patterns.list,{
	{0, 1, 1, 1},
	{1, 1, 1, 0}
})

table.insert(Maze.static.patterns.name, "galaxy")
table.insert(Maze.static.patterns.list,{
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

table.insert(Maze.static.patterns.name, "flower")
table.insert(Maze.static.patterns.list,{
	{0, 1, 1, 1, 0},
	{1, 0, 1, 0, 1},
	{0, 1, 1, 1, 0},
})

table.insert(Maze.static.patterns.name, "clock")
table.insert(Maze.static.patterns.list,{
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