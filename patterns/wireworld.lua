WireWorld.static.patterns = {}
WireWorld.static.patterns.name ={}
WireWorld.static.patterns.list ={}

table.insert(WireWorld.static.patterns.name, "wire")
table.insert(WireWorld.static.patterns.list,{
	{1}
})

table.insert(WireWorld.static.patterns.name, "electron")
table.insert(WireWorld.static.patterns.list,{
	{2}
})


table.insert(WireWorld.static.patterns.name, "diode")
table.insert(WireWorld.static.patterns.list,{
	{0, 0, 0, 1, 1, 0, 0, 0, 0},
	{1, 1, 1, 1, 0, 1, 1, 1, 1},
	{0, 0, 0, 1, 1, 0, 0, 0, 0}
})