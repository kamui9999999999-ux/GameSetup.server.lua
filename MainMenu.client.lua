
-- SCI-FI TOWER DEFENSE MAIN MENU
-- Place inside StarterPlayerScripts as a LocalScript

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local player = Players.LocalPlayer
local resultEvent = ReplicatedStorage:WaitForChild("GameResultEvent")

local gui = Instance.new("ScreenGui")
gui.Name = "MainMenu"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local background = Instance.new("Frame")
background.Size = UDim2.fromScale(1, 1)
background.BackgroundColor3 = Color3.fromRGB(5, 12, 30)
background.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(0.8, 0, 0.2, 0)
title.Position = UDim2.new(0.1, 0, 0.2, 0)
title.BackgroundTransparency = 1
title.Text = "SCI-FI TOWER DEFENSE"
title.TextColor3 = Color3.fromRGB(0, 255, 255)
title.TextScaled = true
title.Font = Enum.Font.GothamBold
title.Parent = background

local play = Instance.new("TextButton")
play.Size = UDim2.new(0.4, 0, 0.12, 0)
play.Position = UDim2.new(0.3, 0, 0.55, 0)
play.BackgroundColor3 = Color3.fromRGB(0, 160, 220)
play.Text = "PLAY"
play.TextColor3 = Color3.new(1, 1, 1)
play.TextScaled = true
play.Font = Enum.Font.GothamBold
play.Parent = background

local function showResult(result)
    title.Text = result == "WIN" and "YOU WIN!" or "GAME OVER!"
    title.TextColor3 = result == "WIN"
        and Color3.fromRGB(0, 255, 100)
        or Color3.fromRGB(255, 50, 50)

    play.Text = "GAME FINISHED"
    play.Active = false
end

play.Activated:Connect(function()
    background.Visible = false
end)

resultEvent.OnClientEvent:Connect(showResult)

print("Main Menu Loaded!")
