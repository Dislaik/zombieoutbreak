# Player.GetInventory

```lua
Player.GetInventory()
```
> *This function gets player inventory.*

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Inventory = _Player.GetInventory()
        for key, value in pairs(Inventory) do
            print(key, value) -- Returns a table key-value of the player inventory
        end
    end)
    ```