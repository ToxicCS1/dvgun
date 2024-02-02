AddEventHandler('chatMessage', function(source, n, msg)
	local Message = string.lower(msg)
	if (Message == "/dvgun on") then
		TriggerClientEvent('ObjectDeleteGunOn', source)
		CancelEvent()
	elseif (Message == "/dvgun off") then
		TriggerClientEvent('ObjectDeleteGunOff', source)
		CancelEvent()
	end
end)