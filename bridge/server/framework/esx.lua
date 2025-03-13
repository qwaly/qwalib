local ESX = exports.es_extended:getSharedObject()
local groups = { 'job', 'job2' }

function Qwalib.bridge.framework.hasGroup(playerId, filter)
	local xPlayer = ESX.GetPlayerFromId(playerId)
	if not xPlayer then return false end

	local _type = type(filter)
	for i = 1, #groups do
		local group = groups[i]

		if _type == 'string' then
			local data = xPlayer[group]

			if filter == data?.name then
				return true
			end
		elseif _type == 'table' then
			local tabletype = table.type(filter)

			if tabletype == 'hash' then
				for name, grade in pairs(filter) do
					local data = xPlayer[group]

					if data?.name == name and grade <= data.grade then
						return true
					end
				end
			elseif tabletype == 'array' then
				for j = 1, #filter do
					local name = filter[j]
					local data = xPlayer[group]

					if data?.name == name then
						return true
					end
				end
			end
		end
	end
	return false
end
