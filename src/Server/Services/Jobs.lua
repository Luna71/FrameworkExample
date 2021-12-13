--[[
    This service keeps track of all activities and players doing activities 
]]
local ServerScriptService = game:GetService("ServerScriptService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ProximityPromptService = game:GetService("ProximityPromptService")
local CollectionService = game:GetService("CollectionService")

local Knit = require(ReplicatedStorage.Packages.Knit)
local TestJobComp = require(ServerScriptService.Components.TestJob)
local Loader = require(ReplicatedStorage.Packages.Loader)

local Schedule

local Jobs = Knit.CreateService {
    Name = "Jobs";
    Client = {};
}


function Jobs:KnitStart()
    local activeMarkers = {}
    Schedule.HourlyTick:Connect(function(currenTime)
        print(currenTime)

        for _, jobMarker in ipairs(CollectionService:GetTagged("JobMarker")) do

            if CollectionService:HasTag(jobMarker, "TestJobMarker") then
                if currenTime == TestJobComp.StartTime then
                    CollectionService:AddTag(jobMarker, "TestJob")
                end
            end
        end

        for _, jobMarker in ipairs(CollectionService:GetTagged("JobMarker")) do

            if CollectionService:HasTag(jobMarker, "TestJobMarker") then
                if currenTime == TestJobComp.EndTime then
                    CollectionService:RemoveTag(jobMarker, "TestJob")
                end
            end
        end
        

    end)
end


function Jobs:KnitInit()
    Schedule = require(ServerScriptService.Services.Schedule)
end


return Jobs
