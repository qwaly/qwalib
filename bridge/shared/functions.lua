function HasExport(export)
	local resource, exportName = string.strsplit('.', export)

	return pcall(function()
		return exports[resource][exportName]
	end)
end
