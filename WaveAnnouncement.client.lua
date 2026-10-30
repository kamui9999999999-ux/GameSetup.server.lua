local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local wave = ReplicatedStorage:WaitForChild("GameState"):WaitForChild("Wave")

local gui = Instance.new("ScreenGui")
gui.Name = "WaveAnnouncement"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0.6, 0, 0.1, 0)
label.Position = UDim2.new(0.2, 0, 0.15, 0)
label.BackgroundTransparency = 1
label.TextColor3 = Color3.fromRGB(0, 200, 255)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Text = "WAVE " .. wave.Value
label.Parent = gui

wave.Changed:Connect(function(newWave)
    label.Text = "WAVE " .. newWave
end)
