Qwalib = {
	bridge = {
		framework = {},
		inventory = {}
	}
}

if HasExport('es_extended.getSharedObject') then
	require 'server.framework.esx'
elseif HasExport('ND_Core.getPlayer') then
	require 'server.framework.nd'
elseif HasExport('ox_core.GetPlayer') then
	require 'server.framework.ox'
elseif HasExport('qb_core.GetCoreObject') then
	require 'server.framework.qb'
elseif HasExport('qbx_core.HasGroup') then
	require 'server.framework.qbx'
else
	require 'server.framework.standalone'
end

if HasExport('ox_inventory:getCurrentWeapon') then
	require 'server.inventory.ox'
elseif HasExport('qb-inventory:HasItem') then
	require 'server.inventory.qb'
else
	require 'server.inventory.standalone'
end
