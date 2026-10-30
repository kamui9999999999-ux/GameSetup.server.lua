
-- TOWER DEFENSE: ENEMY SYSTEM
-- Place inside ServerScriptService

local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local gameState = ReplicatedStorage:WaitForChild("GameState")

local ENEMY_HEALTH = 100
local ENEMY_SPEED = 8
local DAMAGE_TO_BASE = 50

-- Create enemy folder
local enemies = Instance.new("Folder")
enemies.Name = "Enemies"
enemies.Parent = Workspace

-- Create enemy
local function spawnEnemy()
    local enemy = Instance.new("Part")
    enemy.Name = "SciFiRobot"
    enemy.Size = Vector3.new(4, 5, 4)
    enemy.Position = Vector3.new(0, 3, -40)
    enemy.Anchored = true
    enemy.Material = Enum.Material.Neon
    enemy.Color = Color3.fromRGB(0, 200, 255)
    enemy.Parent = enemies

    local health = Instance.new("IntValue")
    health.Name = "Health"
    health.Value = ENEMY_HEALTH
    health.Parent = enemy

    -- Walk toward the base
    task.spawn(function()
        while enemy.Parent and enemy.Position.Z < 40 do
            local nextPosition = enemy.Position + Vector3.new(
                0, 0, ENEMY_SPEED * 0.1
            )

            enemy.Position = nextPosition
            task.wait(0.1)
        end

        if enemy.Parent then
            gameState.BaseHP.Value = math.max(
                0,
                gameState.BaseHP.Value - DAMAGE_TO_BASE
            )
            enemy:Destroy()
        end
    end)
end

-- Spawn one enemy every 3 seconds
while gameState.BaseHP.Value > 0 do
    spawnEnemy()
    task.wait(3)
end

print("Sci-Fi Enemy System Started!")
