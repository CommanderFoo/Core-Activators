Events.Connect("activator.set_resource", function(player, resource, value)
	player:SetResource(resource, value)
end)

Events.Connect("activator.add_resource", function(player, resource, value)
	player:AddResource(resource, value)
end)

Events.Connect("activator.remove_resource", function(player, resource, value)
	player:RemoveResource(resource, value)
end)

Events.Connect("activator.apply_damage", function(amount)
	for i, p in ipairs(Game.GetPlayers()) do
		p:ApplyDamage(Damage.New(amount))
	end
end)

-- Game.playerJoinedEvent:Connect(function(player)
-- 	player:ApplyDamage(Damage.New(50))
-- end)

-- function Tick()
-- 	for i, p in ipairs(Game.GetPlayers()) do
-- 		print(p.hitPoints)
-- 	end

-- 	Task.Wait(1)
-- end