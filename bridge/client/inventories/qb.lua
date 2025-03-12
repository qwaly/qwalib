Inventory = {}

local qb_inventory = exports['qb-inventory']

function Inventory:HasItem(itemName, metadata, amount)
	return qb_inventory:HasItem(itemName, amount)
end
