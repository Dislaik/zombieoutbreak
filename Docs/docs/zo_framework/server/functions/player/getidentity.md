# Player.GetIdentity

```lua
Player.GetIdentity()
```
> *This function gets player identity.*

#### Data
| Data | Type | Explanation |
|------|------|-------------|
| Name | string | Player Name |
| Date Of Birth | string | Player Date of Birth |
| Sex | string | Player Gender |
| Occupation | string | Player Occupation |

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        local Identity = _Player.GetIdentity()
        for key, value in pairs(Identity) do
            print(key, value) -- Returns a table key-value of the player identity
        end
    end)
    ```