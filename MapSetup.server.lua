
-- SCI-FI TOWER DEFENSE MAP
-- Place inside ServerScriptService

local Workspace = game:GetService("Workspace")

local oldMap = Workspace:FindFirstChild("SciFiMap")
if oldMap then
    oldMap:Destroy()
end

local map = Instance.new("Folder")
map.Name = "SciFiMap"
map.Parent = Workspace

local function createPart(name, size, position, color, material)
    local part = Instance.new("Part")
    part.Name = name
    part.Size = size
    part.Position = position
    part.Anchored = true
    part.Color = color
    part.Material = material
    part.Parent = map
    return part
end

-- Main ground
createPart(
    "MainGround",
    Vector3.new(120, 2, 120),
    Vector3.new(0, -1, 0),
    Color3.fromRGB(20, 30, 50),
    Enum.Material.Metal
)

-- Enemy path
createPart(
    "EnemyPath",
    Vector3.new(14, 0.3, 100),
    Vector3.new(0, 0.2, 0),
    Color3.fromRGB(0, 120, 180),
    Enum.Material.Neon
)

-- Base
createPart(
    "MainBase",
    Vector3.new(16, 12, 12),
    Vector3.new(0, 6, 45),
    Color3.fromRGB(0, 255, 180),
    Enum.Material.Neon
)

-- Spawn area
createPart(
    "EnemySpawn",
    Vector3.new(16, 1, 8),
    Vector3.new(0, 0.5, -45),
    Color3.fromRGB(255, 50, 80),
    Enum.Material.Neon
)

print("SCI-FI MAP CREATED!")
