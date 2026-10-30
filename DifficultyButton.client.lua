local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local event = ReplicatedStorage:WaitForChild("ChangeDifficulty")

local difficulties = {"Easy", "Normal", "Hard"}
local index = 1

local gui = Instance.new("ScreenGui")
gui.Name = "DifficultyGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 170, 0, 50)
button.Position = UDim2.new(1, -185, 0, 200)
button.BackgroundColor3 = Color3.fromRGB(50, 80, 150)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Text = "DIFFICULTY: Easy"
button.Parent = gui

button.Activated:Connect(function()
    index += 1

    if index > #difficulties then
        index = 1
    end

    local difficulty = difficulties[index]
    button.Text = "DIFFICULTY: " .. difficulty
    event:FireServer(difficulty)
end)
