Register.Command("giveweapon", "Admin", function(Source, Arguments, RawCommand)
    if Arguments[3] == nil then _Player = Player(Source)
    else _Player = Player(tonumber(Arguments[3])) end
    _Player.AddWeapon(Arguments[1], tonumber(Arguments[2]))
end, "Give weapon to a player", {
    { name="Weapon", help="Set weapon name" },
    { name="Ammo", help="Set weapon ammo" }
})

Register.Command("giveitem", "Admin", function(Source, Arguments, RawCommand)
    if Arguments[3] == nil then _Player = Player(Source)
    else _Player = Player(tonumber(Arguments[3])) end
    _Player.AddItem(Arguments[1], tonumber(Arguments[2]))
end, "Give item to a player", {
    { name="Item", help="Set item name" },
    { name="Count", help="Set item count" }
})

Register.Command("spawncar", "Admin", function(Source, Arguments, RawCommand)
    if Arguments[2] == nil then
        TriggerClientEvent("Admin:GiveVehicle", Source, Arguments[1])
    else 
        TriggerClientEvent("Admin:GiveVehicle", tonumber(Arguments[2]), Arguments[1])
    end
end, "Give car to a player", {
    { name="Car", help="Set car name" }
})

Register.Command("revive", "Admin", function(Source, Arguments, RawCommand)
    if Arguments[1] == nil then
        TriggerClientEvent("Admin:Revive", Source)
    else 
        TriggerClientEvent("Admin:Revive", tonumber(Arguments[1]))
    end
end, "Revive a player", {
    { name="PlayerId", help="Player id" }
})