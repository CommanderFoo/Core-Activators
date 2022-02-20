local DEBUG = script:GetCustomProperty("Debug")
local REGEN_AMOUNT = script:GetCustomProperty("RegenAmount")
local REGEN_SPEED = script:GetCustomProperty("RegenSpeed")
local EFFECT = script:GetCustomProperty("Effect")
local EFFECT_LOCATION = script:GetCustomProperty("EffectLocation"):WaitForObject()

local task = nil
local played_effect = false

local function enable(player)
	if(task == nil) then
		if(not played_effect and Environment.IsClient()) then
			World.SpawnAsset(EFFECT, { position = EFFECT_LOCATION:GetWorldPosition() })
			played_effect = true
		end

		if(DEBUG) then
			print("Regen activator running")
		end

		if(Environment.IsServer()) then
			Events.Broadcast("activator.set_resource", player, "Bell", 1)
		end

		if(Environment.IsServer()) then
			task = Task.Spawn(function()
				if(DEBUG) then
					print("Healing players")
				end

				Events.Broadcast("activate.apply_damage", -REGEN_AMOUNT)
			end)

			task.repeatInterval = REGEN_SPEED
			task.repeatCount = -1
		end
	end
end

local function disable()
	if(task ~= nil) then
		task:Cancel()
		task = nil

		if(DEBUG) then
			print("Regen activator stopped")
		end
	end

	played_effect = false
end

Events.Connect("activator.enable", enable)
Events.Connect("activator.disable", disable)