local InventoryRepository = require(game.ReplicatedStorage.Repositories.Repository)("Inventory")
local InventoryController = {}
local proxy = require(game.ReplicatedStorage.Controllers.Controller)(InventoryController, "InventoryController")

function InventoryController.GetPlayerInventory(player)
    InventoryRepository.GetPlayerInventory(player)
    local server = game:GetService("RunService"):IsServer() and "server" or "client"
    print("Called controller from " .. server)
    print("Argument:", player)
    InventoryController.Update()
    return "i am a result from the " .. server
end

function InventoryController.DeleteFromPlayerInventory(player, index)
    InventoryRepository.DestroyFromInventory(player, index)
    InventoryController.Update()
end

return proxy