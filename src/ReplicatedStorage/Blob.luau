local Blob = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Coordinate = require(ReplicatedStorage.Coordinate)

function Blob.new(blobType, blobColour)	--blobtype either "group" or "territory"
	local self = {}
	self.bCount = 0
	self.wCount = 0
	self.score = 0

	self.blobType = blobType
	self.blobColour = blobColour

	self.liberties = 0
	self.tiles = {}
	self.lifeTiles = {}
	return self
end

function Blob.ContainsTile(blob, coordinate)	--linear search for matching tile, O(n), screw binary search
	for i = 1, #blob.lifeTiles do
		if Coordinate.ToString(blob.lifeTiles[i]) == Coordinate.ToString(coordinate) then
			return true
		end
	end
	return false
end

function Blob.PrintTiles(blob)	--helper method
	local tilesToString = ""
	for i = 1, #blob.tiles do
		tilesToString = tilesToString .. Coordinate.ToString(blob.tiles[i])
	end
	print(tilesToString)
end

return Blob