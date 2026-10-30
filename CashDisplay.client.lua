local Players = game:GetService("Players")

local player = Players.LocalPlayer
local leaderstats = player:WaitForChild("leaderstats")
local cash = leaderstats:WaitForChild("Cash")

local gui = Instance.new("ScreenGui")
gui.Name = "CashDisplay"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 200, 0, 50)
label.Position = UDim2.new(0, 15, 0, 15)
label.BackgroundColor3 = Color3.fromRGB(15, 25, 50)
label.TextColor3 = Color3.fromRGB(0, 255, 180)
label.TextScaled = true
label.Font = Enum.Font.GothamBold
label.Parent = gui

local function updateCash()
    label.Text = "CASH: $" .. cash.Value
end

updateCash()
cash.Changed:Connect(updateCash)
