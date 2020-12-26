Inventory.SetSlots = function(Inventory, MaxWeight) {

    var resultArray = $.map(Inventory, function(value, index) { return [value]; });

    resultArray.sort(function(a, b) {
        var textA = a.Name.toUpperCase();
        var textB = b.Name.toUpperCase();
        return (textA < textB) ? -1 : (textA > textB) ? 1 : 0;
    });

    var DivSlots = document.getElementById("SlotsContainer");
    DivSlots.innerHTML = "";
    var EmptyWeight = document.getElementById("TotalWeight");
    var Div = "";
    TotalWeight = 0;
    for (var Item in resultArray) {
        if (resultArray[Item].Type == "Item" || resultArray[Item].Type == "Clothes") {
            Div += `<div class="col-3">
                        <div id="${resultArray[Item].Name}" data-value="${resultArray[Item].Type}" class="Slots">
                            <p class="Weight">${parseFloat(resultArray[Item].Weight * resultArray[Item].Count).toFixed(1)} KG</p>
                            <p class="Limit">${resultArray[Item].Count +"/"+ resultArray[Item].Limit}</p>
                            <p class="Label">${resultArray[Item].Label}</p>
                            <img src="/Modules/Core/Inventory/Data/NUI/Images/${resultArray[Item].Name}.png" width="100%" height="100%">
                        </div>
                        <div class="hide">
                            <div class="test">
                                <p class="title">${resultArray[Item].Label}</p>
                                <img class="ImageDescription" src="/Modules/Core/Inventory/Data/NUI/Images/${resultArray[Item].Name}.png">
                                <p class="Description">${resultArray[Item].Description}</p>
                            </div>
                        </div>
                    </div>`;
        } else if (resultArray[Item].Type == "Weapon") {
            Div += `<div class="col-3">
                        <div id="${resultArray[Item].Name}" data-value="${resultArray[Item].Type}" class="Slots">
                            <p class="Weight">${parseFloat(resultArray[Item].Weight).toFixed(1)} KG</p>
                            <p class="Limit">${resultArray[Item].Ammo}</p>
                            <p class="Label">${resultArray[Item].Label}</p>
                            <img src="/Modules/Core/Inventory/Data/NUI/Images/${resultArray[Item].Name}.png" width="100%" height="100%">
                        </div>
                        <div class="hide">
                            <div class="test">
                                <p class="title">${resultArray[Item].Label}</p>
                                <img class="ImageDescription" src="/Modules/Core/Inventory/Data/NUI/Images/${resultArray[Item].Name}.png">
                                <p class="Description">${resultArray[Item].Description}</p>
                            </div>
                        </div>
                    </div>`;
        }
        let Weight = (isNaN(resultArray[Item].Count) ? 1 : resultArray[Item].Count)
        TotalWeight += (Weight * resultArray[Item].Weight);
    }

    if(TotalWeight > MaxWeight) {
        EmptyWeight.style.color = "rgba(200, 100, 100, 1)";
    } else {
        EmptyWeight.style.color = "rgba(200, 200, 200, 1)";
    }

    Div = `<div class="row">` + Div + `</div>`;
    DivSlots.innerHTML = Div;
    EmptyWeight.innerHTML = parseFloat(TotalWeight).toFixed(1) + " KG/" + parseFloat(MaxWeight).toFixed(1) + " KG";
}

Inventory.SetSlotsLoot = function(Inventory) {

    var resultArray = $.map(Inventory, function(value, index) { return [value]; });

    resultArray.sort(function(a, b) {
        var textA = a.Name.toUpperCase();
        var textB = b.Name.toUpperCase();
        return (textA < textB) ? -1 : (textA > textB) ? 1 : 0;
    });


    var DivLoot = document.getElementById("SlotsContainerLoot");
    DivLoot.innerHTML = "";
    var Div = "";
    for (var Item in resultArray) {
        if (resultArray[Item].Type == "Item" || resultArray[Item].Type == "Clothes") {
            Div += `<div class="col-3">
                        <div id="${resultArray[Item].Id}" class="SlotsLoot">
                            <p class="Weight">${resultArray[Item].Weight} KG</p>
                            <p class="Limit">${resultArray[Item].Input}</p>
                            <p class="Label">${resultArray[Item].Label}</p>
                            <img src="/Modules/Core/Inventory/Data/NUI/Images/${resultArray[Item].Name}.png" width="100%" height="100%">
                        </div>
                    </div>`;
        } else if (resultArray[Item].Type == "Weapon") {
            Div += `<div class="col-3">
                        <div id="${resultArray[Item].Id}" class="SlotsLoot">
                            <p class="Weight">${resultArray[Item].Weight} KG</p>
                            <p class="Limit">${resultArray[Item].Ammo}</p>
                            <p class="Label">${resultArray[Item].Label}</p>
                            <img src="/Modules/Core/Inventory/Data/NUI/Images/${resultArray[Item].Name}.png" width="100%" height="100%">
                        </div>
                    </div>`;
        }
    }
    Div = `<div class="row">` + Div + `</div>`;
    DivLoot.innerHTML = Div;
}


