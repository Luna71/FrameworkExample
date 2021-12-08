--[[
Schedule service: This service controls the day night cycle of the game and servers as a 
time keeping service
]]--

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Lighting = game:GetService("Lighting")

local Signal = require(ReplicatedStorage.Packages.Signal)
local Knit = require(ReplicatedStorage.Packages.Knit)

local Schedule = Knit.CreateService {
    Name = "Schedule";
    Client = {
        ClientHourlyTick = Knit.CreateSignal()
};
}

--* ---- PUBLIC MEMBERS -----
Schedule.TimeBlocks = {}
Schedule.CurrentTimeBlock = 1
Schedule.HourlyTick = Signal.new() 

-- Gets the current in-game hour
function Schedule:GetTime()
    return self.CurrentTimeBlock
end

-- Gets all concrete activity names in a given timeblock
function Schedule:GetActivities(timeBlock: number)
    return self.TimeBlocks[timeBlock]
end

-- Gets all time blocks and their values
function Schedule:GetAllTimeBlocks()
    return self.TimeBlocks
end

-- Inserts a concrete activity name to a time block 
function Schedule:InsertToTimeBlock(timeBlock: number, activity: string)
    table.insert(self.TimeBlocks[timeBlock], activity)
end

--* ---- CLIENT MEMBERS -----
function Schedule.Client:GetTime()
    return self.Server:GetTime()
end

function Schedule.Client:GetActivities()
    return self.Server:GetActivities()
end

function Schedule.Client:GetAllTimeBlocks()
    return self.Server:GetAllTimeBlocks()
end

--* ---- PRIVATE MEMBERS -----
--? maybe an enum is more benefitial than an array
local function _SetUpSchedule()
    --* Sets each 1 hour block of a 24 hour day
    for _ = 1, 24 do
        table.insert(Schedule.TimeBlocks, {})
    end
end

--* ---- KNIT LIFE CYCLE -----
function Schedule:KnitStart()
    _SetUpSchedule()

    Lighting.ClockTime = self.CurrentTimeBlock -- set the starting to the current time block each time the server starts
    
    -- day night cycle and schedule changer
    local previous = 0
    while true do
        Lighting.ClockTime += 0.025
        previous = self.CurrentTimeBlock
        self.CurrentTimeBlock = math.ceil(Lighting.ClockTime)

        if self.CurrentTimeBlock > previous then
            self.HourlyTick:Fire(self.CurrentTimeBlock)
            self.Client.ClientHourlyTick:FireAll(self.CurrentTimeBlock)
        end

        task.wait()
    end
end


function Schedule:KnitInit()
    
end


return Schedule
