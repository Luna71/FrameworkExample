local RunService = game:GetService("RunService")
local InventoryRepository = {}
local state = {
    {name="Thunderfury, Blessed Blade of the Windseeker"},
    {name="Garbage"}
}


function InventoryRepository.GetInventory(player)
    return state
end

function InventoryRepository.DestroyFromInventory(player, index)
    table.remove(state, index)
    return state
end
return InventoryRepository