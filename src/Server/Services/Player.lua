local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

local Player = Knit.CreateService {
    Name = "Player";
    Client = {};
}

local function _CreateStat(name: string, type: string, parent: Folder)
    local stat = Instance.new(type)
    stat.Name = name
    stat.Parent = parent    
    return stat
end

function Player:KnitStart()
    Players.PlayerAdded:Connect(function(player)
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
    end)
end


function Player:KnitInit()
    
end


return Player
