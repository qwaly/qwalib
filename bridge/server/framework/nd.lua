local NDCore = exports["ND_Core"]

function Qwalib.bridge.framework.hasGroup(playerId, filter)
	local player = NDCore.getPlayer(playerId)
	if not player then return false end

	local jobName, jobInfo = player.getJob()
	local jobGrade = jobInfo.rank or 0

	local _type = type(filter)

	if _type == 'string' then
		if filter == jobName then
			return true
		end
	elseif _type == 'table' then
		local tabletype = table.type(filter)

		if tabletype == 'hash' then
			for name, grade in pairs(filter) do
				if jobName == name and grade <= jobGrade then
					return true
				end
			end
		elseif tabletype == 'array' then
			for j = 1, #filter do
				local name = filter[j]

				if jobName == name then
					return true
				end
			end
		end
	end
	return false
end
