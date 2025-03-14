local qb_core = exports['qb-core']:GetCoreObject()

local success, result = pcall(function()
	return qb_core.Functions.GetPlayerData()
end)

local playerData = success and result or {}

AddEventHandler('QBCore:Client:OnPlayerLoaded', function()
	playerData = qb_core.Functions.GetPlayerData()
end)

RegisterNetEvent('QBCore:Player:SetPlayerData', function(val)
	if source == '' then return end

	playerData = val
end)

function Qwalib.bridge.framework.hasGroup(filter)
	local _type = type(filter)

	if _type == 'string' then
		local job = playerData.job.name == filter
		local gang = playerData.gang.name == filter
		local citizenId = playerData.citizenid == filter

		if job or gang or citizenId then
			return true
		end
	elseif _type == 'table' then
		local tabletype = table.type(filter)

		if tabletype == 'hash' then
			for name, grade in pairs(filter) do
				local job = playerData.job.name == name
				local gang = playerData.gang.name == name
				local citizenId = playerData.citizenid == name

				if job and grade <= playerData.job.grade.level or gang and grade <= playerData.gang.grade.level or citizenId then
					return true
				end
			end
		elseif tabletype == 'array' then
			for i = 1, #filter do
				local name = filter[i]
				local job = playerData.job.name == name
				local gang = playerData.gang.name == name
				local citizenId = playerData.citizenid == name

				if job or gang or citizenId then
					return true
				end
			end
		end
	end
	return false
end
