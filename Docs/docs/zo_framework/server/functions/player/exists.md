# Player.Exists

```lua
Player.Exists()
```
> *This function determines if the player exists.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local PlayerExist = _Player.Exists()
        print(PlayerExist) -- Returns true or false
    end)
    ```