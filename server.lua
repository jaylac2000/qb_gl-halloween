QBCore = exports['qb-core']:GetCoreObject()

TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)

RegisterServerEvent('qb-halloween:getSurprise',function()
	local xPlayer = QBCore.Functions.GetPlayer(source)
	local surprise = Config.Items[math.random(#Config.Items)] 
	local amountGiven = math.random(Config.AmountMin, Config.AmountMax)
	xPlayer.Functions.AddItem(surprise,amountGiven)
	TriggerClientEvent("inventory:client:ItemBox", source, QBCore.Shared.Items[surprise], "add")
	TriggerClientEvent("QBCore:Notify", source, "Here is your Treat, Happy Halloween", "success", 10000)
	-- TriggerClientEvent('okokNotify:Alert', source, "Happy Halloween", "Here is your Treat", 10000, 'success')
	-- TriggerClientEvent("pNotify:SendNotification", -1, {text = '<b>Happy Halloween</b></br>Here is your Treat', timeout = 10000})
end)