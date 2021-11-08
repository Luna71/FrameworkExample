local RunService = game:GetService("RunService")
local serverRepositories = game.ReplicatedStorage.Repositories.Server
local clientRepositories = game.ReplicatedStorage.Repositories.Client

return function(repositoryType)
    if RunService:IsClient() then
        local module = clientRepositories:FindFirstChild(repositoryType .. "Repository")
        if not module then error("Could not find client repository of type " .. repositoryType) end
        return require(module)
    elseif RunService:IsServer() then
        local module = serverRepositories:FindFirstChild(repositoryType .. "Repository")
        if not module then error("Could not find server repository of type " .. repositoryType) end
        return require(module)
    end
end