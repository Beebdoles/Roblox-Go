task.wait(10)
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Board = require(ReplicatedStorage.Board)


local row1 = {"w", "w", "0"}
local row2 = {"b", "b", "w"}
local row3 = {"0", "b", "b"}

local board = Board.new(3, {row1, row2, row3})

print(Board.VerifyAndCompute(board))
Board.ToString(board)
Board.ScanForGroups(board, "w")
Board.PrintGroups(board)
print(board.whiteScore .. " " .. board.whiteCount)
print(board.blackScore .. " " .. board.blackCount)
print(board.neutralScore)
print(board.neutralScore + board.blackScore + board.whiteScore)