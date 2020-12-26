Register.Command("giveweapon", "Admin", function(Source, Arguments, RawCommand)
    if Arguments[3] == nil then
        _Player = Player(Source)
    else
        _Player = Player(Arguments[3])
    end

    _Player.AddWeapon(Arguments[1], tonumber(Arguments[2]))

end, "Give weapon to a player", {
    { name="Weapon", help="Set weapon name" },
    { name="Ammo", help="Set weapon ammo" }
})

Register.Command("giveitem", "Admin", function(Source, Arguments, RawCommand)
    if Arguments[3] == nil then
        _Player = Player(Source)
    else
        _Player = Player(Arguments[3])
    end

    _Player.AddItem(Arguments[1], Arguments[2])

end, "Give item to a player", {
    { name="Item", help="Set item name" },
    { name="Count", help="Set item count" }
})