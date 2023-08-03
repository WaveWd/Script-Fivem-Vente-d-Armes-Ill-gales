ESX = exports["es_extended"]:getSharedObject()

local  function ShowHelpNotification(msg)
    BeginTextCommandDisplayHelp( "STRING" )
    AddTextComponentSubstringPlayerName( msg )
    EndTextCommandDisplayHelp( 0, 0, 1, -1 )
end

Citizen.CreateThread(function()
    local model = GetHashKey(Config.Ped)
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end 
    ped = CreatePed(CIVMALE, model, Config.PedPos.x, Config.PedPos.y, Config.PedPos.z, Config.PedPos.w, true, true)
    local animation = 'WORLD_HUMAN_DRUG_DEALER'
    RequestAnimDict('WORLD_HUMAN')
    ClearPedTasks(ped)
    TaskStartScenarioInPlace(ped, animation, 0, false)
    TaskPlayAnim(ped, animation, 8.0, true, 1.0, false, 0, false)
    if Config.PedFreeze then 
        Wait(10000)
        FreezeEntityPosition(ped, true)
    end
    if Config.PedBlocking then 
        SetBlockingOfNonTemporaryEvents(ped, true)
    end
    if Config.PedInvincible then 
        SetEntityInvincible(ped, true)
    end
end)

Citizen.CreateThread(function()
    if Config.OxTarget then 
        exports.ox_target:addBoxZone({
            coords = vec3(Config.PossitionOpenMenu.x, Config.PossitionOpenMenu.y, Config.PossitionOpenMenu.z),
            size = vec3(4, 4, 4),
            rotation = 45,
            debug = drawZones,
            drawSprite = true,
            options = {
                {
                    name = "Menu Armes",
                    icon = "fa-solid fa-gun",
                    label = "Ouvrir le menu",
                    onSelect = function()
                        OpenMenu()
                    end
                }
            }
        })
    else 
        Citizen.CreateThread(function()
            local coordsposlieux = vector3(Config.PossitionOpenMenu.x, Config.PossitionOpenMenu.y, Config.PossitionOpenMenu.z)
            while true do
                timer_wait = 1000
                local playerCoords = GetEntityCoords(PlayerPedId())
                local distance = #(playerCoords - coordsposlieux)
                if distance < 2 then
                    timer_wait = 0
                    ShowHelpNotification("Appuyez sur ~INPUT_CONTEXT~ pour ouvrir le menu")
                    if IsControlJustPressed(0, 51) then
                        OpenMenu()
                    end
                end
                Wait(timer_wait)
            end
        end)
    end
end)

RegisterNetEvent("notif:succes")
AddEventHandler("notif:succes", function(Price, Button)
    if string.lower(Config.Notif) == "okoknotif" then 
        TriggerEvent('okokNotify:Alert', "SUCCESS", "Vous venez d'acheter un(e) "..Button.." à "..Price.." $", 5000, 'success')
    elseif string.lower(Config.Notif) == "esx" then
        ESX.ShowAdvancedNotification("Notification","~g~Success !", "vous venez d'acheter un(e) "..Button.." à"..Price.." ~g~$", Config.EsxPicture, 1)
    end
end)

RegisterNetEvent("erreur:notif:money:player:wave")
AddEventHandler("erreur:notif:money:player:wave", function(Price, Button)
    if Config.BlackMoney then 
        if string.lower(Config.Notif) == "okoknotif" then 
            TriggerEvent('okokNotify:Alert', "ERREUR", "Vous n'avez pas assez d'argent sale !", 5000, 'error')
        elseif string.lower(Config.Notif) == "esx" then
            ESX.ShowAdvancedNotification("Notification","~r~ERREUR !", "Vous n'avez pas assez d'argent sale !", Config.EsxPicture, 1)
        end
    else 
        if string.lower(Config.Notif) == "okoknotif" then 
            TriggerEvent('okokNotify:Alert', "ERREUR", "Vous n'avez pas assez d'argent !", 5000, 'error')
        elseif string.lower(Config.Notif) == "esx" then
            ESX.ShowAdvancedNotification("Notification","~r~ERREUR !", "Vous n'avez pas assez d'argent !", Config.EsxPicture, 1)
        end
    end
end)

RegisterNetEvent("notif:ammo:succes:wave")
AddEventHandler("notif:ammo:succes:wave", function(Button, Balles, Price, AmmoNumber)
    if string.lower(Config.Notif) == "okoknotif" then 
        TriggerEvent('okokNotify:Alert', "SUCCESS", "Vous venez d'acheter ".. AmmoNumber.." balles de "..Button.." a "..Price.." $", 5000, 'success')
    elseif string.lower(Config.Notif) == "esx" then
        ESX.ShowAdvancedNotification("Notification","~g~Success !", "Vous venez d'acheter ".. AmmoNumber.." balles de "..Button.." a "..Price.." ~g~$", Config.EsxPicture, 1)
    end
end)