# Player.RemoveItem

```lua
Player.RemoveItem(Item, Count)
```
> *This function remove items to player inventory*

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
        _Player.RemoveItem("item", 1)
    end)
    ```