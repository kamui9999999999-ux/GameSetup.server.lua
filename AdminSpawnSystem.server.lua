local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local ADMIN_IDS = {
    [4298811103] = true
}

local spawnFolder = ServerStorage:WaitForChild("AdminSpawns")

local categories = {
    enemy = "Enemies",
    tower = "Towers",
    npc = "NPCs",
    boss = "Bosses"
}

local function spawnObject(player, category, name)
    if not ADMIN_IDS[player.UserId] then return end

    local folderName = categories[string.lower(category)]
    if not folderName then return end

    local folder = spawnFolder:FindFirstChild(folderName)
    if not folder then return end

    local template = folder:FindFirstChild(name)
    if not template then return end

    local object = template:Clone()
    object.Parent = workspace

    if object:IsA("Model") then
        object:PivotTo(
            player.Character:GetPivot() * CFrame.new(0, 0, -12)
        )
    elseif object:IsA("BasePart") then
        object.Position =
            player.Character:GetPivot().Position
            + Vector3.new(0, 0, -12)
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        local args = string.split(message, " ")

        if string.lower(args[1]) == "!spawn" then
            if args[2] and args[3] then
                spawnObject(player, args[2], args[3])
            end
        end
    end)
end)
