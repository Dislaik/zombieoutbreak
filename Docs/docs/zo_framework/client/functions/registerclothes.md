# Register.Clothes

```lua
Register.Clothes(Item, Sex, Component, DrawableId)
```
> *This function register an item how a usable clothes.*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| Item | string | No | - | Item that can be usable |
| Sex | string | No | - | Clothes for player sex |
| Component | integer | No | - | Component of skin |
| DrawableId | integer | No | - | DrawableId of component |

??? info
    Go to <Link\> for all clothes

??? example
    ```lua
    local Register = New("Register")

    Register.Clothes("test", "male", 0, 52)
    Register.Clothes("test", "female", 0, 55)
    ```