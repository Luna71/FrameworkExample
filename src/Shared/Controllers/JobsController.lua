local JobsRepository = nil

if (game:GetService("RunService"):IsServer()) then
    JobsRepository = require(game.ServerScriptService.Repositories.JobsRepository)
end

local JobsController = {}
local proxy = require(script.Parent.Controller)(JobsController, "JobsController")

function JobsController.StartJob(job)
    return JobsRepository.GetJob(job)
end

return proxy 