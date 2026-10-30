
-- SCI-FI BOSS SYSTEM
-- Place inside ServerScriptService

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local gameState = ReplicatedStorage:WaitForChild("GameState")
local enemies = Workspace:WaitForChild("Enemies")

local function spawnBoss()
    local boss = Instance.new("Part")
    boss.Name = "SciFiBoss"
    boss.Size = Vector3.new(9, 10, 9)
    boss.Position = Vector3.new(0, 5, -40)
    boss.Anchored = true
    boss.Material = Enum.Material.Neon
    boss.Color = Color3.fromRGB(255, 40, 80)
    boss.Parent = enemies

    local health = Instance.new("IntValue")
    health.Name = "Health"
    health.Value = 1000
    health.Parent = boss

    task.spawn(function()
        while boss.Parent and boss.Position.Z < 40 do
            boss.Position += Vector3.new(0, 0, 0.4)
            task.wait(0.1)
        end

        if boss.Parent then
            gameState.BaseHP.Value = math.max(
                0,
                gameState.BaseHP.Value - 200
            )
            boss:Destroy()
        end
    end)

    print("SCI-FI BOSS SPAWNED!")
end

while gameState.BaseHP.Value > 0 do
    task.wait(2)

    if gameState.Wave.Value % 5 == 0
        and not enemies:FindFirstChild("SciFiBoss") then
        spawnBoss()
        task.wait(10)
    end
end
