local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local GreenJob = Component.new({
  Tag = "GreenJob",
  Ancestors = {workspace},
  Extensions = {}
})

GreenJob.StartTime = 8
GreenJob.EndTime = 14
GreenJob.GameObject = Instance.new("Part")


function  GreenJob:Construct()
  print("Constructed")

  self.Maid =  Maid.new()
  
  self.Instance.Name = "GreenJob"
  self.Instance.BrickColor = BrickColor.new("Dark green")
  self.Instance.Anchored = true
  
  self.ProxyimityPrompt = Instance.new("ProximityPrompt")
  self.ProxyimityPrompt.Parent = self.Instance
  self.ProxyimityPrompt.ObjectText = self.Instance.Name
  self.ProxyimityPrompt.ActionText = "Start!"
  self.ProxyimityPrompt.HoldDuration = 1.5
  self.ProxyimityPrompt.MaxActivationDistance = 20

  self.Maid:GiveTask(self.ProxyimityPrompt)  
  self.Maid:GiveTask(self.Instance)

end


function GreenJob:Start()
  self.Instance.Position = workspace.SpawnLocation.position + Vector3.new(10, 5, -10)
end

function GreenJob:Stop()
  self.Maid:Cleanup()
end

return GreenJob