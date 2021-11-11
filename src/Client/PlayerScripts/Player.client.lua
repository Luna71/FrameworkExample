local InventoryController = require(game.ReplicatedStorage.Controllers.InventoryController)

InventoryController.OnUpdate = function()
    print("Inventory controller updated!")
end

print("I'm the client")
local result = InventoryController.GetPlayerInventory("client arguments")
print("Controller call result:", result)