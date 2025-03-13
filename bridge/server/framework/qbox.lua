local qbx_core = exports.qbx_core

function Qwalib.bridge.framework.hasGroup(playerId, filter)
	local player = qbx_core:GetPlayer(playerId)
	if not player then return false end

	local job = player.PlayerData.job

	local _type = type(filter)

	if _type == 'string' then
		if filter == job.name then
			return true
		end
	elseif _type == 'table' then
		local tabletype = table.type(filter)

		if tabletype == 'hash' then
			for name, grade in pairs(filter) do
				if job.name == name and grade <= job.grade.level then
					return true
				end
			end
		elseif tabletype == 'array' then
			for j = 1, #filter do
				local name = filter[j]

				if job.name == name then
					return true
				end
			end
		end
	end
	return false
end
