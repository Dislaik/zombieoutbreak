# Player.CanCarryItem

```lua
Player.CanCarryItem(Item, Count)
```
> *This function determine if you can carry an item.*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| Item | string | No | - | Item name |
| Count | integer | No | - | Item count |

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        if _Player.CanCarryItem("item", 1) then
            _Player.AddItem("item", 1)
        else
            print("Player can't carry more items")
        end
    end)
    ```