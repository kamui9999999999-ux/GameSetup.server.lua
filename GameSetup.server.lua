
-- TOWER DEFENSE
-- Sci-Fi Co-op | Easy Mode
-- Place inside ServerScriptService

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- Game settings
local STARTING_CASH = 500
local STARTING_BASE_HP = 1000
local STARTING_WAVE = 1

-- Create shared game state
local gameState = Instance.new("Folder")
gameState.Name = "GameState"
gameState.Parent = ReplicatedStorage

local baseHP = Instance.new("IntValue")
baseHP.Name = "BaseHP"
baseHP.Value = STARTING_BASE_HP
baseHP.Parent = gameState

local wave = Instance.new("IntValue")
wave.Name = "Wave"
wave.Value = STARTING_WAVE
wave.Parent = gameState

local gameMode = Instance.new("StringValue")
gameMode.Name = "GameMode"
gameMode.Value = "Co-op"
gameMode.Parent = gameState

local difficulty = Instance.new("StringValue")
difficulty.Name = "Difficulty"
difficulty.Value = "Easy"
difficulty.Parent = gameState

-- Setup each player
local function setupPlayer(player)

    local leaderstats = Instance.new("Folder")
    leaderstats.Name = "leaderstats"
    leaderstats.Parent = player

    local cash = Instance.new("IntValue")
    cash.Name = "Cash"
    cash.Value = STARTING_CASH
    cash.Parent = leaderstats

    print(player.Name .. " joined Tower Defense!")
end

Players.PlayerAdded:Connect(setupPlayer)

-- Handle players already in the server
for _, player in ipairs(Players:GetPlayers()) do
    if not player:FindFirstChild("leaderstats") then
        setupPlayer(player)
    end
end

print("================================")
print("TOWER DEFENSE STARTED!")
print("Mode: SCI-FI CO-OP")
print("Difficulty: EASY")
print("Base HP: " .. baseHP.Value)
print("Starting Wave: " .. wave.Value)
print("================================")
