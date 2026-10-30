local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local baseHP = ReplicatedStorage:WaitForChild("GameState"):WaitForChild("BaseHP")

local gui = Instance.new("ScreenGui")
gui.Name = "BaseWarning"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local warning = Instance.new("TextLabel")
warning.Size = UDim2.new(0.7, 0, 0, 50)
warning.Position = UDim2.new(0.15, 0, 0.3, 0)
warning.BackgroundColor3 = Color3.fromRGB(150, 0, 0)
warning.TextColor3 = Color3.fromRGB(255, 255, 255)
warning.TextScaled = true
warning.Font = Enum.Font.GothamBold
warning.Text = "WARNING! BASE IS IN DANGER!"
warning.Visible = false
warning.Parent = gui

local function updateWarning()
    warning.Visible = baseHP.Value <= 300 and baseHP.Value > 0
end

updateWarning()
baseHP.Changed:Connect(updateWarning)
