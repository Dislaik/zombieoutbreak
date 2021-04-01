# Player.RemoveWeapon

```lua
Player.RemoveWeapon(WeaponName)
```
> *This function remove a weapon to player inventory*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| WeaponName | string | No | - | Weapon name |

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        _Player.RemoveWeapon("weapon_pistol")
    end)
    ```