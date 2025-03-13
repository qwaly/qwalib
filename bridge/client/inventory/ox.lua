local ox_inventory = exports.ox_inventory

function Qwalib.bridge.inventory.hasItem(itemName, metadata, amount)
	return ox_inventory:GetItemCount(itemName, metadata, false) >= amount
end
