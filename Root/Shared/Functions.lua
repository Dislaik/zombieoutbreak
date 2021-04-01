Root = Root or {}
Cam = {}
Intervals = {}
IntervalsPaused = {}


Root.LoadLocalesItems = function(path)
    local File = Root.getDataFile(path)
    local ENV = {}

    if File then
        local LoadConfig = load(File, path, "t", ENV)

        if LoadConfig then
            LoadConfig()
        else
            print("algo paso xd")
        end

        return ENV
    end

end

Root.loadItems = function()
    for i = 1, #Config.ModuleGroups do 
        local group = Root.getModulesGroup(Config.ModuleGroups[i])

        if group then
            for j = 1, #group do
                local data = Root.getDataFile(group[j].Path .."Data/Items.json")

                if data then
                    local locale = Root.LoadLocalesItems(group[j].Path .."Data/Locales/".. Config.Lang ..".lua")["Translations"]
                    local decodeData = json.decode(data)

                    for _, item in pairs(decodeData) do

                        if locale[_ .."_Label"] then
                            item.Label = locale[_ .."_Label"]
                        else
                            item.Label = "Translation for item [".. _ .. "] doesn't exists"
                        end

                        if locale[_ .."_Description"] then
                            item.Description = locale[_ .."_Description"]
                        else
                            item.Description = "Translation for item [".. _ .. "] doesn't exists"
                        end

                        Items[_] = item
                    end

                end

            end
        end

    end

end

RegisterEvent = function(eventName, cb)

    RegisterNetEvent(eventName)
    AddEventHandler(eventName, cb)

end

SetInterval = function(miliseconds, cb)
    local i = 0

    while Intervals[i] ~= nil do i = i + 1 end

    Intervals[i] = true

    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(miliseconds)
            if Intervals[i] then
                cb(i)
            else
                break
            end
            --Citizen.Wait(miliseconds)
        end
    end)
    
    return i
end

ClearInterval = function(id)

    if Intervals[id] then
        Intervals[id] = nil
    end

end

Root.getDataFile = function(Path)

    return LoadResourceFile(GetCurrentResourceName(), Path)
end

Root.ErrorLog = function(ModuleName, ModulePath)

end

Translate = function(String, ...)
    local ModuleName, Translation = string.match(String, "(.*)%:(.*)")
    local Module = Root.getModule(ModuleName)

    if Module.Translations[Translation] then

        return string.format(Module.Translations[Translation], ...)
    else

        return "Translation [".. Module.Name .."][".. Translation .."] doesn't exists!"
    end

    return "Module [" .. Module.Name .. "] doesn't exists!"
end

LoadTranslation = function(moduleTarget, table)
    local module = Root.getModule(moduleTarget)
    
    module.Translations = table

end


Root.getModule = function(moduleName)

    for i = 1, #Root.Modules do
        for j = 1, #Root.Modules[i] do

            if Root.Modules[i][j].Name == moduleName then

                return Root.Modules[i][j] 
            end

        end
    end

end

Root.load = function(path)

    for _, groups in pairs(Root.Modules) do
        for __, module in pairs(groups) do

            if module.File == debug.getinfo(2).source then
                local File = Root.getDataFile(module.Path .. path)
                local ENV = {}

                if File then
                    --print(File)
                    local LoadConfig = load(File, module.Name .."/".. path, "t", ENV)()
                end

                return ENV
            end

        end
    end

end


