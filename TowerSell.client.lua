local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local event = ReplicatedStorage:WaitForChild("SellTowerEvent")

local selectedTower = nil

local gui = Instance.new("ScreenGui")
gui.Name = "TowerSellGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 150, 0, 50)
button.Position = UDim2.new(1, -165, 1, -120)
button.BackgroundColor3 = Color3.fromRGB(180, 50, 50)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Text = "SELL TOWER"
button.Parent = gui

local mouse = player:GetMouse()

mouse.Button1Down:Connect(function()
    local target = mouse.Target
    if not target then return end

    local model = target:FindFirstAncestorOfClass("Model")
    local towers = workspace:FindFirstChild("Towers")

    if model and towers and model.Parent == towers then
        selectedTower = model
    end
end)

button.Activated:Connect(function()
    if selectedTower and selectedTower.Parent then
        event:FireServer(selectedTower)
        selectedTower = nil
    end
end)
