# Player.GetGroup

```lua
Player.GetGroup()
```
> *This function gets player group.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Group = _Player.GetGroup()
        print(Group) -- Returns player group
    end)
    ```