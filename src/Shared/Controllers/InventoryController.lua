local InventoryController = {}
local InventoryRepository = require(game.ReplicatedStorage.Repositories.Repository)("Inventory")

local inventoryUpdateEvents = {}
function InventoryController.OnUpdate(fn)
    table.insert(inventoryUpdateEvents, fn)
end

function Update()
    for _, event in ipairs(inventoryUpdateEvents) do
        event()
    end
end

function InventoryController.GetPlayerInventory(player)
    
end

function InventoryController.DeleteFromPlayerInventory(player, index)
    InventoryRepository.GetPlayerInventory(player).Destroy(index)
    Update()
end

