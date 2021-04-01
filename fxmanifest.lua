fx_version "adamant"
games { "gta5" }

author "Matias Salas"
description "Zombie Survival RPG Framework"
version "0.8.6"


client_script {
    "Config/General.lua",
    "Config/Interval.lua",
    "Data/Locales/*.lua",
    "Root/Shared/Events.lua",
    "Root/Shared/Functions.lua",
    "Root/Shared/Main.lua",
    "Root/Client/Events.lua",
    "Root/Client/Functions.lua",
    "Root/Client/Main.lua"
}

server_script {
    "@mysql-async/lib/MySQL.lua",
    "Config/General.lua",
    "Config/Interval.lua",
    "Data/Locales/*.lua",
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

loadscreen "Loadscreen/Index.html"

files {
    "Data/Clothing.json",
    "Data/Items.json",
    "Data/Recipes.json",
    "Data/Weapons.json",
    "Modules/Core/Modules.json",
    "Modules/Base/Modules.json",
    "Modules/User/Modules.json",
    "Modules/Core/**/Data/Locales/*.lua",
    "Modules/Core/**/Data/*.lua",
    "Modules/Core/**/Data/*.json",
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
    "Modules/Base/**/Data/*.json",
    "Modules/Base/**/Data/NUI/*.css",
    "Modules/Base/**/Data/NUI/*.html",
    "Modules/Base/**/Data/NUI/*.js",
    "Modules/Base/**/Data/NUI/Images/*.jpg",
    "Modules/Base/**/Data/NUI/Images/*.png",
    "Modules/Base/**/Data/NUI/Fonts/*.ttf",
    "Modules/Base/**/Data/Sounds/*.ogg",
    "Modules/Base/**/Shared/*.lua",
    "Modules/Base/**/Server/*.lua",
    "Modules/Base/**/Client/*.lua",
    "Modules/User/**/Data/Locales/*.lua",
    "Modules/User/**/Data/*.lua",
    "Modules/User/**/Data/*.json",
    "Modules/User/**/Data/NUI/*.css",
    "Modules/User/**/Data/NUI/*.html",
    "Modules/User/**/Data/NUI/*.js",
    "Modules/User/**/Data/NUI/Images/*.jpg",
    "Modules/User/**/Data/NUI/Images/*.png",
    "Modules/User/**/Data/NUI/Fonts/*.ttf",
    "Modules/User/**/Data/Sounds/*.ogg",
    "Modules/User/**/Shared/*.lua",
    "Modules/User/**/Server/*.lua",
    "Modules/User/**/Client/*.lua",
    "NUI/Main.html",
    "NUI/Main.js",
    "NUI/Default.css",
    "Loadscreen/Index.html",
    "Loadscreen/Loadscreen.js",
    "Loadscreen/Oswald.ttf",
    "Loadscreen/Loadscreen.css",
    "Loadscreen/Background.jpg",
    "Loadscreen/Sound.ogg"
}