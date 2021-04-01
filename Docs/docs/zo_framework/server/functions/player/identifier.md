# Player.Identifier

```lua
Player.Identifier()
```
> *This function gets player identifier.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Identifier = _Player.Identifier()
        print(Identifier) -- Returns player identifier
    end)
    ```