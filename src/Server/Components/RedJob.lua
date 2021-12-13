local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local RedJob = Component.new({
  Tag = "RedJob",
  Ancestors = {workspace},
  Extensions = {}
})

RedJob.StartTime = 6
RedJob.EndTime = 12

function  RedJob:Construct()
  self.Maid =  Maid.new()
  
  self.ProxyimityPrompt = Instance.new("ProximityPrompt")
  self.ProxyimityPrompt.Parent = self.Instance
  self.ProxyimityPrompt.ObjectText = "TestJob"
  self.ProxyimityPrompt.ActionText = "Interact!"
  self.ProxyimityPrompt.HoldDuration = 1.5
  self.ProxyimityPrompt.MaxActivationDistance = 20



  self.Maid:GiveTask(self.ProxyimityPrompt)
  
  self.IsActive = false
  print("Constructed")
end


function RedJob:Start()
  print(self.Instance)
end

function RedJob:Stop()
  self.Maid:Cleanup()
  print("cleaning")
end

return RedJob