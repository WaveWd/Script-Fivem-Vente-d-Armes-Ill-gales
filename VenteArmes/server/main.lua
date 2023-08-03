ESX = exports["es_extended"]:getSharedObject()

RegisterNetEvent("give:weapon:player")
AddEventHandler("give:weapon:player", function(Price, Button, Name, Balles, NumberBalles)
    _src = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    if Config.BlackMoney then
        BlackMoneyJoueur = xPlayer.getInventoryItem("black_money").count
        if tonumber(Price) <= tonumber(BlackMoneyJoueur) then 
            xPlayer.removeInventoryItem("black_money", Price)      
            xPlayer.addInventoryItem(Name, 1)
            if Config.GiveAmmo then 
                xPlayer.addInventoryItem(Balles, NumberBalles)
            end
            TriggerClientEvent("notif:succes", _src, Price, Button)
        else 
            TriggerClientEvent("erreur:notif:money:player:wave", _src, Price, Button)
        end
    else 
        MoneyJoueur = xPlayer.getMoney()
        if tonumber(Price) <= tonumber(MoneyJoueur) then 
            xPlayer.removeMoney(Price)
            xPlayer.addInventoryItem(Name, 1)
            if Config.GiveAmmo then 
                xPlayer.addInventoryItem(Balles, NumberBalles)
            end
            TriggerClientEvent("notif:succes", _src, Price, Button)
        else 
            TriggerClientEvent("erreur:notif:money:player:wave", _src, Price, Button)
        end
    end
end)

RegisterNetEvent("give:ammo:player")
AddEventHandler("give:ammo:player", function(Button, Balles, Price, AmmoNumber)
    _src = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    if Config.BlackMoney then 
        BlackMoneyPlayer = xPlayer.getInventoryItem("black_money").count
        if tonumber(Price) <= tonumber(BlackMoneyPlayer) then
            xPlayer.removeInventoryItem("black_money", Price)      
            xPlayer.addInventoryItem(Balles, AmmoNumber)
            TriggerClientEvent("notif:ammo:succes:wave", _src, Button, Balles, Price, AmmoNumber)
        else 
            TriggerClientEvent("erreur:notif:money:player:wave", _src, Price, Button)
        end
    else 
        MoneyPlayer = xPlayer.getMoney()
        if tonumber(Price) <= tonumber(MoneyPlayer) then
            xPlayer.removeMoney(Price) 
            xPlayer.addInventoryItem(Balles, AmmoNumber)
            TriggerClientEvent("notif:ammo:succes:wave", _src, Button, Balles, Price, AmmoNumber)
        else 
            TriggerClientEvent("erreur:notif:money:player:wave", _src, Price, Button)
        end
    end
end)