local CollectionService = game:GetService("CollectionService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Knit = require(ReplicatedStorage.Packages.Knit)
local Loader = require(ReplicatedStorage.Packages.Loader)

Knit.AddServices(script.Parent.Services)

Knit.Start():andThen(function()
    print("knit started")
    -- Loader.LoadChildren(script.Parent.Components)
end):catch(warn):await()