Root.module = function(moduleTarget)
    local module = Root.getModule(moduleTarget)
    local SOURCE = debug.getinfo(2).source:match("/(.*)/")



    if module then
        --local ENV = {}
        --module.ENV[SOURCE] = module.ENV[SOURCE] or {}



        --module.ENV = module.ENV or {}

        --ENV.Load = Root.load
        --ENV.M = Root.module
        --ENV.Module = {}

        --setmetatable(ENV, {__index = _G, __newindex = _G})


        if SOURCE == "Client" then

            for _, SIDE in pairs({"Client", "Shared"}) do
                local File = Root.getDataFile(module.Path .. SIDE .. "/Module.lua")

                if File then
                    local LoadFile = load(File, module.Name .."/" .. SIDE .."/Module.lua", "t", module._ENV)()
                end

                --module.ENV[SOURCE] =
                --[[for k,v in pairs(module.ENV[SIDE]) do
                    module.ENV[SOURCE][k] = v
                end--]]

            end

            --return module.ENV[SOURCE]
            return module._ENV.Module
        elseif SOURCE == "Server" then
            for _, SIDE in pairs({"Server", "Shared"}) do
                local File = Root.getDataFile(module.Path .. SIDE .. "/Module.lua")
                --print(File)
                if File then
                    local LoadFile = load(File, module.Name .."/" .. SIDE .."/Module.lua", "t", module._ENV)()
                end

                --[[for k,v in pairs(module._ENV.Module) do
                    print(k,v)
                end

                for k, v in pairs(module.ENV[SIDE]) do
                    --print(k,v)
                    module.ENV[SOURCE][k] = v
                end--]]

            end

            --return module.ENV[SOURCE]
            return module._ENV.Module
        elseif SOURCE == "Shared" then
            local File = Root.getDataFile(module.Path .. "Shared/Module.lua")

            if File then
                local LoadFile = load(File, module.Name .."/Shared/Module.lua", "t", module._ENV)()
            end

            --return module.ENV[SOURCE]
            return module._ENV.Module
        end

        --for k,v in pairs(module.ENV[SOURCE]) do 
        --    print(k,v)
        --end

        --return module.ENV[SOURCE]
    else
        print("^1[Error]^5[".. debug.getinfo(2).source .."] ^7 Module \"".. moduleTarget .."\" request not found")
    end

end


Root.loadModules = function(SIDE)
    
    for _, groups in pairs(Root.Modules) do
        for _, module in pairs(groups) do
            local ENV = {}
            local data = Root.getDataFile(module.Path .. SIDE .."/Module.lua")

            ENV.print = function(...)
                local _print = ""
                
                for i = 1, #{...} do
                    _print = _print .." ".. tostring(({...})[i])
                end

                return print("^5[".. module.Name .."]^7".. _print)
            end
            ENV.Load = Root.load
            ENV.M = Root.module
            ENV.Module = {}

            local _ENV = setmetatable(ENV, {__index = _G, __newindex = _G})

            if data then
                local loadData = load(data, module.Name.."/".. SIDE .."/Module.lua", "t", ENV)

                module.File = module.Name.."/".. SIDE .."/Module.lua"

                local status, trace = pcall(loadData)
                if not status then
                    if trace == "attempt to call a nil value" then
                        print("^1[Error]^7".. debug.traceback("^5[".. module.Path.. SIDE .."/Module.lua]^7:?: ".. trace))
                    else
                        print("^1[Error]^5[".. module.Name .."]^7".. debug.traceback(trace))
                    end
                end

            end

            module.ENV[SIDE] = ENV.Module
            module._ENV = _ENV
        end
    end

    for _, groups in pairs(Root.Modules) do
        for _, module in pairs(groups) do

            if SIDE == "Client" or SIDE == "Server" then
                for k,v in pairs(module.ENV.Shared) do
                    module.ENV[SIDE][k] = v
                end
            end

            for _, file in pairs(Config.CoreFiles) do
                local data = Root.getDataFile(module.Path .. SIDE .."/".. file ..".lua")

                if data then
                    local loadData = load(data, module.Name.."/".. SIDE .."/".. file ..".lua", "t", module._ENV)
                    local status, trace = pcall(loadData)

                    if not status then
                        if trace == "attempt to call a nil value" then
                            print("^1[Error]^7".. debug.traceback("^5[".. module.Path.. SIDE .."/".. file ..".lua]^7:?: ".. trace))
                        else
                            print("^1[Error]^5[".. module.Name .."]^7".. debug.traceback(trace))
                        end
                    end

                end

            end

        end
    end


end

        
Root.getModulesGroup = function(groupName)

    for i = 1, #Root.Modules do
        for j = 1, #Root.Modules[i] do

            if Root.Modules[i][j].Group == groupName then

                return Root.Modules[i]
            end

        end
    end

end

Root.createModules = function()

    for i = 1, #Config.ModuleGroups do
        local dataFile = Root.getDataFile("Modules/" .. Config.ModuleGroups[i] .. "/Modules.json")
        local data = json.decode(dataFile)

        Root.Modules[i] = {}

        for j = 1, #data do
            print("^5[".. data[j] .."] Loaded^7")

            Root.Modules[i][j] = {}
            Root.Modules[i][j].ENV = {}
            Root.Modules[i][j].Group = Config.ModuleGroups[i]
            Root.Modules[i][j].Name = data[j]
            Root.Modules[i][j].Path = "Modules/" .. Config.ModuleGroups[i] .. "/" .. data[j] .. "/"
        end

    end

end