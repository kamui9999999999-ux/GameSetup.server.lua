local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local gameState = ReplicatedStorage:WaitForChild("GameState")
local waveValue = gameState:WaitForChild("Wave")

local rewardPerWave = 100
local lastRewardedWave = waveValue.Value

waveValue.Changed:Connect(function(newWave)
    if newWave > lastRewardedWave then
        lastRewardedWave = newWave

        for _, player in ipairs(Players:GetPlayers()) do
            local leaderstats = player:FindFirstChild("leaderstats")
            local cash = leaderstats and leaderstats:FindFirstChild("Cash")

            if cash then
                cash.Value += rewardPerWave
            end
        end
    end
end)
