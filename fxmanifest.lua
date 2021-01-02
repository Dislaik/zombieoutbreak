fx_version "adamant"
games { "gta5" }

author "Matias Salas"
description "Zombie Survival RPG Framework"
version "0.7.2"


client_script {
    "Config/Global.lua",
    "Root/Shared/Events.lua",
    "Root/Shared/Functions.lua",
    "Root/Shared/Main.lua",
    "Root/Client/Events.lua",
    "Root/Client/Functions.lua",
    "Root/Client/Main.lua"
}

server_script {
    "@mysql-async/lib/MySQL.lua",
    "Config/Global.lua",
    "Root/Shared/Events.lua",
    "Root/Shared/Functions.lua",
    "Root/Shared/Main.lua",
    "Root/Server/Events.lua",
    "Root/Server/Functions.lua",
    "Root/Server/Main.lua"
}

dependencies {  
    'mysql-async'
}

ui_page "NUI/Main.html"

files {
    "Data/Weapons.json",
    "Modules/Core/Modules.json",
    "Modules/Base/Modules.json",
    "Modules/User/Modules.json",
    "Modules/Core/**/Data/Locales/*.lua",
    "Modules/Core/**/Data/*.lua",
    "Modules/Core/**/Data/NUI/*.css",
    "Modules/Core/**/Data/NUI/*.html",
    "Modules/Core/**/Data/NUI/*.js",
    "Modules/Core/**/Data/NUI/Images/*.jpg",
    "Modules/Core/**/Data/NUI/Images/*.png",
    "Modules/Core/**/Data/NUI/Fonts/*.ttf",
    "Modules/Core/**/Data/Sounds/*.ogg",
    "Modules/Core/**/Shared/*.lua",
    "Modules/Core/**/Server/*.lua",
    "Modules/Core/**/Client/*.lua",
    "Modules/Base/**/Data/Locales/*.lua",
    "Modules/Base/**/Data/*.lua",
    "Modules/Base/**/Shared/*.lua",
    "Modules/Base/**/Server/*.lua",
    "Modules/Base/**/Client/*.lua",
    "Modules/User/**/Data/Locales/*.lua",
    "Modules/User/**/Data/*.lua",
    "Modules/User/**/Shared/*.lua",
    "Modules/User/**/Server/*.lua",
    "Modules/User/**/Client/*.lua",
    "NUI/Main.html",
    "NUI/Main.js",
    "NUI/Default.css"
}