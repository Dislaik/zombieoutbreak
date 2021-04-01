# Player.AddWeaponAmmo

```lua
Player.AddWeaponAmmo(WeaponName, Ammo)
```
> *This function add ammo to a weapon of player*

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
        _Player.AddWeaponAmmo("weapon_pistol", 60)
    end
    ```