var Modules = [
    "Modules/Core/Player/Data/NUI/Main.js",
    "Modules/Core/Interact/Data/NUI/Main.js",
    "Modules/Core/Inventory/Data/NUI/Main.js",
    //"Modules/Core/Sound/Data/NUI/Main.js"
]

$(document).ready(function(){
    //install npm i glob //needs node.js

    for (var Path in Modules) {
        $.getScript("../" + Modules[Path]);
        var Module = Modules[Path].split("/")
        $("body").append("<div id=\"Incluide" + Module[2] + "\"></div>");
        eval(Module[2] + " = " + function(Name) {
            this[Name] = this
        });
    }
});