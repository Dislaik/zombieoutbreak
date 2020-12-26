fx_version "adamant"
games { "gta5" }

author "Matias Salas"
description "Zombie Survival RPG Framework"
version "0.6.8"


client_script {
    "Config/Global.lua",
    "Root/Client-Server/Events.lua",
    "Root/Client-Server/Functions.lua",
    "Root/Client-Server/Main.lua",
    "Root/Client/Events.lua",
    "Root/Client/Functions.lua",
    "Root/Client/Main.lua"
}

server_script {
    "@mysql-async/lib/MySQL.lua",
    "Config/Global.lua",
    "Root/Client-Server/Events.lua",
    "Root/Client-Server/Functions.lua",
    "Root/Client-Server/Main.lua",
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
    "Modules/Core/**/Client/*.lua",
    "Modules/Core/**/Client-Server/*.lua",
    "Modules/Core/**/Server/*.lua",
    "Modules/Base/**/Data/Locales/*.lua",
    "Modules/Base/**/Data/*.lua",
    "Modules/Base/**/Client/*.lua",
    "Modules/Base/**/Client-Server/*.lua",
    "Modules/Base/**/Server/*.lua",
    "Modules/User/**/Data/Locales/*.lua",
    "Modules/User/**/Data/*.lua",
    "Modules/User/**/Client/*.lua",
    "Modules/User/**/Client-Server/*.lua",
    "Modules/User/**/Server/*.lua",
    "NUI/Main.html",
    "NUI/Main.js",
    "NUI/Default.css"
}