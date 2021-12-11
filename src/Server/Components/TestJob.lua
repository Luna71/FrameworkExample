local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local TestJob = Component.new({
  Tag = "TestJob",
  Ancestors = {workspace},
  Extensions = {}
})

TestJob.StartTime = 6
TestJob.EndTime = 12

function  TestJob:Construct()
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


function TestJob:Start()
  print(self.Instance)
end

function TestJob:Stop()
  self.Maid:Cleanup()
  print("cleaning")
end

return TestJob