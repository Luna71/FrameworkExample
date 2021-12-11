--[[
    This service keeps track of all activities and players doing activities 
]]
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProximityPromptService = game:GetService("ProximityPromptService")
local CollectionService = game:GetService("CollectionService")

local Knit = require(ReplicatedStorage.Packages.Knit)
local TestJobComp = require(ServerScriptService.Components.TestJob)

local Schedule

local Jobs = Knit.CreateService {
    Name = "Jobs";
    Client = {};
}

Jobs.JobMarkers = {}

function Jobs:KnitStart()
    Schedule.HourlyTick:Connect(function(currenTime)
        print(currenTime)

        for _, jobMarker in ipairs(CollectionService:GetTagged("JobMarker")) do
            if currenTime == TestJobComp.StartTime and currenTime then
                CollectionService:AddTag(jobMarker, "TestJob")

            end
        end
        
        for _, jobMarker in ipairs(CollectionService:GetTagged("JobMarker")) do
            if currenTime == TestJobComp.EndTime then
                CollectionService:RemoveTag(jobMarker, "TestJob")
            end
        end
    end)
end


function Jobs:KnitInit()
    Schedule = require(ServerScriptService.Services.Schedule)
end


return Jobs
