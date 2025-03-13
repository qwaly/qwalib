local ox_core = exports.ox_core

function Qwalib.bridge.framework.hasGroup(playerId, filter)
	local player = ox_core.GetPlayer(playerId)
	if not player then return false end

	local playerGroups = player.getGroups()

	local _type = type(filter)

	if _type == 'string' then
		local grade = playerGroups[filter]

		if grade then
			return true
		end
	elseif _type == 'table' then
		local tabletype = table.type(filter)

		if tabletype == 'hash' then
			for name, grade in pairs(filter) do
				local playerGrade = playerGroups[name]

				if playerGrade and grade <= playerGrade then
					return true
				end
			end
		elseif tabletype == 'array' then
			for i = 1, #filter do
				local name = filter[i]
				local grade = playerGroups[name]

				if grade then
					return true
				end
			end
		end
	end
	return false
end
