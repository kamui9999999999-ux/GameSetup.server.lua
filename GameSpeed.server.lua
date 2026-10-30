local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = Instance.new("RemoteEvent")
event.Name = "ChangeGameSpeed"
event.Parent = ReplicatedStorage

local speeds = {1, 1.5, 2}
local currentIndex = 1

event.OnServerEvent:Connect(function(player)
    currentIndex += 1

    if currentIndex > #speeds then
        currentIndex = 1
    end

    local speed = speeds[currentIndex]

    ReplicatedStorage:SetAttribute("GameSpeed", speed)
    print("Game Speed:", speed)
end)

ReplicatedStorage:SetAttribute("GameSpeed", 1)
