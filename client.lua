
RegisterNetEvent('ObjectDeleteGunOn')
RegisterNetEvent('ObjectDeleteGunOff')
local toggle = false

AddEventHandler('ObjectDeleteGunOn', function()
	toggle = true
	drawNotification("~g~DV Gun Enabled!")
end)

AddEventHandler('ObjectDeleteGunOff', function()
	toggle = false
	drawNotification("~r~DV Gun Disabled!")
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if toggle then
			if IsPlayerFreeAiming(PlayerId()) then
				local entity = getEntity(PlayerId())
				if IsPedShooting(GetPlayerPed(-1)) then
					SetEntityAsMissionEntity(entity, true, true)
					DeleteEntity(entity)
				end
			end
		end
	end
end)

function getEntity(player)
	local result, entity = GetEntityPlayerIsFreeAimingAt(player)
	return entity
end

function drawNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(false, false)
end