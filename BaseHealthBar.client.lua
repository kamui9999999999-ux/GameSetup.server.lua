local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local baseHP = ReplicatedStorage:WaitForChild("GameState"):WaitForChild("BaseHP")

local gui = Instance.new("ScreenGui")
gui.Name = "BaseHealthBar"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local bar = Instance.new("TextLabel")
bar.Size = UDim2.new(0, 250, 0, 45)
bar.Position = UDim2.new(0.5, -125, 0, 70)
bar.BackgroundColor3 = Color3.fromRGB(20, 25, 45)
bar.TextColor3 = Color3.fromRGB(0, 255, 180)
bar.TextScaled = true
bar.Font = Enum.Font.GothamBold
bar.Parent = gui

local function update()
    bar.Text = "BASE HP: " .. baseHP.Value
end

update()
baseHP.Changed:Connect(update)
