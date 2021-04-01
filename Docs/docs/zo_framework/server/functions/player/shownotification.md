# Player.ShowNotification

```lua
Player.ShowNotification(Message)
```
> *This function show a notification*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| Message | string | No | - | Message content |

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        _Player.ShowNotification("Test")
    end)
    ```