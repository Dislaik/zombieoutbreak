# Player.GetOccupation

```lua
Player.GetOccupation()
```
> *This function gets player occupation.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Occupation = _Player.GetOccupation()
        print(Occupation) -- Returns player occupation
    end)
    ```