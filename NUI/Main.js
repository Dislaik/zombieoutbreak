let Modules = [
    "Modules/Core/Identity/Data/NUI/Main.js",
    "Modules/Core/Skin/Data/NUI/Main.js",
    "Modules/Core/Inventory/Data/NUI/Main.js",
    "Modules/Core/Sound/Data/NUI/Main.js"
]

$(document).ready(function(){

    for (var Path in Modules) {
        $.getScript("../" + Modules[Path]);
        var Module = Modules[Path].split("/")
        $("body").append("<div id=\"Incluide" + Module[2] + "\"></div>");
        eval(Module[2] + " = " + function(Name) {
            this[Name] = this
        });
    }
});