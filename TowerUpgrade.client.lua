
-- TOWER UPGRADE MOBILE BUTTON
-- Place inside StarterPlayerScripts as a LocalScript

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local upgradeEvent = ReplicatedStorage:WaitForChild("UpgradeTowerEvent")

local gui = Instance.new("ScreenGui")
gui.Name = "TowerUpgradeGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local button = Instance.new("TextButton")
button.Name = "UpgradeButton"
button.Size = UDim2.new(0, 190, 0, 55)
button.Position = UDim2.new(1, -205, 1, -165)
button.BackgroundColor3 = Color3.fromRGB(170, 90, 255)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Font = Enum.Font.GothamBold
button.Text = "UPGRADE TOWER"
button.Parent = gui

button.Activated:Connect(function()
    local mouse = player:GetMouse()
    local target = mouse.Target

    if target and target.Name == "SciFiTower" then
        upgradeEvent:FireServer(target)
    else
        button.Text = "SELECT A TOWER!"
        task.wait(1)
        button.Text = "UPGRADE TOWER"
    end
end)

print("Tower Upgrade Button Loaded!")
