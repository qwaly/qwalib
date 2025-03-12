Framework = {}

local NDCore = exports["ND_Core"]

function Framework.hasGroup(filter)
	local player = NDCore:getPlayer()
	local _type = type(filter)

	if _type == 'string' then
		if filter == player.job then
			return true
		end
	elseif _type == 'table' then
		local tabletype = table.type(filter)

		if tabletype == 'hash' then
			for name, grade in pairs(filter) do
				if player.job == name and grade <= (player?.jobInfo?.rank or 0) then
					return true
				end
			end
		elseif tabletype == 'array' then
			for j = 1, #filter do
				local name = filter[j]

				if player.job == name then
					return true
				end
			end
		end
	end
end
