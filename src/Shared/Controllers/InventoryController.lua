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

function InventoryController.DestroyFromInventory(player, index)
    local items = InventoryRepository.DestroyFromInventory(player, index)
    InventoryController.Update(items)
    return items
end

function InventoryController.ValidateDestroyFromInventory(playerCalling, player, index)
    if playerCalling == player then return true end
    return false
end

return proxy