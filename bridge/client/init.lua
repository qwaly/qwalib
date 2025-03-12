if HasExport('es_extended.getSharedObject') then
	require 'client.framework.esx'
elseif HasExport('ND_Core.getPlayer') then
	require 'client.framework.nd'
elseif HasExport('ox_core.GetPlayer') then
	require 'client.framework.ox'
elseif HasExport('qb_core.GetCoreObject') then
	require 'client.framework.qb'
elseif HasExport('qbx_core.HasGroup') then
	require 'client.framework.qbx'
else
	require 'client.framework.standalone'
end

if HasExport('ox_inventory:getCurrentWeapon') then
	require 'client.inventory.ox'
elseif HasExport('qb-inventory:HasItem') then
	require 'client.inventory.qb'
else
	require 'client.inventory.standalone'
end
