# Player.HasWeapon

```lua
Player.HasWeapon(WeaponName)
```
> *This function determines if the player has a weapon.*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| WeaponName | string | No | - | Weapon name |

??? example
```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        if _Player.HasWeapon("weapon_pistol") then
            print("Player has pistol in his inventory")
        end
    end)
    ```