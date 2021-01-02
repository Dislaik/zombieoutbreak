Intervals = {}
Register = {}

SetInterval = function(Miliseconds, CB)
    local i = 0
    while Intervals[i] ~= nil do i = i + 1 end
    Intervals[i] = true
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(Miliseconds)
            if Intervals[i] ~= nil then
                CB()
            else
                break
            end
        end
    end)
    return i
end

ClearInterval = function(ID)
    if Intervals[ID] ~= nil then
        Intervals[ID] = nil
    end
end

function GetDataFile(Path)
    return LoadResourceFile(GetCurrentResourceName(), Path)
end

function Translate(String, ...)
    local Module, Translation = string.match(String, "(.*)%:(.*)") 
    for i in pairs(Modules) do
        for j in pairs(Modules[i]) do
            if Modules[i][j]["Name"] == Module then
               if Modules[i][j]["Translations"][Translation] then
                    return string.format(Modules[i][j]["Translations"][Translation], ...)
                else
                    return "Translation [".. Module .."][".. Translation .."] doesn't exists!"
                end
            end
        end
    end

    return "Module [" .. Module .. "] doesn't exists!"
end

function LoadModuleTranslations(Path)
    for i in pairs(Modules) do
        for j in pairs(Modules[i]) do
            for k in pairs(Modules[i][j]["CodeSide"]) do
                local File = debug.getinfo(2).source
                if Modules[i][j]["CodeSide"][k]["Events"] == File or Modules[i][j]["CodeSide"][k]["Main"] == File then
                    local Code = GetDataFile(Modules[i][j]["Path"] .. Path)
                    if Code then
                        local LoadTranslations = load("return function() " .. Code .. " return Translations end")()
                        Modules[i][j]["Translations"] = LoadTranslations()
                    else
                        print("^1[ERROR]^4[".. j .. "]:".. debug.getinfo(2).currentline .."^7 File config not found in path (".. Modules[i][j]["Path"] .. Path ..")")
                    end
                end
            end
        end
    end
end

function LoadModuleConfig(Path)
    for i in pairs(Modules) do
        for j in pairs(Modules[i]) do
            for k in pairs(Modules[i][j]["CodeSide"]) do
                local File = debug.getinfo(2).source
                if Modules[i][j]["CodeSide"][k]["Events"] == File or Modules[i][j]["CodeSide"][k]["Main"] == File then
                    local Code = GetDataFile(Modules[i][j]["Path"] .. Path)
                    if Code then
                        local LoadConfig, Error = load("return function() " .. Code .. " return Config end")()
                        if LoadConfig then
                            return LoadConfig()
                        else
                            print("^1Syntax Error: ".. Error .."^7")
                        end
                    else
                        print("^1[ERROR]^4[".. j .. "]:".. debug.getinfo(2).currentline .."^7 File config not found in path (".. Modules[i][j]["Path"] .. Path ..")")
                    end
                end
            end
        end    
    end
end

function Load(Path)
    for i in pairs(Modules) do
        for j in pairs(Modules[i]) do
            for k in pairs(Modules[i][j]["CodeSide"]) do
                local File = debug.getinfo(2).source
                if Modules[i][j]["CodeSide"][k]["Events"] == File or Modules[i][j]["CodeSide"][k]["Main"] == File then
                    local Code = GetDataFile(Modules[i][j]["Path"] .. Path)
                    table.insert(Modules[i][j]["CodeSide"], Code)
                    if Code then
                        local LoadFile, Error = load(Code)
                            if LoadFile then
                                LoadFile()
                            else
                                print("^1Syntax Error: ".. Error .."^7")
                            end
                    else
                        print("^1[Error]^4[".. Modules[i][j]["Name"] .. "]^7 File not found in path (".. Modules[i][j]["Path"] .. Path ..")")
                    end
                end
            end
        end    
    end
end

function LoadModules(Side)
    for i in pairs(Modules) do
        for j in pairs(Modules[i]) do
            local EventsCode = GetDataFile(Modules[i][j]["Path"] .. Side .."/Events.lua")
            local MainCode = GetDataFile(Modules[i][j]["Path"] .. Side .."/Main.lua")
            if EventsCode then
                local LoadCode, Error = load(EventsCode)
                if LoadCode then
                    LoadCode()
                else
                    print("^1Syntax Error: ".. Error .."^7")
                end
            end
            if MainCode then
                local LoadCode, Error = load(MainCode)
                if LoadCode then
                    LoadCode()
                else
                    print("^1Syntax Error: ".. Error .."^7")
                end
            end
        end
    end
end