local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = Instance.new("RemoteEvent")
event.Name = "SellTowerEvent"
event.Parent = ReplicatedStorage

event.OnServerEvent:Connect(function(player, tower)
    if typeof(tower) ~= "Instance" then return end
    if not tower:IsA("Model") then return end
    if tower.Parent ~= workspace:FindFirstChild("Towers") then return end
    if tower.Name ~= "SciFiTower" then return end

    local leaderstats = player:FindFirstChild("leaderstats")
    local cash = leaderstats and leaderstats:FindFirstChild("Cash")

    if not cash then return end

    local spent = tower:GetAttribute("TotalSpent") or 250
    local refund = math.floor(spent * 0.5)

    cash.Value += refund
    tower:Destroy()
end)
