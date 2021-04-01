# Register.Item

```lua
Register.Item(Item, CB)
```
> *This function creates an executable process when used.*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| Item | string | No | - | Item that can be usable |
| CB | function | No | - | Code when used |

??? example
    ```lua
    local Register = New("Register")

    Register.Item("item", function() 
        print("Item used")
    end)
    ```