DNN.static.patterns = {}
DNN.static.patterns.name ={}
DNN.static.patterns.list ={}

table.insert(DNN.static.patterns.name, "dot")
table.insert(DNN.static.patterns.list,{
	{1}
})

table.insert(DNN.static.patterns.name, "square")
table.insert(DNN.static.patterns.list,{
	{1, 1},
	{1, 1}
})

table.insert(DNN.static.patterns.name, "line")
table.insert(DNN.static.patterns.list,{
	{1, 1, 1}
})

table.insert(DNN.static.patterns.name, "clock")
table.insert(DNN.static.patterns.list,{
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

table.insert(DNN.static.patterns.name, "negative clock")
table.insert(DNN.static.patterns.list,{
	{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1 ,1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1 ,1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1 ,1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1, 1, 1, 0},
	{1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0 ,0, 1, 1, 1},
	{0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ,1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1 ,1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1 ,1, 1, 1, 1},
	{0, 1, 1, 1, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1 ,1, 1, 1, 0},
	{1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0 ,0, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1 ,1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 0, 0, 1, 1, 1 ,1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1 ,1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 1, 1, 1 ,1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
	{0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 0},
	{0, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 1, 0, 0},
})