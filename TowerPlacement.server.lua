
-- TOWER PLACEMENT SERVER

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local placeEvent = Instance.new("RemoteEvent")
placeEvent.Name = "PlaceTowerEvent"
placeEvent.Parent = ReplicatedStorage

local towers = Instance.new("Folder")
towers.Name = "Towers"
towers.Parent = Workspace

local PRICE = 250

placeEvent.OnServerEvent:Connect(function(player, position)
    if typeof(position) ~= "Vector3" then return end

    local cash = player:FindFirstChild("leaderstats")
        and player.leaderstats:FindFirstChild("Cash")

    if not cash or cash.Value < PRICE then return end

    if math.abs(position.X) > 100
        or math.abs(position.Z) > 100 then
        return
    end

    cash.Value -= PRICE

    local tower = Instance.new("Part")
    tower.Name = "SciFiTower"
    tower.Size = Vector3.new(5, 8, 5)
    tower.Position = position + Vector3.new(0, 4, 0)
    tower.Anchored = true
    tower.Material = Enum.Material.Neon
    tower.Color = Color3.fromRGB(0, 255, 150)
    tower.Parent = towers
end)
