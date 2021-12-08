local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)

-- print(script.Parent:GetChildren())


Knit.AddControllers(script.Parent.Controllers)

Knit.Start():catch(warn):await()