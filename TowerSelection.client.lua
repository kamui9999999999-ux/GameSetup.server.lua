
-- TOWER SELECTION SYSTEM
-- Place inside StarterPlayerScripts as a LocalScript

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local mouse = player:GetMouse()

local selectedTower = nil

local gui = Instance.new("ScreenGui")
gui.Name = "TowerSelectionGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 220, 0, 50)
label.Position = UDim2.new(0.5, -110, 0, 20)
label.BackgroundColor3 = Color3.fromRGB(15, 25, 45)
label.TextColor3 = Color3.fromRGB(0, 255, 255)
label.TextScaled = true
label.Text = "NO TOWER SELECTED"
label.Parent = gui

UserInputService.InputBegan:Connect(function(input, processed)
    if processed then return end

    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

        local target = mouse.Target
        local towers = workspace:FindFirstChild("Towers")

        if target and towers and target:IsDescendantOf(towers) then
            selectedTower = target
            label.Text = "SELECTED: " .. target.Name
            print("Tower selected:", target.Name)
        end
    end
end)

print("Tower Selection System Loaded!")
