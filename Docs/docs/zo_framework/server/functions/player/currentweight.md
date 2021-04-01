# Player.CurrentWeight

```lua
Player.CurrentWeight()
```
> *This function gets current weight of player*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Weight = _Player.CurrentWeight()
        print(Weight) -- Returns current weight of player
    end)
    ```