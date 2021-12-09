local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)

Knit.AddServices(script.Parent.Services)

Knit.Start():andThen(function()
    print("knit started")
    -- Loader.LoadChildren(script.Parent.Components)
end):catch(warn):await()