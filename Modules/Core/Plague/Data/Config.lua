Config = {}

Config.DistanceTarget = 20.0
Config.ZombieHealth = 300
Config.ZombieDamage = 10
Config.ZombieCanRagdollByShots = false
Config.ZombieInstantDeathByHeadshot = true
Config.ZombieCanRun = true
Config.ZombieSound = true -- if true, performance will suffer

Config.MaxItemsLoot = 3
Config.MaxItemCount = 2
Config.MaxWeaponAmmo = 30
Config.LootProbability = {
    Items = 0, -- 0%
    Clothes = 15, -- 15%
    Weapons = 0 -- 0%
    -- 85% No Loot
}
Config.Loot = {
    Items = {},
    Clothes = {
        "unemployedtshirt",
        "unemployedpants",
        "unemployedshoes"
    },
    Weapons = {}
}

Config.Debug = false
