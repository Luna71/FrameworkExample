local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")


local Knit = require(ReplicatedStorage.Packages.knit)

local Schedule = Knit.CreateService {
    Name = "Schedule";
    Client = {};
}

Schedule.TimeBlocks = {}
Schedule.CurrentTimeBlock = 1 

function Schedule:GetCurrentTimeBlock()
    return self.CurrentTimeBlock
end

--? maybe an enum is more benefitial than an array
local function _SetUpSchedule()
    --* Sets each 1 hour block
    for _ = 1, 24 do
        table.insert(Schedule.TimeBlocks, {})
    end
end

function Schedule:KnitStart()
    _SetUpSchedule()

    Lighting.ClockTime = self.CurrentTimeBlock -- set the starting to the current time block each time the server starts

    --* day night cycle and schedule changer

    local previous = 0
    while true do
        Lighting.ClockTime += 0.025
        previous = self.CurrentTimeBlock
        self.CurrentTimeBlock = math.ceil(Lighting.ClockTime)

        if self.CurrentTimeBlock > previous then
            print ("Current time block:", self.CurrentTimeBlock, "Current ACTUAL TIME:", math.ceil(Lighting.ClockTime))
        end

        task.wait()
    end
end


function Schedule:KnitInit()
    
end


return Schedule
