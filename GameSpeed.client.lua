local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local event = ReplicatedStorage:WaitForChild("ChangeGameSpeed")

local gui = Instance.new("ScreenGui")
gui.Name = "GameSpeedGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(1, -165, 0, 140)
button.BackgroundColor3 = Color3.fromRGB(0, 120, 200)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Text = "SPEED: 1x"
button.Parent = gui

local speeds = {"1x", "1.5x", "2x"}
local index = 1

button.Activated:Connect(function()
    event:FireServer()
    index += 1

    if index > #speeds then
        index = 1
    end

    button.Text = "SPEED: " .. speeds[index]
end)
