# Player.RemoveWeaponAmmo

```lua
Player.RemoveWeaponAmmo(WeaponName, Ammo)
```
> *This function remove ammo from a weapon of player*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| WeaponName | string | No | - | Weapon name |
| Ammo | integer | No | - | Weapon ammo |

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        _Player.RemoveWeaponAmmo("weapon_pistol", 60)
    end)
    ```