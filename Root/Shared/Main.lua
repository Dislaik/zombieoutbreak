Root = Root or {}
Root.Modules = {}
Items = {}


Root.createModules()
Root.loadItems()

Root.loadModules("Shared")

if IsDuplicityVersion() then
    UsableItems = {}
    Root.loadModules("Server")
else
    Root.loadModules("Client")
end