local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)
local Schedule

local testController = Knit.CreateController { Name = "testController" }


function testController:KnitStart()
    while true do
        
        Schedule:GetTime():andThen(function(currentTime)
            print(currentTime)
        end)

        print("test2")

        task.wait(1)
    end
end


function testController:KnitInit()
    Schedule = Knit.GetService("Schedule")
end


return testController
