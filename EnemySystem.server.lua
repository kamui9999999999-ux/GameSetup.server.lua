
-- TOWER DEFENSE: WAVE SYSTEM

local Workspace = game:GetService("Workspace")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local gameState = ReplicatedStorage:WaitForChild("GameState")

local enemies = Workspace:FindFirstChild("Enemies")

if not enemies then
    enemies = Instance.new("Folder")
    enemies.Name = "Enemies"
    enemies.Parent = Workspace
end

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
    health.Value = 100 + (gameState.Wave.Value * 10)
    health.Parent = enemy

    task.spawn(function()
        while enemy.Parent and enemy.Position.Z < 40 do
            enemy.Position += Vector3.new(0, 0, 0.8)
            task.wait(0.1)
        end

        if enemy.Parent then
            gameState.BaseHP.Value = math.max(
                0,
                gameState.BaseHP.Value - 50
            )
            enemy:Destroy()
        end
    end)
end

while gameState.BaseHP.Value > 0 do
    local currentWave = gameState.Wave.Value

    print("Starting Wave " .. currentWave)

    for i = 1, currentWave * 5 do
        if gameState.BaseHP.Value <= 0 then
            break
        end

        spawnEnemy()
        task.wait(1)
    end

    task.wait(10)

    if gameState.BaseHP.Value > 0 then
        gameState.Wave.Value += 1
    end
end

print("GAME OVER!")
