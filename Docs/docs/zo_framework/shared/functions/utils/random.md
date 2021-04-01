# Utils.Random

```lua
Utils.Random(Min, Max)
```
> *This function return a random integer value*

#### Arguments
| Argument | Type | Optional | Default Value | Explanation |
|----------|------|----------|---------------|-------------|
| Min | integer | No | - | Min number integer |
| Max | integer | No | - | Max number integer |

??? example
    ```lua
    local Utils = New("Utils")

    print(Utils.Random(0, 10)) -- Prints a integer value between 0 and 10
    ```