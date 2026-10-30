
-- TOWER DEFENSE: TOWER ATTACK SYSTEM
-- Place inside ServerScriptService

local Workspace = game:GetService("Workspace")

local enemies = Workspace:WaitForChild("Enemies")

-- Create a sci-fi tower
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

        if health then
            health.Value = health.Value - DAMAGE

            if health.Value <= 0 then
                target:Destroy()
            end
        end
    end

    task.wait(ATTACK_DELAY)
end
