local Board = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Blob = require(ReplicatedStorage.Blob)
local Coordinate = require(ReplicatedStorage.Coordinate)

function Board.new(size, data)
	local self = {}
	self.size = size
	self.data = data

	self.blackCount = 0
	self.whiteCount = 0
	self.blackScore = 0
	self.whiteScore = 0

	self.isFinished = false

	self.blobStorage = nil
	self.Groups = {}	--groups of pieces
	self.TerritoryGroups = {}	--groups of non neutral territory
	return self
end

function Board.CheckBlobLiberties(board, boolGrid, colour, x, y)	--recursive check
	if x >= 1 and x <= board.size and y >= 1 and y <= board.size then
		if not boolGrid[x][y] then
			if board.data[x][y] == "0" then
				if not Blob.ContainsTile(board.blobStorage, Coordinate.new(x, y)) then
					board.blobStorage.liberties = board.blobStorage.liberties + 1
					table.insert(board.blobStorage.lifeTiles, Coordinate.new(x, y))
				end
			elseif board.data[x][y] == colour then
				boolGrid[x][y] = true
				table.insert(board.blobStorage.tiles, Coordinate.new(x, y))

				Board.CheckBlobLiberties(board, boolGrid, colour, x + 1, y)
				Board.CheckBlobLiberties(board, boolGrid, colour, x - 1, y)
				Board.CheckBlobLiberties(board, boolGrid, colour, x, y + 1)
				Board.CheckBlobLiberties(board, boolGrid, colour, x, y - 1)
			else
				boolGrid[x][y] = true
			end
		end
	end
end

function Board.ScanForGroups(board, colour)	--scans for groups of stones, adds them to board group list
	table.clear(board.Groups)	--empties the group table

	local boolGrid = {}
	for i = 1, board.size do
		boolGrid[i] = {}
		for j = 1, board.size do
			boolGrid[i][j] = false
		end
	end

	for i = 1, board.size do
		for j = 1, board.size do
			if not boolGrid[i][j] and board.data[i][j] == colour then
				board.blobStorage = Blob.new("group", colour)
				Board.CheckBlobLiberties(board, boolGrid, colour, i, j)
				table.insert(board.Groups, board.blobStorage)
			end
		end
	end
end

function Board.GetBlobInfo(board, boolGrid, x, y)	--recursive check
	if x >= 1 and x <= board.size and y >= 1 and y <= board.size then
		if not boolGrid[x][y] then
			if board.data[x][y] == "b" then
				board.blobStorage.bCount = board.blobStorage.bCount + 1
				table.insert(board.blobStorage.tiles, Coordinate.new(x, y))
				boolGrid[x][y] = true
			elseif board.data[x][y] == "w" then
				board.blobStorage.wCount = board.blobStorage.wCount + 1
				table.insert(board.blobStorage.tiles, Coordinate.new(x, y))
				boolGrid[x][y] = true
			else
				board.blobStorage.score = board.blobStorage.score + 1
				boolGrid[x][y] = true

				Board.GetBlobInfo(board, boolGrid, x + 1, y)
				Board.GetBlobInfo(board, boolGrid, x - 1, y)
				Board.GetBlobInfo(board, boolGrid, x, y + 1)
				Board.GetBlobInfo(board, boolGrid, x, y - 1)
			end
		end
	end
end

function Board.VerifyAndCompute(board)	--scans the entire board for territory and placed stones
	table.clear(board.TerritoryGroups)	--refreshes the territory groups list just in case
	board.isFinished = true

	local boolGrid = {}
	for i = 1, board.size do
		boolGrid[i] = {}
		for j = 1, board.size do
			boolGrid[i][j] = false
		end
	end

	for i = 1, board.size do
		for j = 1, board.size do
			if not boolGrid[i][j] then
				board.blobStorage = Blob.new("territory", "0")
				Board.GetBlobInfo(board, boolGrid, i, j)
				
				local action = true

				if board.blobStorage.bCount == 0 and board.blobStorage.wCount ~= 0 then
					board.whiteScore = board.whiteScore + board.blobStorage.score
				elseif board.blobStorage.wCount == 0 and board.blobStorage.bCount ~= 0 then
					board.blackScore = board.blackScore + board.blobStorage.score
				else
					action = false
					board.isFinished = false
				end

				if action then
					board.blackScore = board.blackScore + board.blobStorage.bCount
					board.blackCount = board.blackCount + board.blobStorage.bCount
					board.whiteScore = board.whiteScore + board.blobStorage.wCount
					board.whiteCount = board.whiteCount + board.blobStorage.wCount

					table.insert(board.TerritoryGroups, board.blobStorage)
				else
					for i = 1, #board.blobStorage.tiles do
						boolGrid[board.blobStorage.tiles[i].x][board.blobStorage.tiles[i].y] = false
					end
				end
			end
		end
	end
	return board.isFinished
end

function Board.PrintGroups(board)	--helper method
	for i = 1, #board.Groups do
		Blob.PrintTiles(board.Groups[i])
	end
end

function Board.PrintTerritories(board)	--helper method
	for i = 1, #board.TerritoryGroups do
		Blob.PrintTiles(board.TerritoryGroups[i])
	end
end

function Board.ToString(board)		--helper method
	for i = 1, board.size do
		local row = ""
		for j = 1, board.size do
			row = row .. board.data[i][j] .. " "
		end
		print(row)
	end
end

return Board