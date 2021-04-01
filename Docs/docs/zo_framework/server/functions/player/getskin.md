# Player.GetSkin

```lua
Player.GetSkin()
```
> *This function gets player skin.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Skin = _Player.GetSkin()
        for key, value in pairs(Skin) do
            print(key, value) -- Returns a table with the player inventory
        end
    end)
    ```