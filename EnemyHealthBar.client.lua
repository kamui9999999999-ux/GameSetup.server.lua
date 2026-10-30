local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local function addHealthBar(enemy)
    local humanoid = enemy:FindFirstChildOfClass("Humanoid")
    local head = enemy:FindFirstChild("Head") or enemy.PrimaryPart

    if not humanoid or not head then
        return
    end

    local gui = Instance.new("BillboardGui")
    gui.Name = "EnemyHealthBar"
    gui.Size = UDim2.new(0, 100, 0, 12)
    gui.StudsOffset = Vector3.new(0, 3, 0)
    gui.AlwaysOnTop = true
    gui.Adornee = head
    gui.Parent = enemy

    local background = Instance.new("Frame")
    background.Size = UDim2.new(1, 0, 1, 0)
    background.BackgroundColor3 = Color3.fromRGB(50, 20, 20)
    background.Parent = gui

    local health = Instance.new("Frame")
    health.Size = UDim2.new(1, 0, 1, 0)
    health.BackgroundColor3 = Color3.fromRGB(0, 255, 100)
    health.Parent = background

    local function update()
        local percent = math.clamp(
            humanoid.Health / humanoid.MaxHealth, 0, 1
        )
        health.Size = UDim2.new(percent, 0, 1, 0)
    end

    update()
    humanoid.HealthChanged:Connect(update)
end

local function checkEnemy(object)
    if object:IsA("Model") then
        addHealthBar(object)
    end
end

for _, object in ipairs(Workspace:GetChildren()) do
    checkEnemy(object)
end

Workspace.ChildAdded:Connect(checkEnemy)
