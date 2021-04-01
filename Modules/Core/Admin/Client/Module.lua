local Player = M("Player")


RegisterCommand("test2", function(source, args, rawCommand)
    --print(Player:getPlayer():Loaded())
    --print("Hola")
    print(Player.loaded)
    --print(Player.getPlayer():loaded(true))
end, false)