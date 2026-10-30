
-- LobbySetup.server.lua
-- Sci-Fi Tower Defense Lobby

local lobby = Instance.new("Folder")
lobby.Name = "SciFiLobby"
lobby.Parent = workspace

local function createPart(name, size, position, color, material)
    local p = Instance.new("Part")
    p.Name = name
    p.Size = size
    p.Position = position
    p.Anchored = true
    p.Color = color
    p.Material = material or Enum.Material.SmoothPlastic
    p.Parent = lobby
    return p
end

-- Main floor
createPart("LobbyFloor", Vector3.new(120, 2, 120),
    Vector3.new(0, 0, 0),
    Color3.fromRGB(20, 25, 45))

-- Neon center platform
createPart("CenterPlatform", Vector3.new(35, 1, 35),
    Vector3.new(0, 2, 0),
    Color3.fromRGB(0, 100, 180),
    Enum.Material.Neon)

-- Play portal
local portal = createPart("PlayPortal",
    Vector3.new(12, 18, 2),
    Vector3.new(0, 11, -35),
    Color3.fromRGB(0, 170, 255),
    Enum.Material.Neon)

-- Shop area
createPart("ShopPlatform", Vector3.new(20, 2, 15),
    Vector3.new(-35, 2, 0),
    Color3.fromRGB(30, 60, 100))

-- Leaderboard area
createPart("LeaderboardPlatform", Vector3.new(20, 2, 15),
    Vector3.new(35, 2, 0),
    Color3.fromRGB(30, 60, 100))

-- Spawn point
local spawn = Instance.new("SpawnLocation")
spawn.Name = "LobbySpawn"
spawn.Size = Vector3.new(8, 1, 8)
spawn.Position = Vector3.new(0, 4, 25)
spawn.Anchored = true
spawn.Neutral = true
spawn.Parent = lobby

-- Decorative lights
for i = 1, 4 do
    createPart("NeonLight" .. i,
        Vector3.new(2, 1, 25),
        Vector3.new(-45 + i * 30, 3, 45),
        Color3.fromRGB(0, 200, 255),
        Enum.Material.Neon)
end

print("Sci-Fi Lobby created!")
