local CollectionService = game:GetService("CollectionService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Maid = require(ReplicatedStorage.Packages.Maid)
local Component = require(ReplicatedStorage.Packages.Component)


local YellowJob = Component.new({
  Tag = "YellowJob",
  Ancestors = {workspace},
  Extensions = {}
})

YellowJob.StartTime = 8
YellowJob.EndTime = 16
YellowJob.GameObject = Instance.new("Part")


function  YellowJob:Construct()
  self.Maid =  Maid.new()

  self.Instance.Name = "YellowJob"
  self.Instance.BrickColor = BrickColor.new("Fire Yellow")
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


function YellowJob:Start()
  self.Instance.Position = workspace.SpawnLocation.position + Vector3.new(10, 5, 10)
end

function YellowJob:Stop()
  self.Maid:Cleanup()
end

return YellowJob