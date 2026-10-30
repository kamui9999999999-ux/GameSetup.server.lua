
-- TOWER DEFENSE HUD
-- Sci-Fi Co-op | Easy Mode
-- Place inside StarterPlayerScripts as a LocalScript

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local gameState = ReplicatedStorage:WaitForChild("GameState")
local cash = player:WaitForChild("leaderstats"):WaitForChild("Cash")

local gui = Instance.new("ScreenGui")
gui.Name = "TowerDefenseHUD"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local function makeLabel(name, text, position, size)
    local label = Instance.new("TextLabel")
    label.Name = name
    label.Size = size
    label.Position = position
    label.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
    label.BackgroundTransparency = 0.15
    label.TextColor3 = Color3.fromRGB(0, 255, 255)
    label.TextScaled = true
    label.Font = Enum.Font.GothamBold
    label.Text = text
    label.Parent = gui
    return label
end

local cashLabel = makeLabel(
    "CashLabel", "CASH: 500",
    UDim2.new(0, 15, 0, 15),
    UDim2.new(0, 180, 0, 45)
)

local hpLabel = makeLabel(
    "BaseHPLabel", "BASE HP: 1000",
    UDim2.new(0, 15, 0, 65),
    UDim2.new(0, 180, 0, 45)
)

local waveLabel = makeLabel(
    "WaveLabel", "WAVE: 1",
    UDim2.new(0, 15, 0, 115),
    UDim2.new(0, 180, 0, 45)
)

local function updateHUD()
    cashLabel.Text = "CASH: " .. cash.Value
    hpLabel.Text = "BASE HP: " .. gameState.BaseHP.Value
    waveLabel.Text = "WAVE: " .. gameState.Wave.Value
end

cash.Changed:Connect(updateHUD)
gameState.BaseHP.Changed:Connect(updateHUD)
gameState.Wave.Changed:Connect(updateHUD)

updateHUD()

print("Tower Defense HUD Loaded!")
