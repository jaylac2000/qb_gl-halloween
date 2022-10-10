----------- / Eat

QBCore.Functions.CreateUseableItem("candycorn", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatCandy", source, item.name)
end)

QBCore.Functions.CreateUseableItem("candyghosts", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatCandy", source, item.name)
end)

QBCore.Functions.CreateUseableItem("candygreen", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatCandy", source, item.name)
end)

QBCore.Functions.CreateUseableItem("candygum", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatCandy", source, item.name)
end)

QBCore.Functions.CreateUseableItem("candygumworm", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatCandy", source, item.name)
end)

QBCore.Functions.CreateUseableItem("candypumpkins", function(source, item)
    local Player = QBCore.Functions.GetPlayer(source)
	if not Player.Functions.RemoveItem(item.name, 1, item.slot) then return end
    TriggerClientEvent("consumables:client:EatCandy", source, item.name)
end)