local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Board = require(ReplicatedStorage.Board)


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

local board1 = Board.new(19, board)

for i = 1, board1.size do
    for j = 1, board1.size do
        local stone = ReplicatedStorage.Stone:Clone()

        if board1.data[i][j] == "w" then
            stone.Color = Color3.new(1, 1, 1)
        elseif board1.data[i][j] == "b" then
            stone.Color = Color3.new(0, 0, 0)
        else
            stone.Transparency = 1
        end

        stone.Parent = workspace
        stone.Anchored = true
        stone.CanCollide = false
        stone.Position = Vector3.new(j * stone.Size.X, stone.Size.Y/2, i * stone.Size.X)
    end
end