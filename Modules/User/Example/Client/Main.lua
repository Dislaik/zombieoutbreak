local Example2 = M("Example2")

--print(Module.test())

RegisterCommand("test2", function(source, args, rawCommand)
    --print(Player:getPlayer():Loaded())
    print(Example2.Test())
    --print(Root.Modules[3][2].ENV.Client.Test())
end, false)

SetInterval(5000, function()
    print(Example2.Test())
    Example2.Test(true)

end)