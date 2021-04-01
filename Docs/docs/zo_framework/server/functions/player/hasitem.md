# Player.HasItem

```lua
Player.HasItem(Item)
```
> *This function determines if the player has a certain item.*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| Item | string | No | - | Item name |

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local HasItem, Count = _Player.HasItem("item")
        if HasItem then
            print("Player has item x".. Count .." in his inventory")
        end
    end)
    ```