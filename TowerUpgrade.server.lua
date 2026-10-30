
-- TOWER DEFENSE: UPGRADE SYSTEM

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local upgradeEvent = Instance.new("RemoteEvent")
upgradeEvent.Name = "UpgradeTowerEvent"
upgradeEvent.Parent = ReplicatedStorage

local COSTS = {
    [1] = 200,
    [2] = 400,
    [3] = 800
}

upgradeEvent.OnServerEvent:Connect(function(player, tower)
    if typeof(tower) ~= "Instance" then return end
    if not tower:IsA("BasePart") then return end
    if not tower:IsDescendantOf(workspace.Towers) then return end

    local cash = player:FindFirstChild("leaderstats")
        and player.leaderstats:FindFirstChild("Cash")

    if not cash then return end

    local level = tower:FindFirstChild("Level")

    if not level then
        level = Instance.new("IntValue")
        level.Name = "Level"
        level.Value = 1
        level.Parent = tower
    end

    if level.Value >= 3 then return end

    local price = COSTS[level.Value]

    if cash.Value < price then return end

    cash.Value -= price
    level.Value += 1

    tower.Color = Color3.fromRGB(
        0,
        150 + level.Value * 30,
        255
    )

    print("Tower upgraded to level " .. level.Value)
end)
