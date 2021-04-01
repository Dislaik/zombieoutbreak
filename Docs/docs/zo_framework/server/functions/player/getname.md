# Player.GetName

```lua
Player.GetName()
```
> *This function gets player name.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Name = _Player.GetName()
        print(Name) -- Returns player name
    end)
    ```