local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local startingCash = {
    Easy = 700,
    Normal = 500,
    Hard = 300
}

Players.PlayerAdded:Connect(function(player)
    local leaderstats = player:WaitForChild("leaderstats")
    local cash = leaderstats:WaitForChild("Cash")

    local difficulty = ReplicatedStorage:GetAttribute("Difficulty") or "Easy"
    cash.Value = startingCash[difficulty] or 700
end)
