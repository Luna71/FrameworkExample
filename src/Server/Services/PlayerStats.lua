--[[
    Player stats service, use it to manipualte a given player stat or to 
    get player stat info.
    
    - Methods:
    ps:IncreaseStat(player: Player, statName: string, value) -> void
        - Increase a player stat to a given value

    ps:DecreaseStat(player: Player, statName: string, value)
        - Decrease a player stat to a given value

    ps:GetAllStats(player: Player)
        - Gets all the player stats IN ARRAY FORM
        
    ps:GetStat(player: Player, statName: string)
        - Gets a concrete player stat object value
]]


local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local PlayerStats = Knit.CreateService {
    Name = "PlayerStats";
    Client = {};
}

--* ---- PUBLIC MEMBER -----

function PlayerStats:IncreaseStat(player: Player, statName: string, value: any)
    local foundStat: NumberValue = player:FindFirstChild(statName, true)

    if foundStat then
        foundStat.Value += value
    else
        warn(statName, "not found!")
    end
end

function PlayerStats:DecreaseStat(player: Player, statName: string, value: any)
    local foundStat: NumberValue = player:FindFirstChild(statName, true)

    if foundStat then
        foundStat.Value -= value
        if foundStat.Value < 1 then
            foundStat.Value = 0
        end 
    else
        warn(statName, "not found!")
    end
end

function PlayerStats:GetAllStats(player: Player)
    return player["Stats"]:GetChildren() 
end

function PlayerStats:GetStat(player: Player, statName: string)
    local stats =(player)["Stats"]
    
    for _, stat in ipairs(stats:GetChildren()) do
        if stat.Name == statName then
            return stat
        end
    end
end


function PlayerStats.Client:GetAllStats(player: Player)
    return self.Server:GetAllStats(player)
end

function PlayerStats.Client:GetStat(player: Player, statName: string)
    return self.Server:GetStat(player, statName)
end
--* ---- PRIVATE MEMBERS -----
local stats = {
    -- stats
    Strenght = 0,
    Dexterity = 0,
    Reputation = 0,
    Inteligence = 0,
    Condition = 0,

    -- Currency
    Cash = 0,
    CupNoodles = 0, --> premium currency
}

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
