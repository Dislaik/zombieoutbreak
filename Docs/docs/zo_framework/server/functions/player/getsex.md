# Player.GetSex

```lua
Player.GetSex()
```
> *This function gets player sex.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Sex = _Player.GetSex()
        print(Sex) -- Returns player sex
    end)
    ```