Events.Connect("activator.set_resource", function(player, resource, value)
	player:SetResource(resource, value)
end)

Events.Connect("activator.add_resource", function(player, resource, value)
	player:AddResource(resource, value)
end)

Events.Connect("activator.remove_resource", function(player, resource, value)
	player:RemoveResource(resource, value)
end)