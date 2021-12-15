--[[
    This service keeps track of all activities and players doing activities 
]]
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local CollectionService = game:GetService("CollectionService")

local Loader = require(ReplicatedStorage.Packages.Loader)
local Knit = require(ReplicatedStorage.Packages.Knit)

local Schedule

local Jobs = Knit.CreateService {
    Name = "Jobs";
    Client = {};
}

function Jobs:KnitStart()
    local jobComponents = Loader.LoadChildren(ServerScriptService.Components.Jobs) -- require all job components

    -- Each hour see if a job component must be initialized or ended
    Schedule.HourlyTick:Connect(function(currenTime)

        --//TODO Add support for multiple job locations
        for _, jobComp in ipairs(jobComponents) do

            if jobComp.StartTime == currenTime then
                local jobInstance = jobComp.GameObject:Clone()
                jobInstance.Parent = workspace
                CollectionService:AddTag(jobInstance, jobComp.Tag)
                
            elseif jobComp.EndTime == currenTime then
                for _ , jobMarker in ipairs(CollectionService:GetTagged(jobComp.Tag)) do
                    CollectionService:RemoveTag(jobMarker, jobComp.Tag )
                end
            end
            
        end
    end)
end

function Jobs:KnitInit()
    Schedule = require(ServerScriptService.Services.Schedule)
end


return Jobs
 