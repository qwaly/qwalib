Inventory = {}

local ox_inventory = exports.ox_inventory

function Inventory:HasItem(itemName, metadata, amount)
	return ox_inventory:GetItemCount(itemName, metadata, false) >= amount
end
