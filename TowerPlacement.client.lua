
-- TOWER PLACEMENT: MOBILE MAP SELECTION
-- Place inside StarterPlayerScripts as a LocalScript

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local placeEvent = ReplicatedStorage:WaitForChild("PlaceTowerEvent")

local gui = Instance.new("ScreenGui")
gui.Name = "TowerPlacementGUI"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local selecting = false

local button = Instance.new("TextButton")
button.Size = UDim2.new(0, 190, 0, 55)
button.Position = UDim2.new(1, -205, 1, -100)
button.BackgroundColor3 = Color3.fromRGB(0, 180, 220)
button.TextColor3 = Color3.new(1, 1, 1)
button.TextScaled = true
button.Text = "BUY TOWER $250"
button.Parent = gui

button.Activated:Connect(function()
    selecting = true
    button.Text = "TAP MAP TO PLACE"
end)

UserInputService.InputBegan:Connect(function(input, processed)
    if not selecting or processed then return end

    if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then

        local camera = workspace.CurrentCamera
        local ray = camera:ViewportPointToRay(
            input.Position.X,
            input.Position.Y
        )

        local params = RaycastParams.new()
        params.FilterType = Enum.RaycastFilterType.Exclude
        params.FilterDescendantsInstances = {player.Character}

        local result = workspace:Raycast(
            ray.Origin,
            ray.Direction * 500,
            params
        )

        if result then
            placeEvent:FireServer(result.Position)
            selecting = false
            button.Text = "BUY TOWER $250"
        end
    end
end)
