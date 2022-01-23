ESX = nil
local doorState = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_doorlock:updateState')
AddEventHandler('esx_doorlock:updateState', function(doorIndex, state)
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer and type(doorIndex) == 'number' and type(state) == 'boolean' and Config.DoorList[doorIndex] and isAuthorized(xPlayer, Config.DoorList[doorIndex]) then
		doorState[doorIndex] = state
		TriggerClientEvent('esx_doorlock:setDoorState', -1, doorIndex, state)
	end
end)

ESX.RegisterServerCallback('esx_doorlock:getDoorState', function(source, cb)
	cb(doorState)
end)

function isAuthorized(xPlayer, door)
	local checkID = false
	local employed = true
	
	if not xPlayer.job or (xPlayer.job and xPlayer.job.name == 'unemployed') then
		employed = false
	end
	
	if door.identifier ~= nil then
		checkID = true
	end
	
	if employed then
		if door.authorizedJobs ~= nil then
			for k,job in pairs(door.authorizedJobs) do
				if job == xPlayer.job.name then
					return true
				end
			end
		end
	
		if checkID then
			return ValidID(xPlayer, door)
		end
	else
		return ValidID(xPlayer, door)
	end    
	
	return false
end

function ValidID(xPlayer, door)
	if xPlayer.identifier == door.identifier then
		return true
	end

	return false
end