local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Board = require(ReplicatedStorage.Board)
local Blob = require(ReplicatedStorage.Blob)
local Coordinate = require(ReplicatedStorage.Coordinate)

local row1 = {"0", "0", "0", "0", "0", "b", "b", "w", "w", "b", "0", "0", "0", "0", "0", "0", "b", "b", "b"}
local row2 = {"0", "0", "0", "0", "0", "b", "w", "0", "w", "b", "0", "0", "0", "0", "0", "0", "b", "w", "w"}
local row3 = {"0", "0", "0", "b", "b", "b", "w", "0", "w", "b", "b", "0", "0", "b", "0", "b", "b", "b", "w"}
local row4 = {"0", "b", "b", "w", "w", "w", "w", "0", "w", "w", "b", "0", "0", "0", "0", "b", "b", "w", "w"}
local row5 = {"0", "b", "0", "b", "w", "0", "0", "0", "0", "w", "b", "0", "0", "0", "0", "b", "w", "w", "0"}
local row6 = {"0", "b", "0", "b", "b", "w", "w", "0", "w", "b", "0", "0", "0", "0", "0", "b", "w", "0", "0"}
local row7 = {"0", "0", "b", "0", "b", "b", "w", "w", "w", "b", "0", "0", "0", "0", "0", "b", "b", "w", "0"}
local row8 = {"b", "b", "0", "b", "0", "b", "w", "b", "b", "b", "b", "0", "0", "0", "0", "b", "w", "0", "0"}
local row9 = {"w", "w", "b", "b", "b", "w", "w", "b", "w", "b", "b", "0", "b", "b", "b", "b", "w", "0", "0"}
local row10 = {"w", "0", "w", "b", "w", "w", "w", "w", "w", "b", "b", "b", "w", "b", "w", "b", "w", "w", "0"}
local row11 = {"0", "w", "w", "b", "b", "w", "b", "w", "w", "w", "b", "w", "w", "w", "w", "w", "w", "0", "w"}
local row12 = {"w", "0", "w", "b", "w", "w", "b", "b", "b", "b", "b", "b", "b", "b", "b", "w", "b", "w", "w"}
local row13 = {"0", "w", "b", "b", "b", "w", "b", "w", "w", "b", "w", "w", "b", "b", "w", "w", "b", "b", "b"}
local row14 = {"0", "0", "w", "w", "w", "w", "w", "0", "w", "w", "w", "w", "w", "b", "w", "w", "b", "0", "0"}
local row15 = {"0", "0", "0", "w", "w", "b", "w", "w", "w", "w", "b", "w", "b", "b", "b", "w", "b", "0", "0"}
local row16 = {"0", "w", "w", "w", "b", "b", "b", "b", "w", "b", "b", "b", "w", "w", "w", "w", "b", "0", "0"}
local row17 = {"w", "w", "b", "b", "0", "b", "0", "b", "b", "b", "w", "b", "b", "w", "w", "b", "b", "0", "0"}
local row18 = {"w", "b", "0", "0", "b", "0", "0", "0", "b", "w", "w", "w", "b", "w", "b", "b", "0", "0", "0"}
local row19 = {"w", "b", "b", "0", "0", "0", "0", "0", "b", "b", "w", "w", "w", "w", "w", "b", "0", "0", "0"}

local board = {row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, row12, row13, row14, row15, row16, row17, row18, row19}

local board1 = Board.new(19, nil)
board1.data = board
Board.ToString(board1)

print(board1.size)
print(Board.VerifyAndCompute(board1))

Board.ScanForGroups(board1, "w")
print(board1.neutralScore + board1.whiteScore + board1.blackScore)

print("-----new test-----")

local row2_1 = {"0", "0", "0"}
local row2_2 = {"w", "0", "w"}
local row2_3 = {"0", "0", "0"}

local board2 = Board.new(3, {row2_1, row2_2, row2_3})
print(Board.VerifyAndCompute(board2))
Board.ScanForGroups(board2, "w")
print(Blob.PrintTiles(board2.Groups[2]))
print(board2.Groups[1].liberties)


print("fini")