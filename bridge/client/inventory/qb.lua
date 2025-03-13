local qb_inventory = exports['qb-inventory']

function Qwalib.bridge.inventory.hasItem(itemName, metadata, amount)
	return qb_inventory:HasItem(itemName, amount)
end
