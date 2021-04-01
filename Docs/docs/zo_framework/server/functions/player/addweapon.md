# Player.AddWeapon

```lua
Player.AddWeapon(WeaponName, Ammo, Components, Tint)
```
> *This function add a weapon to player inventory*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| WeaponName | string | No | - | Weapon name |
| Ammo | integer | Yes | 0 | Weapon ammo |
| Components | array | Yes | nil | Weapon components |
| Tint | integer | Yes | 0 | Weapon tint |

??? example
    ```lua
    local Player = New("Player")

    RegisterEvent("ModuleName:EventName", function()
        local _Player = Player.Properties(source)
        _Player.AddWeapon("weapon_pistol", 60, {"Flashlight"}, 2)
    end)
    ```