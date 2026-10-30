
-- TOWER ATTACK + CASH REWARD

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local enemies = Workspace:WaitForChild("Enemies")

local tower = Instance.new("Part")
tower.Name = "SciFiTower"
tower.Size = Vector3.new(5, 8, 5)
tower.Position = Vector3.new(10, 4, 0)
tower.Anchored = true
tower.Material = Enum.Material.Neon
tower.Color = Color3.fromRGB(0, 255, 150)
tower.Parent = Workspace

local RANGE = 35
local DAMAGE = 25
local REWARD = 50
local ATTACK_DELAY = 1

while true do
    local target = nil
    local shortestDistance = RANGE

    for _, enemy in ipairs(enemies:GetChildren()) do
        if enemy:IsA("BasePart") then
            local distance = (enemy.Position - tower.Position).Magnitude

            if distance < shortestDistance then
                shortestDistance = distance
                target = enemy
            end
        end
    end

    if target then
        local health = target:FindFirstChild("Health")

        if health and health.Value > 0 then
            health.Value = math.max(0, health.Value - DAMAGE)

            if health.Value <= 0 then
                for _, player in ipairs(Players:GetPlayers()) do
                    local cash = player:FindFirstChild("leaderstats")
                        and player.leaderstats:FindFirstChild("Cash")

                    if cash then
                        cash.Value += REWARD
                    end
                end

                target:Destroy()
            end
        end
    end

    task.wait(ATTACK_DELAY)
end
