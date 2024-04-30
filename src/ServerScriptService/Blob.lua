local Blob = {}

local Coordinate = require "Coordinate"

function Blob.new(blobType, blobColour)
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

function Blob.ContainsTile(blob, coordinate)
	for i = 1, #blob.lifeTiles do
		if Coordinate.ToString(blob.lifeTiles[i]) == Coordinate.ToString(coordinate) then
			return true
		end
	end
	return false
end

function Blob.PrintTiles(blob)
	local tilesToString = ""
	for i = 1, #blob.tiles do
		tilesToString = tilesToString .. Coordinate.ToString(blob.tiles[i])
	end
	print(tilesToString)
end

return Blob