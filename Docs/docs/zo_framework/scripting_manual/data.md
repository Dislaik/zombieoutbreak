# Data

### Config

*Location: `Example/Data/Config.lua`* 
```lua
Config = {}
Config.Test = "Example config test"
```
*Load in a lua file*
```lua
local Config = Load("Data/Config.lua")["Config"]

print(Config.Test) -- Prints "Example config test"
```

??? note
    You can see this example in `@zombieoutbreak/Modules/User/Example`

### Translations

*Location: `Example/Data/Locales/EN.lua`* 
```lua
Translations = {
    ["Test"] = "This is a example test"
}
```
*Load in a lua file*
```lua
local Translations = Load("Data/Locales/EN.lua")["Translations"]
LoadTranslation(Translations)

print(Translate("Example:Test")) --Prints "This is a example test"
```  

??? note
    You can see this example in `@zombieoutbreak/Modules/User/Example`
