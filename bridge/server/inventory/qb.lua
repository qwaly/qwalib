local qb_inventory = exports['qb-inventory']

function Qwalib.bridge.inventory.hasItem(playerId, itemName, metadata, amount)
	return qb_inventory:GetItemCount(playerId, itemName) >= amount
end
