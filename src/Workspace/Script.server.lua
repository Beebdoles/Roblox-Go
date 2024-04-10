local grid = {}

for i = 1, 10 do
	local column  = {}
	for j = 1, 10 do
		local value = tostring(Random.new():NextInteger(0, 1))
		table.insert(column, value)
	end
	table.insert(grid, column)
end

for i = 1, 10 do
	local values = ""
	for j = 1, 10 do
		values = values .. grid[i][j] .. " "
		local part = Instance.new("Part")
		part.Size = Vector3.new(1, 1, 1)
		if grid[i][j] == "1" then
			part.Color = Color3.new(0, 0, 0)
		else
			part.Color = Color3.new(1, 1, 1)
		end
		part.Parent = workspace
		part.Anchored = true
		part.Position = Vector3.new(j, 1, i)
	end
	print(values)
end

print(grid)