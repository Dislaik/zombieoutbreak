RegisterNetEvent("Root:LoadModuleTranslations")
AddEventHandler("Root:LoadModuleTranslations", function(Data)
    for i in pairs(_G.Modules) do
        for j in pairs(_G.Modules[i]) do
            if _G.Modules[i][j]["Name"] == Data["Name"] then
                _G.Modules[i][j]["Translations"] = Data["Translations"]
            end
        end    
    end
end)