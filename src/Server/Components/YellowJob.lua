local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local YellowJob = Component.new({
  Tag = "YellowJob",
  Ancestors = {workspace},
  Extensions = {}
})

YellowJob.StartTime = 6
YellowJob.EndTime = 12

function  YellowJob:Construct()
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


function YellowJob:Start()
  print(self.Instance)
end

function YellowJob:Stop()
  self.Maid:Cleanup()
  print("cleaning")
end

return YellowJob