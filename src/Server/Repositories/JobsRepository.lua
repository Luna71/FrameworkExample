local JobsRepository = {}

local Jobs = {
    GarbageCollection = {
        Name = "GarbageCollection",
        Reward = 100,
        
    }
}

function JobsRepository.GetJob(job)
    return Jobs[job]
end


return JobsRepository 