Inventory.InputNumber = function(ClassName)
{
    document.getElementById(ClassName).addEventListener('keydown', function(e) {
        var key   = e.keyCode ? e.keyCode : e.which;

        if (!( [8, 9, 13, 27, 46, 110, 190].indexOf(key) !== -1 ||
             (key == 65 && ( e.ctrlKey || e.metaKey  ) ) || 
             (key >= 35 && key <= 40) ||
             (key >= 48 && key <= 57 && !(e.shiftKey || e.altKey)) ||
             (key >= 96 && key <= 105) 
           )) e.preventDefault();
    });

}

let ToggleMouse = false

$(document).ready(function(){
    
    window.addEventListener('message', function(event) {
        var Data = event.data;
        if (Data.Type === "Inventory") {
			if (Data.Display == true) {
				$("#IncluideInventory").load("../Modules/Core/Inventory/Data/NUI/Main.html", function() {
					$('<link>').appendTo('head').attr({
						type: 'text/css', 
						rel: 'stylesheet',
						href: '../Modules/Core/Inventory/Data/NUI/Main.css'
                    });
                    
                    Inventory.InputNumber('GiveInput');
                    Inventory.InputNumber('ThrowInput');

                    Inventory.SetSlots(Data.Inventory, Data.MaxWeight);
                    Inventory.RepetDraggables(Data.Inventory);
                });

                

                $("#IncluideInventory").hide();
				setTimeout(function() {
                    $('#IncluideInventory').fadeIn(200);
                }, 100);
			} else {
                $("#IncluideInventory").empty();
                $("LINK[href*='../Modules/Core/Inventory/Data/NUI/Main.css']").remove();
            }
        }

        if (Data.Type === "UpdateInventory") {
            Inventory.SetSlots(Data.Inventory, Data.MaxWeight);
            Inventory.RepetDraggables(Data.Inventory);
        }

        if (Data.Type === "UpdateLoot") {
            setTimeout(function() {
                Inventory.SetSlotsLoot(Data.Inventory);
                Inventory.RepetDraggablesLoot(Data.Inventory);
            }, 200);
        }
    });


    Inventory.RepetDraggables = function(PlayerInventory) {
        $('.Slots').draggable({
            helper: function (event) {
                var ret = $(this).clone();
                $(this).toggleClass("ghost");
                return ret;
            },
            zIndex: 99999,
            revert: 'invalid',
            containment: "#Inventory",
            drag: function (event, ui) {
                if (PlayerInventory[$(this).attr("id")].Type == "Weapon" || PlayerInventory[$(this).attr("id")].Type == "Clothes") {
                    $('#Use').children('a').html("Equip/Unequip");
                }
            },
            stop: function (event, ui) {
                $(this).toggleClass("ghost");
                $('#Use').children('a').html("Use");
            }
        });
        
        $('#Use').droppable({
            accept: ".Slots",
            drop: function(event, ui) { 
                $.post('http://zombieoutbreak/Inventory:Use', JSON.stringify({
                    Item: PlayerInventory[ui.draggable.attr("id")]
                }));
                Inventory.RepetDraggables(PlayerInventory);
            }
        });

        $('#Give').droppable({
            accept: ".Slots",
            drop: function(event, ui) {
                $.post('http://zombieoutbreak/Inventory:Give', JSON.stringify({
                    Input: parseInt($("#GiveInput").val()),
                    Name: ui.draggable.attr("id"),
                    Item: PlayerInventory[ui.draggable.attr("id")],
                    Type: PlayerInventory[ui.draggable.attr("id")].Type
                }));
                Inventory.RepetDraggables(PlayerInventory);
            }
        });

        $('#Throw').droppable({
            accept: ".Slots",
            drop: function(event, ui) {
                if (isNaN(parseInt($("#ThrowInput").val()))) {
                    parseInt($("#ThrowInput").val(0))
                }
                $.post('http://zombieoutbreak/Inventory:Throw', JSON.stringify({
                    Input: parseInt($("#ThrowInput").val()),
                    Name: ui.draggable.attr("id"),
                    Item: PlayerInventory[ui.draggable.attr("id")],
                    Type: PlayerInventory[ui.draggable.attr("id")].Type
                }));
                Inventory.RepetDraggables(PlayerInventory);
        }});
    }

    Inventory.RepetDraggablesLoot = function(DropInventory) {
        $('.SlotsLoot').draggable({
            helper: function (event) {
                var ret = $(this).clone();
                $(this).toggleClass("ghost");
                return ret;
            },
            zIndex: 99999,
            revert: 'invalid',
            containment: "#Loot",
            stop: function (event, ui) {
                $(this).toggleClass("ghost");
            }
        });
        $( "#SlotsContainer" ).droppable({
            accept: ".SlotsLoot",
            drop: function(event, ui) 
            { 
                $.post('http://zombieoutbreak/Inventory:Lootable', JSON.stringify({
                    Id: parseInt(ui.draggable.attr("id"))
                }));
            }
        });
    }

    $( "#IncluideInventory" ).mouseenter(function() {
        ToggleMouse = true
    });
    
    $(document).on('keydown', function(event) {
        if (ToggleMouse && (event.which == 27 || event.which == 113)) {
            ToggleMouse = false
            $.post('http://zombieoutbreak/Inventory:Close', JSON.stringify({
            }));
        }
    });
});