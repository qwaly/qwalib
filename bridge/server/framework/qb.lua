local qb_core = exports['qb-core']

function Qwalib.bridge.framework.hasGroup(playerId, filter)
	local player = qb_core.Functions.GetPlayer(playerId)
	if not player then return false end

	local playerData = player.PlayerData

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
