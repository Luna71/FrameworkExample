local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")


local Knit = require(ReplicatedStorage.Packages.knit)

local Schedule = Knit.CreateService {
    Name = "Schedule";
    Client = {};
}

Schedule.TimeBlocks = {}

local function _SetUpSchedule()
    --* Sets each 1 hour block
    for _ = 1, 24 do
        table.insert(Schedule.TimeBlocks, {})
    end

    print (Schedule.TimeBlocks)
end



function Schedule:KnitStart()
    _SetUpSchedule()
end


function Schedule:KnitInit()
    
end


return Schedule
