
QBCore = exports['qb-core']:GetCoreObject()
local zone = 0
local ped

Citizen.CreateThread(function()
    while true do
        Wait(5000)
        PlayerData = QBCore.Functions.GetPlayerData()
        if PlayerData.job ~= nil then
            PlayerJob = PlayerData.job.name
        end
    end
end)

RegisterNetEvent('QBCore:Client:OnPlayerLoaded')
AddEventHandler('QBCore:Client:OnPlayerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

Citizen.CreateThread(function()

    for k,v in pairs(Config.Doors) do
        zone = zone+1
        exports['qb-target']:AddBoxZone(zone, v.coords, 2.0, 2.0, {
            name=zone,
            heading=0,
            debugPoly=false,
            minZ=v.z,
            maxZ=v.z+10
        }, {
            options = {
                {
                event = "qb-halloween:knockOnDoor",
                icon = "fas fa-door",
                label = "Knock",
                },
            },
                job = {"all"},
                distance = 3
        })             
    end

end)


RegisterNetEvent('qb-halloween:knockOnDoor',function()
    for k,v in pairs(Config.Doors) do 
    -- Check distance to door
    local dst = #(GetEntityCoords(PlayerPedId()) - v.coords)
        -- If within .9, and the door isn't looted yet
        if dst < 3 and not v.looted then
            v.looted = true
            LoadAnimDict("timetable@jimmy@doorknock@")
            TaskPlayAnim(PlayerPedId(), "timetable@jimmy@doorknock@", "knockdoor_idle", 8.0, 1.0, -1, 17, 0, 0, 0, 0)
            Wait(3000)
            playAnim()
            print('Looted')

            break
        end
    end
end)



function LoadAnimDict( dict )
    while ( not HasAnimDictLoaded( dict ) ) do
        RequestAnimDict( dict )
        Citizen.Wait( 5 )
    end
end
function playAnim()
    local hash = GetHashKey(Config.Peds[math.random(#Config.Peds)])
    print(hash)
    if not HasModelLoaded(hash) then
        RequestModel(hash)
        Wait(10)
    end
    while not HasModelLoaded(hash) do 
        Wait(10)
    end
    local heading = GetEntityHeading(PlayerPedId())
    local playerPos = GetEntityCoords(PlayerPedId())
    local frontx = GetEntityForwardX(PlayerPedId())
    local fronty = GetEntityForwardY(PlayerPedId())
    ped = CreatePed(5, hash, playerPos.x + (frontx), playerPos.y --[[+ (fronty * 1)]], playerPos.z - 1, (heading - 180), true, false)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    Wait(1000)
    LoadAnimDict("mp_safehouselost@")
    TaskPlayAnim(PlayerPedId(), "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    TaskPlayAnim(ped, "mp_safehouselost@", "package_dropoff", 8.0, 1.0, -1, 16, 0, 0, 0, 0 )
    Wait(3000)
    DeleteEntity(ped)
    TriggerServerEvent('qb-halloween:getSurprise')
    SetModelAsNoLongerNeeded(hash)
end