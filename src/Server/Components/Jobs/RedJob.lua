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
RedJob.GameObject = Instance.new("Part")

function  RedJob:Construct()
  self.Maid =  Maid.new()

  self.Instance.Name = "RedJob"
  self.Instance.BrickColor = BrickColor.new("Really red")
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


function RedJob:Start()
  self.Instance.Position = workspace.SpawnLocation.position + Vector3.new(-10, 5, 10)
end

function RedJob:Stop()
  self.Maid:Cleanup()
end

return RedJob