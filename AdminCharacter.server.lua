local Players = game:GetService("Players")

local ADMIN_ID = 4298811103

local function createAdminCharacter(player, character)
    if player.UserId ~= ADMIN_ID then
        return
    end

    local humanoid = character:WaitForChild("Humanoid")

    humanoid.MaxHealth = 5000
    humanoid.Health = 5000
    humanoid.WalkSpeed = 24
    humanoid.DisplayName = "ADMIN OHIOLLLK"

    local highlight = Instance.new("Highlight")
    highlight.Name = "AdminGlow"
    highlight.FillColor = Color3.fromRGB(0, 170, 255)
    highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
    highlight.FillTransparency = 0.5
    highlight.Parent = character

    print("ADMIN CHARACTER ACTIVATED!")
end

Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        createAdminCharacter(player, character)
    end)
end)
