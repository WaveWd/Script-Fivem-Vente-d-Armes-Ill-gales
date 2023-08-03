Config = {}

----------------------------- Menu RageUI -----------------------------

ConfigMenu = {
    ["MenuPrincipal"] = {
        Name = "Ventes d'Armes",
        Desc = "Liste Des Armes :",
    },   

    ["MenuArmes"] = {
        Name = "Ventes d'Armes",
        Desc = "Liste Des Armes :",
    },

    ["MenuAmmo"] = {
        Name = "Ventes d'Armes",
        Desc = "Liste Des Balles :",
    },
}

Config.PossitionOpenMenu = vec4(90.813423, 3747.779297, 40.772297, 158.832764)

----------------------------- Config Ped ----------------------------- 

Config.Ped = "a_m_m_soucent_04"
Config.PedPos = vec4(90.600716, 3747.240723, 40.772335, 336.598328)
Config.PedFreeze = false -- Freeze le ped 
Config.PedBlocking = true -- Le ped ne prendra pas en compte son environnement.
Config.PedInvincible = true

--------------------------- Autres Options ---------------------------

Config.Notif = "okoknotif" -- esx ou okoknotif 
Config.EsxPicture = "CHAR_AMMUNATION"
Config.OxTarget = true 

-------------------------- Catégories Armes --------------------------

Config.BlackMoney = true -- Si vous mettez 'false', le joueur paiera en (money)
Config.GiveAmmo = true -- Si cette option est vraie, les balles seront données au joueur en même temps que l'arme.

ArmesMenu = {
    {Button = "Pistolé", Armes = "weapon_ceramicpistol", Price = 1000, Balles = "ammo-9", NumberBalles = 30},
}

------------------------- Catégories de Balles -------------------------

AmmoMenu = {
    {Button = "9 millimètres", Balles = "ammo-9", Price = 1000, AmmoNumber = 10},
}
