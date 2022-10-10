-- Events

RegisterNetEvent('consumables:client:EatCandy', function(itemName)
    TriggerEvent('animations:client:EmoteCommandStart', {"egobar"})
    QBCore.Functions.Progressbar("eat_something", "Eating Candy..", 5000, false, true, {
        disableMovement = false,
        disableCarMovement = false,
		disableMouse = false,
		disableCombat = true,
    }, {}, {}, {}, function() -- Done
        TriggerEvent("inventory:client:ItemBox", QBCore.Shared.Items[itemName], "remove")
        TriggerEvent('animations:client:EmoteCommandStart', {"c"})
        TriggerServerEvent("consumables:server:addHunger", QBCore.Functions.GetPlayerData().metadata["hunger"] + ConsumablesEat[itemName])
        TriggerServerEvent('hud:server:RelieveStress', math.random(2, 4))
    end)
end)