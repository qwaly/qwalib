local ox_inventory = exports.ox_inventory

function Qwalib.bridge.inventory.hasItem(playerId, itemName, metadata, amount)
	return ox_inventory:GetItemCount(playerId, itemName, metadata, false) >= amount
end
