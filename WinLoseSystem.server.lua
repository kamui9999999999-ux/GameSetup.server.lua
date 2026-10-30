
-- TOWER DEFENSE: WIN / LOSE SYSTEM
-- Place inside ServerScriptService

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local gameState = ReplicatedStorage:WaitForChild("GameState")

local resultEvent = ReplicatedStorage:FindFirstChild("GameResultEvent")

if not resultEvent then
    resultEvent = Instance.new("RemoteEvent")
    resultEvent.Name = "GameResultEvent"
    resultEvent.Parent = ReplicatedStorage
end

local MAX_WAVE = 20
local gameEnded = false

local function endGame(result)
    if gameEnded then return end
    gameEnded = true

    gameState:SetAttribute("GameResult", result)
    resultEvent:FireAllClients(result)

    print("GAME RESULT: " .. result)
end

gameState.BaseHP.Changed:Connect(function()
    if gameState.BaseHP.Value <= 0 then
        endGame("LOSE")
    end
end)

gameState.Wave.Changed:Connect(function()
    if gameState.Wave.Value > MAX_WAVE then
        endGame("WIN")
    end
end)

if gameState.BaseHP.Value <= 0 then
    endGame("LOSE")
end

print("Win / Lose System Loaded!")
