
-- TOWER PLACEMENT MOBILE BUTTON
-- Place inside StarterPlayerScripts as a LocalScript

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local placeEvent = ReplicatedStorage:WaitForChild("PlaceTowerEvent")

local gui = Instance.new("ScreenGui")
gui.Name = "TowerPlacementGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Name = "PlaceTowerButton"
button.Size = UDim2.new(0, 180, 0, 55)
button.Position = UDim2.new(1, -195, 1, -90)
button.BackgroundColor3 = Color3.fromRGB(0, 180, 220)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Text = "BUY TOWER $250"
button.Parent = gui

button.Activated:Connect(function()
    placeEvent:FireServer(Vector3.new(10, 0, 10))
end)

print("Tower Placement Button Loaded!")
