local InventoryController = require(game.ReplicatedStorage.Controllers.InventoryController)
local JobsController = require(game.ReplicatedStorage.Controllers.JobsController)
--[[
InventoryController.OnUpdate(function(state)
    print("Inventory controller updated!")
    print("State:", state)
end)

print("Get my own items!")
local getInventory = InventoryController.GetPlayerInventory(game.Players.LocalPlayer)
print("Get call result:", getInventory)

print("Get some random persons items!")
local getInventory = InventoryController.GetPlayerInventory(nil)
print("Get call result:", getInventory)

print("Destroy my items!")
local indexOfItem = 2
local destroyInventory = InventoryController.DestroyFromInventory(game.Players.LocalPlayer, indexOfItem)
print("Destroy call result:", destroyInventory)

print("Get my own items!")
local getInventory = InventoryController.GetPlayerInventory(game.Players.LocalPlayer)
print("Get call result:", getInventory)

print("Call an invalid method")
local notAMethod = InventoryController.ThisIsntAMethod(game.Players.LocalPlayer)
print("Invalid method result :", notAMethod)
]]--

local pp: ProximityPrompt = workspace.Part.ProximityPrompt

pp.Triggered:Connect(function()
    print(JobsController.StartJob("GarbageCollection"))
end)
