--[[
    Initial
]]


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local PlayerStats = Knit.CreateService {
    Name = "PlayerStats";
    Client = {};
}

-- Increase a player stat to a given value
function PlayerStats:IncreaseStat(player: Player, stat: string, value: any)
    local foundStat = player:FindFirstChild(stat, true)

    if foundStat then
        foundStat.Value += value
    else
        warn(stat, "not found!")
    end
end

-- Decrease a player stat to a given value
function PlayerStats:DecreaseStat(player: Player, stat: string, value: any)
    local foundStat = player:FindFirstChild(stat, true)

    if foundStat then
        foundStat.Value -= value
        if foundStat.value < 1 then
            foundStat.value = 0
        end 
    else
        warn(stat, "not found!")
    end
end

--* ---- PRIVATE MEMBERS -----
local function _CreateStat(name: string, type: string, parent: Folder)
    local stat = Instance.new(type)
    stat.Name = name
    stat.Parent = parent    
    return stat
end

local function _InitStats(player: Player)
    local statsFolder = Instance.new("Folder")
    statsFolder.Name = "Stats"
    --* stats
    _CreateStat("Strenght", "NumberValue", statsFolder)
    _CreateStat("Dexterity", "NumberValue", statsFolder)
    _CreateStat("Reputation", "NumberValue", statsFolder)
    _CreateStat("Inteligence", "NumberValue", statsFolder)
    _CreateStat("Conditon", "NumberValue", statsFolder)

    --*Currency
    _CreateStat("Cash", "NumberValue", statsFolder)
    _CreateStat("CupNoodles", "NumberValue", statsFolder) --> premium currency

    statsFolder.Parent = player
end

--* ---- KNIT LIFE CYCLE -----
function PlayerStats:KnitStart()
    Players.PlayerAdded:Connect(function(player)
        _InitStats(player)

        self:SetStat(player, "Strenght", 25)
        self:SetStat(player, "Strenght", -1) -- will reset it to 0
    end)
end


function PlayerStats:KnitInit()
    
end


return PlayerStats
