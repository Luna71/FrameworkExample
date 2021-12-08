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

--* ---- PROPERTIES -----
PlayerStats.StatsPerPlayer = {}

--* ---- PUBLIC METHODS -----

-- Increase a player stat to a given value
function PlayerStats:IncreaseStat(player: Player, stat: string, value: any)
    local foundStat: NumberValue = player:FindFirstChild(stat, true)

    if foundStat then
        foundStat.Value += value
    else
        warn(stat, "not found!")
    end
end

-- Decrease a player stat to a given value
function PlayerStats:DecreaseStat(player: Player, stat: string, value: any)
    local foundStat: NumberValue = player:FindFirstChild(stat, true)

    if foundStat then
        foundStat.Value -= value
        if foundStat.Value < 1 then
            foundStat.Value = 0
        end 
    else
        warn(stat, "not found!")
    end
end

--// TODO change GetStats to use user ID instead of name
function PlayerStats:GetStats(playerName: string)
    local stats = Players:FindFirstChild(playerName):FindFirstChild("Stats"):GetChildren()
    return stats
end

--* ---- PRIVATE PROPERTIES -----
local stats = {
    --* stats
    Strenght = 0,
    Dexterity = 0,
    Reputation = 0,
    Inteligence = 0,
    Condition = 0,

    --*Currency
    Cash = 0,
    CupNoodles = 0, --> premium currency
}

--* ---- PRIVATE METHODS -----

local function _CreateStat(name: string, type: string, parent: Folder)
    local stat = Instance.new(type)
    stat.Name = name
    stat.Parent = parent    
    return stat
end

local function _InitStats(player)
    local statsFolder = Instance.new("Folder")
    statsFolder.Name = "Stats"
    
    for statEntry, _ in pairs(stats) do
        print(statEntry)
        _CreateStat(statEntry, "NumberValue", statsFolder)
    end
    
    statsFolder.Parent = player
end

--* ---- KNIT LIFE CYCLE -----
function PlayerStats:KnitStart()
    Players.PlayerAdded:Connect(function(player)
        _InitStats(player)

    end)
end


function PlayerStats:KnitInit()
    
end


return PlayerStats
