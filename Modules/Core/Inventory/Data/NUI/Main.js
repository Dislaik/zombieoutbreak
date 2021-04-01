var conextMenuOpen = false;

Inventory.SetPlayerName = function(name) {
    var divTarget = document.getElementById("playername");
    divTarget.innerHTML = name + "'s Inventory"
}

Inventory.SetPlayerItems = function(inventory) {
    var divTarget = document.getElementById("Container-Items");
    divTarget.innerHTML = "";
    var div = "";

    for (var i in inventory) {
        //console.log(i, inventory[i])
        if (inventory[i].Type == "Normal") {
            div += `<label class="`+ i +`">
                        <input type="radio" name="inventory-items" value="items">
                        <span class="`+ i +` inventory-items Tooltip context-menu `+ inventory[i].Type +`">
                            <div class="icon" style="background-image: url('/Modules/Core/Inventory/Data/NUI/Images/policepants.png');"></div>
                            <p class="item-name">`+ inventory[i].Label +`</p>
                            <span>
                                <p>`+ inventory[i].Label +`</p>
                                <p>`+ inventory[i].Description +`</p>
                                <!--<br>
                                <p>Condition: `+ inventory[i].Condition +`</p>-->
                            </span>
                            <div class="menu">
                                <a class="item-use" data-item-id="`+ i +`">Use</a>
                                <a>Drop</a>
                            </div>
                        </span>
                    </label>`
        } else if (inventory[i].Type == "Food") {
            div += `<label class="`+ i +`">
                        <input type="radio" name="inventory-items" value="items">
                        <span class="`+ i +` inventory-items Tooltip context-menu `+ inventory[i].Type +`">
                            <div class="icon" style="background-image: url('/Modules/Core/Inventory/Data/NUI/Images/policepants.png');"></div>
                            <p class="item-name">`+ inventory[i].Label +`</p>
                            <span>
                                <p>`+ inventory[i].Label +`</p>
                                <p>`+ inventory[i].Description +`</p>
                                <br>
                                <p>Condition: `+ inventory[i].Condition +`</p>
                            </span>
                            <div class="menu">
                                <a class="item-use" data-item-id="`+ i +`">Use</a>
                                <a>Drop</a>
                            </div>
                        </span>
                    </label>`
        }
    }

    divTarget.innerHTML = div;

}

/*Inventory.SetSlots = function(Inventory, MaxWeight) {

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
                        <div id="${resultArray[Item].Name}" class="Slots">
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
                        <div id="${resultArray[Item].Name}" class="Slots">
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

Inventory.SetSlotsDrop = function(Inventory) {

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
                            <p class="Limit">${resultArray[Item].Count}</p>
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
                        <div id="${resultArray[Item].Name}" class="SlotsLoot">
                            <p class="Weight">${resultArray[Item].Weight} KG</p>
                            <p class="Limit">${resultArray[Item].Count}</p>
                            <p class="Label">${resultArray[Item].Label}</p>
                            <img src="/Modules/Core/Inventory/Data/NUI/Images/${resultArray[Item].Name}.png" width="100%" height="100%">
                        </div>
                    </div>`;
        } else if (resultArray[Item].Type == "Weapon") {
            Div += `<div class="col-3">
                        <div id="${resultArray[Item].Name}" class="SlotsLoot">
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

}*/

Inventory.TooltipsDetection = function()
{
	var tooltips = document.querySelectorAll('.Tooltip span');
    var contextMenu = document.querySelectorAll('.context-menu .menu');

	window.onmousemove = function (e) {

        if (conextMenuOpen == true) {
            for (var i = 0; i < tooltips.length; i++) {
                tooltips[i].style.visibility = "hidden";
            }
        } else {
            var x = (e.clientX + 20) + 'px',
			    y = (e.clientY + 20) + 'px';
            for (var i = 0; i < tooltips.length; i++) {
                tooltips[i].style.top = y;
                tooltips[i].style.left = x;
                tooltips[i].style.visibility = "visible";
            }
        }
	};

    window.onclick = function(e) {
        conextMenuOpen = false;
        //console.log(e.target.parentElement.className)
        for (var i = 0; i < contextMenu.length; i++) {
            contextMenu[i].style.visibility = "hidden";
        }
    }

    /*window.onmousedown = function(e) {
        //console.log(e.target.className)
        if (e.target.className == "Container-Top") {
            conextMenuOpen = false;
            
            for (var i = 0; i < contextMenu.length; i++) {
                contextMenu[i].style.visibility = "hidden";
            }
        }
    }*/

    var noContext = document.getElementsByClassName('inventory-items');

    for (var i = 0 ; i < noContext.length; i++) {
        noContext[i].addEventListener('contextmenu', e => {
            var x = (e.clientX) + 'px',
                y = (e.clientY) + 'px';

            var itemClassName = e.currentTarget.className
            var itemId = itemClassName.split(" ");
            conextMenuOpen = false;

            for (var j = 0; j < contextMenu.length; j++) {
                if (itemId[0] == j) {
                    contextMenu[j].style.top = y;
                    contextMenu[j].style.left = x;
                    contextMenu[j].style.visibility = "visible";

                    conextMenuOpen = true;
                    //console.log("menu open", itemId[0]);
                } else {
                    contextMenu[j].style.visibility = "hidden";
                }
            }
        });
    }

    /*window.oncontextmenu = function(e) {

        var str = e.target.className;
        var strSplit = str.split(" ");
        console.log(strSplit[0])
        if (strSplit[0] !== "inventory-items") {
            for (var i = 0; i < contextmenu.length; i++) {
                contextmenu[i].style.visibility = "hidden";
            }
        } else {


        var x = (e.clientX) + 'px',
			y = (e.clientY) + 'px';
		for (var i = 0; i < tooltips.length; i++) {
            tooltips[i].style.visibility = 'hidden';
		}

        for (var i = 0; i < contextmenu.length; i++) {
            contextmenu[i].style.top = y;
            contextmenu[i].style.left = x;
            contextmenu[i].style.visibility = 'visible';
            menuOpen = true
		}
        }
    }

    window.onmousedown = function(e) {
        for (var i = 0; i < contextmenu.length; i++) {
            contextmenu[i].style.visibility = "hidden";
        }

        for (var i = 0; i < tooltips.length; i++) {
            tooltips[i].style.visibility = 'visible';
            menuOpen = false
		}

    }*/

    

}

