local Coordinate = {}

function Coordinate.new(x, y)
	local self = {}

	self.x = x
	self.y = y
	return self
end

function Coordinate.ToString(coordinate)
	return "(" .. tostring(coordinate.x) .. ", " .. tostring(coordinate.y) .. ")"
end

return Coordinate