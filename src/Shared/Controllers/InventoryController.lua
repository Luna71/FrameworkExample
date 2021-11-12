local InventoryRepository
if (game:GetService("RunService"):IsServer()) then
    InventoryRepository = require(game.ServerScriptService.Repositories.InventoryRepository)
end

local InventoryController = {}
local proxy = require(game.ReplicatedStorage.Controllers.Controller)(InventoryController, "InventoryController")

function InventoryController.GetPlayerInventory(player)
    local items = InventoryRepository.GetInventory(player)
    return items
end

function InventoryController.ValidateGetPlayerInventory(playerCalling, player)
    if playerCalling == player then return true end
    return false
end

function InventoryController.DeleteFromPlayerInventory(player, index)
    InventoryRepository.DestroyFromInventory(player, index)
    InventoryController.Update()
end

return proxy