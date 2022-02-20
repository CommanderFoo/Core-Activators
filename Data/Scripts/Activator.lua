local ROOT = script:GetCustomProperty("Root"):WaitForObject()
local TRIGGER = script:GetCustomProperty("Trigger"):WaitForObject()
local DEFAULT_STATE = script:GetCustomProperty("DefaultState"):WaitForObject()
local ACTIVE_STATE = script:GetCustomProperty("ActiveState"):WaitForObject()

local ACTIVE_STATE_DURATION = ROOT:GetCustomProperty("ActiveStateDuration")


local function on_trigger_enter(trigger, other)
	if(Object.IsValid(other) and other:IsA("Player")) then
		DEFAULT_STATE.visibility = Visibility.FORCE_OFF
		DEFAULT_STATE.collision = Collision.FORCE_OFF

		ACTIVE_STATE.visibility = Visibility.FORCE_ON
		ACTIVE_STATE.collision = Collision.FORCE_ON

		Events.Broadcast("activator.enable", other)

		Task.Wait(ACTIVE_STATE_DURATION)

		DEFAULT_STATE.visibility = Visibility.FORCE_ON
		DEFAULT_STATE.collision = Collision.FORCE_ON

		ACTIVE_STATE.visibility = Visibility.FORCE_OFF
		ACTIVE_STATE.collision = Collision.FORCE_OFF

		Events.Broadcast("activator.disable")
	end
end

TRIGGER.beginOverlapEvent:Connect(on_trigger_enter)