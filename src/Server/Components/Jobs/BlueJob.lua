local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local BlueJob = Component.new({
  Tag = "Bluejob",
  Ancestors = {workspace},
  Extensions = {}
})

BlueJob.StartTime = 4
BlueJob.EndTime = 10
BlueJob.GameObject = Instance.new("Part")


function  BlueJob:Construct()
  self.Maid =  Maid.new()
  self.Instance.Name = "BlueJob"
  self.Instance.BrickColor = BrickColor.new("Navy blue")
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


function BlueJob:Start()
  self.Instance.Position = workspace.SpawnLocation.position + Vector3.new(-10, 5, -10)
end

function BlueJob:Stop()
  self.Maid:Cleanup()
end

return BlueJob