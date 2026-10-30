local ReplicatedStorage = game:GetService("ReplicatedStorage")

local event = Instance.new("RemoteEvent")
event.Name = "ChangeDifficulty"
event.Parent = ReplicatedStorage

local difficulties = {
    Easy = 1,
    Normal = 1.5,
    Hard = 2
}

ReplicatedStorage:SetAttribute("Difficulty", "Easy")

event.OnServerEvent:Connect(function(player, difficulty)
    if difficulties[difficulty] then
        ReplicatedStorage:SetAttribute("Difficulty", difficulty)
        print("Difficulty changed to:", difficulty)
    end
end)
