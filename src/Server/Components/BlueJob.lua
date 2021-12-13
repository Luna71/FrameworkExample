local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local BlueJob = Component.new({
  Tag = "Bluejob",
  Ancestors = {workspace},
  Extensions = {}
})

BlueJob.StartTime = 6
BlueJob.EndTime = 12

function  BlueJob:Construct()
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


function BlueJob:Start()
  print(self.Instance)
end

function BlueJob:Stop()
  self.Maid:Cleanup()
  print("cleaning")
end

return BlueJob