$(document).ready(function(){

    $("#IncluideInventory").load("../Modules/Core/Inventory/Data/NUI/Main.html", function() {
        $('<link>').appendTo('head').attr({
            type: 'text/css', 
            rel: 'stylesheet',
            href: '../Modules/Core/Inventory/Data/NUI/Main.css'
        });
        $("#IncluideInventory").hide();
        $("#playerinventory").hide()
        $("#loot").hide();
        Inventory.KeepShow();
        Inventory.PlayerInventoryDraggable(); 
        
    });
    
    /*function DisplayInventory(bool) {
        if (bool) {
            $('#IncluideInventory').fadeIn(200);
        } else {
            $('#IncluideInventory').fadeOut(200);
        }
    }
    
    function DisplayLoot(bool) {
        if (bool) {
            $('#Loot').fadeIn(200);
        } else {
            $('#Loot').fadeOut(200);
        }
    }*/

    window.addEventListener('message', function(event) {
        var data = event.data;
        if (data.Type === "Inventory") {
			if (data.Display == true) {
                $("#IncluideInventory").show();
                //Inventory.Open();
                //Inventory.KeyDown();

                Inventory.SetPlayerName(data.Name);
                Inventory.SetPlayerItems(data.Inventory);

                /*Inventory.InputNumber('GiveInput');
                Inventory.InputNumber('ThrowInput');

                Inventory.SetSlots(Data.Inventory, Data.MaxWeight);
                Inventory.RepetDraggables(Data.Inventory);*/

                Inventory.TooltipsDetection();
                Inventory.Test(data.Inventory);
			} else {
                $('#IncluideInventory').hide();
                //DisplayInventory(false);
                //DisplayLoot(false);
            }
        }

        /*if (Data.Type === "UpdateInventory") {
            Inventory.SetSlots(Data.Inventory, Data.MaxWeight);
            Inventory.RepetDraggables(Data.Inventory);
        }

        if (Data.Type === "UpdateDrop") {
            if (Data.Display == true) {
                DisplayLoot(true);
                Inventory.SetSlotsDrop(Data.Inventory);
                Inventory.RepetDraggablesDrop(Data.Inventory);
            } else {
                DisplayLoot(false);
            }
        }

        if (Data.Type === "UpdateLoot") {
            if (Data.Display == true) { 
                DisplayLoot(true);
                Inventory.SetSlotsLoot(Data.Inventory);
                Inventory.RepetDraggablesLoot(Data.Ped, Data.Inventory);
            } else {
                DisplayLoot(false);
            }
        }*/

    });

    Inventory.Test = function(inventory) {
        $( ".item-use" ).click(function() {
            /*console.log($(this).data("item-id"));
            console.log(inventory[$(this).data("item-id")].label);*/
            
            $.post('http://zombieoutbreak/Inventory:Use', JSON.stringify({
                item: inventory[$(this).data("item-id")]
            }));
        });
    }

    
    Inventory.PlayerInventoryDraggable = function() {
        var inventoryOpen = false

        $("#inventory").click( function() {
            if (!inventoryOpen) {
                $("#playerinventory").show();
                //$("#loot").show();
                inventoryOpen = true
                //$(this).css("opacity", "0.5")
                $(this).css("filter", "grayscale(0%)")
            } else {
                $("#playerinventory").hide();
                //$("#loot").hide();
                inventoryOpen = false
                //$(this).css("opacity", "1.0")
                $(this).css("filter", "grayscale(100%)")
            }
        })

        $("#playerinventory").draggable({
            handle : ".Container-Top",
            start: function() {
                var contextMenu = document.querySelectorAll('.context-menu .menu');

                for (var i = 0; i < contextMenu.length; i++) {
                    contextMenu[i].style.visibility = "hidden";
                }

                conextMenuOpen = false;
            }}
        ).resizable({containment: 'parent'});

        $("#loot").draggable({ handle : ".Container-Top"}).resizable({containment: 'parent'});

    }

    Inventory.KeepShow = function() {
        var z = 1

        $("#playerinventory").mousedown( function() {
            $(this).css("z-index", z+1)

            $("#loot").css("z-index", z-1)
        })

        $("#loot").mousedown( function() {
            $(this).css("z-index", z+1)

            $("#playerinventory").css("z-index", z-1)
        })
    }
    /*Inventory.RepetDraggables = function(PlayerInventory) {
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
    }*/

    /*Inventory.RepetDraggablesDrop = function(DropInventory) {
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

    Inventory.RepetDraggablesLoot = function(Ped, Loot) {
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
                $.post('http://zombieoutbreak/Inventory:Loot', JSON.stringify({
                    PedHandler: Ped,
                    Item: Loot[ui.draggable.attr("id")]
                }));
            }
        });
    }*/

});