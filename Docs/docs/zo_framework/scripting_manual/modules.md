# Modules

### What is modules concept?  
*Modules is a set of standardized parts or independent units that can be used to construct a more complex structure, in this case, a framework for FiveM.*

### Which are core files that conform a module?  
*A module is made up of three core files*  

- `Events.lua`  
- `Main.lua`  
- `Module.lua`  

*It's not necessary that each of them obligatory exist in a module to function, but they are the only functional ones to perform their respective operations.*

\- Events.lua  
*All events of the module must be was here, this is the first file loaded in any module, a module need pre-loading his events for to later be available to be used.*

\- Main.lua  
*Here happens all process of must be initialized.*

\- Module.lua  
*In this file, you can create functions that can be shared with another modules (or use for himself).*

??? example

    *Module Name: `ModuleSource`*
    ```lua
    Module.Test = function()
        print("This is a example from ModuleSource")
    end
    ```

    *Module Name: `ModuleTarget`*
    ```lua
    local ModuleTest = New("ModuleSource")

    ModuleTest.Test() -- Prints "This is a example from ModuleSource"
    ```

!!! warning
    *It's recommended to caution module call on `Module.lua` or maybe you get a infinite bucle that result in a crash.*

### How running a module?  
*You can running a module in a Json file called `Modules.json`, you can found this file in each of the module groups.*

```json
[
    "ModuleName"
]
```

### What is INFO.md?
*Is a file that contain all information about the module, its use is purely to help keep everything neat and organized.*