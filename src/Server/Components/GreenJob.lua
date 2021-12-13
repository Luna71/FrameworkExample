local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local GreenJob = Component.new({
  Tag = "GreenJob",
  Ancestors = {workspace},
  Extensions = {}
})

GreenJob.StartTime = 6
GreenJob.EndTime = 12

function  GreenJob:Construct()
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


function GreenJob:Start()
  print(self.Instance)
end

function GreenJob:Stop()
  self.Maid:Cleanup()
  print("cleaning")
end

return GreenJob