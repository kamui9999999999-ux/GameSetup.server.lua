local Players = game:GetService("Players")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

local selectedTower = nil
local rangeCircle = nil

local function clearRange()
    if rangeCircle then
        rangeCircle:Destroy()
        rangeCircle = nil
    end
end

local function showRange(tower)
    clearRange()

    local root = tower.PrimaryPart
        or tower:FindFirstChildWhichIsA("BasePart")

    if not root then return end

    local range = tower:GetAttribute("Range") or 35

    local circle = Instance.new("Part")
    circle.Name = "TowerRangeCircle"
    circle.Shape = Enum.PartType.Cylinder
    circle.Size = Vector3.new(0.15, range * 2, range * 2)
    circle.CFrame = CFrame.new(root.Position.X, 0.2, root.Position.Z)
        * CFrame.Angles(0, 0, math.rad(90))
    circle.Anchored = true
    circle.CanCollide = false
    circle.CanTouch = false
    circle.CanQuery = false
    circle.Material = Enum.Material.Neon
    circle.Color = Color3.fromRGB(0, 200, 255)
    circle.Transparency = 0.7
    circle.Parent = workspace

    rangeCircle = circle
end

mouse.Button1Down:Connect(function()
    local target = mouse.Target
    local towers = workspace:FindFirstChild("Towers")

    if not target or not towers then
        selectedTower = nil
        clearRange()
        return
    end

    local model = target:FindFirstAncestorOfClass("Model")

    if model and model.Parent == towers then
        selectedTower = model
        showRange(model)
    else
        selectedTower = nil
        clearRange()
    end
end)
