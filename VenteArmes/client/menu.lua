ESX = exports["es_extended"]:getSharedObject()

local menu_vente = RageUI.CreateMenu(ConfigMenu["MenuPrincipal"].Name, ConfigMenu["MenuPrincipal"].Desc)
local menu_armes = RageUI.CreateSubMenu(menu_vente, ConfigMenu["MenuArmes"].Name, ConfigMenu["MenuArmes"].Desc)
local menu_ammo = RageUI.CreateSubMenu(menu_vente, ConfigMenu["MenuAmmo"].Name, ConfigMenu["MenuAmmo"].Desc)

menu_vente.Closed = function()
    menu_isopen = false
end

function OpenMenu()
    if menu_isopen then 
        return 
    else 
        menu_isopen = true 
        RageUI.Visible(menu_vente, true)

        Citizen.CreateThread(function()
            while menu_isopen do 
                Wait(1)
                RageUI.IsVisible(menu_vente, function()
                    RageUI.Separator("Catégories :")
                    RageUI.line()
                    RageUI.Button("Catégories Armes", "Accéder à la liste des armes.", {RightLabel = "→→"}, true, {},menu_armes)
                    RageUI.Button("Catégories Balles", "Accéder à la liste des balles", {RightLabel = "→→"}, true, {},menu_ammo)
                    
                end)
                RageUI.IsVisible(menu_armes, function()
                    RageUI.Separator("Liste Des Armes")
                    RageUI.line()
                    for k,v in pairs (ArmesMenu) do 
                        RageUI.Button(v.Button, "Achete un(e) "..v.Button.. " pour "..v.Price.." ~g~$", {RightBadge = RageUI.BadgeStyle.Gun}, true,{
                            onSelected = function()
                                TriggerServerEvent("give:weapon:player", v.Price, v.Button, v.Armes, v.Balles, v.NumberBalles)
                            end
                        })
                    end
                end)
                RageUI.IsVisible(menu_ammo, function()
                    RageUI.Separator("Liste Des Balles")
                    RageUI.line()
                    for k,v in pairs (AmmoMenu) do 
                        RageUI.Button(v.Button, "Acheter "..v.AmmoNumber.." balles: "..v.Button.." pour "..v.Price.." ~g~$", {RightBadge = RageUI.BadgeStyle.Ammo}, true, {
                            onSelected = function()
                                TriggerServerEvent("give:ammo:player", v.Button, v.Balles, v.Price, v.AmmoNumber)
                            end
                        })
                    end
                end)
            end
        end)
    end
end
