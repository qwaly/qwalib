Framework = {}

function Framework.hasGroup(filter)
	local _type = type(filter)

	if _type == 'string' then
		return true
	elseif _type == 'table' then
		local tabletype = table.type(filter)

		if tabletype == 'hash' then
			for name, grade in pairs(filter) do
				return true
			end
		elseif tabletype == 'array' then
			for j = 1, #filter do
				local name = filter[j]

				return true
			end
		end
	end
end
