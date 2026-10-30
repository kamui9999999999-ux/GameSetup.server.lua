local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

-- ADMIN OWNER
local ADMIN_IDS = {
    [4298811103] = true
}

local gameState = ReplicatedStorage:WaitForChild("GameState")

local function isAdmin(player)
    return ADMIN_IDS[player.UserId] == true
end

local function handleCommand(player, message)
    if not isAdmin(player) then
        return
    end

    local args = string.split(message, " ")
    local command = string.lower(args[1])

    if command == "!cash" then
        local amount = tonumber(args[2])
        local stats = player:FindFirstChild("leaderstats")
        local cash = stats and stats:FindFirstChild("Cash")

        if cash and amount and amount > 0 and amount <= 1000000 then
            cash.Value += math.floor(amount)
        end

    elseif command == "!healbase" then
        local hp = gameState:FindFirstChild("BaseHP")
        if hp then
            hp.Value = 1000
        end

    elseif command == "!wave" then
        local wave = gameState:FindFirstChild("Wave")
        local number = tonumber(args[2])

        if wave and number and number >= 1 and number <= 100 then
            wave.Value = math.floor(number)
        end
    end
end

Players.PlayerAdded:Connect(function(player)
    player.Chatted:Connect(function(message)
        handleCommand(player, message)
    end)
end)
