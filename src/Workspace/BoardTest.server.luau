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

local BoardSize19 = Instance.new("Part")
BoardSize19.Parent = workspace
BoardSize19.Size = Vector3.new(board1.size * 2.1, 1, board1.size * 2.1)
BoardSize19.CFrame = CFrame.new(10, 0, 10) * CFrame.Angles(0, math.rad(90), 0)
BoardSize19.Anchored = true
BoardSize19.Color = Color3.new(0.803921, 0.556862, 0.258823)
BoardSize19.Material = Enum.Material.Wood

local boardDecoElements: Model = Instance.new("Model")
boardDecoElements.Parent = workspace

for i = 1, board1.size do
    for j = 1, board1.size do
        local stoneHolderPart: Part = Instance.new("Part")
        stoneHolderPart.Color = Color3.new(1, 1, 1)
        stoneHolderPart.Size = Vector3.new(2, 2, 2)
        stoneHolderPart.Anchored = true
        stoneHolderPart.CanCollide = false
        stoneHolderPart.Transparency = 1
        stoneHolderPart.Name = tostring(i) .. " " .. tostring(j)

        stoneHolderPart.Position = Vector3.new(i * 2, 1, j * 2)
        stoneHolderPart.Parent = boardDecoElements
        local click = ReplicatedStorage.ChooseStonePos:Clone()
        click.Parent = stoneHolderPart
    end
end

local decoBar: Part = Instance.new("Part")
decoBar.Color = Color3.new(0, 0, 0)
decoBar.Size = Vector3.new((board1.size - 1) * 2, 0.1, 0.1)

for i = 1, board1.size do
    local barClone = decoBar:Clone()
    barClone.Name = "decoBar"
    barClone.CFrame = CFrame.new(board1.size + 1, 1.5, i * 2)
    barClone.Parent = boardDecoElements
end

for i = 1, board1.size do
    local barClone = decoBar:Clone()
    barClone.Name = "decoBar"
    barClone.CFrame = CFrame.new(i * 2, 1.5, board1.size + 1) * CFrame.Angles(0, math.rad(90), 0)
    barClone.Parent = boardDecoElements
end

local centrePart1 = Instance.new("Part")
centrePart1.Size = Vector3.new(0.1, 0.1, 0.1)
centrePart1.Anchored = true
centrePart1.CanCollide = false
centrePart1.CFrame = CFrame.new(20, 0, 20)
boardDecoElements.PrimaryPart = centrePart1
centrePart1.Parent = boardDecoElements

for _, v in pairs(boardDecoElements:GetChildren()) do
    if v.Name ~= "Part" then
        local weld = Instance.new("WeldConstraint")
        weld.Parent = centrePart1
        weld.Part0 = weld.Parent
        weld.Part1 = v
        v.Anchored = false
    end
end

boardDecoElements.PrimaryPart:PivotTo(BoardSize19.CFrame * CFrame.new(0, -1, 0))

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

        stone.Size = Vector3.new(2, 0.748, 2) --1.966 prev z value, offset of 0.1615, r = 1.983
        stone.Parent = boardDecoElements:FindFirstChild(tostring(i) .. " " .. tostring(j))
        stone.Anchored = true
        stone.CanCollide = false

        stone.Position = boardDecoElements:FindFirstChild(tostring(i) .. " " .. tostring(j)).Position
        stone.Position += Vector3.new(0, stone.Size.Y, 0)
    end
end
