local InventoryController = require(game.ReplicatedStorage.Controllers.InventoryController)

InventoryController.OnUpdate = function()
    print("Inventory controller updated!")
end

print("Get my own items!")
local result = InventoryController.GetPlayerInventory(game.Players.LocalPlayer)
print("Controller call result:", result)

print("Get some random persons items!")
local result = InventoryController.GetPlayerInventory(nil)
print("Controller call result:", result)