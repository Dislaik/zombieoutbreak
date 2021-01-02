Root = {}
Modules = {}


local Categories = {"Core", "Base", "User"}
local Fxmanifest = {"Shared", "Client", "Server"}
for i in pairs(Categories) do
    local File = GetDataFile("Modules/" .. Categories[i] .. "/Modules.json")
    local JSONData = json.decode(File)
    table.insert(Modules, Categories[i])
    Modules[i] = {}
    for j in pairs(JSONData) do
        print("^1[ZO] ^5[".. JSONData[j] .."] Loaded^7")
        table.insert(Modules[i], JSONData[j])
        Modules[i][j] = {}
        Modules[i][j]["Path"] = "Modules/" .. Categories[i] .. "/" .. JSONData[j] .. "/"
        Modules[i][j]["Category"] = Categories[i]
        Modules[i][j]["Name"] = JSONData[j]
        Modules[i][j]["CodeSide"] = {}
        for k in pairs(Fxmanifest) do
            Modules[i][j]["CodeSide"][Fxmanifest[k]] = {}
            local EventsCode = GetDataFile("Modules/" .. Categories[i] .. "/" .. JSONData[j] .. "/".. Fxmanifest[k] .."/Events.lua")
            local MainCode = GetDataFile("Modules/" .. Categories[i] .. "/" .. JSONData[j] .. "/".. Fxmanifest[k] .."/Main.lua")
            Modules[i][j]["CodeSide"][Fxmanifest[k]]["Events"] = EventsCode
            Modules[i][j]["CodeSide"][Fxmanifest[k]]["Main"] = MainCode
        end
    end
end
LoadModules("Shared")