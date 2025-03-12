require("@qbx_core/modules/playerdata")
Framework = {}
local QBX = exports.qbx_core

function Framework.hasGroup(filter)
	local player = QBX.PlayerData
	local job = player.job

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
end
