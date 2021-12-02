local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Knit = require(ReplicatedStorage.Packages.Knit)
local Loader = require(ReplicatedStorage.Packages.Loader)

Knit.Start:andThen(function()
    Loader.Start(script.Parent.Components)
end):Catch(warn)