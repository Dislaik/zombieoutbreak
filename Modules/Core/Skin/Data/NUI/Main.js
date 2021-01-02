Skin.InitTab = function() {
    document.getElementById("AppearanceFirstClick").click();
}

Skin.Tab = function(event, name) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("TabContent");
    
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("TabLinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(name).style.display = "block";
    event.currentTarget.className += " active";
}

Skin.LeftRange = function(name) { document.getElementById(name).stepDown(1); }
Skin.RightRange = function(name) { document.getElementById(name).stepUp(1); }


Skin.SetSkin = function() {
    var List = ["#E7B78E", "#442F1E", "#C79C77", "#C7BA77", "#9B7554", "#C7A777"];
    var DivTarget = document.getElementById("Skin");
    var Div = "";
    var Value = 0;
    for (var i in List) {
        if (Value == 0) {
            Div += `<label>
                        <input type="radio" name="skin" value=`+ Value +` checked>
                        <span class="color" style="background-color:`+ List[i] +`;"></span>
                    </label>`;
        } else {
            Div += `<label>
                        <input type="radio" name="skin" value=`+ Value +`>
                        <span class="color" style="background-color: `+ List[i] +`;"></span>
                    </label>`;
        }
        Value += 2;
    }
    Div = `<p>Skin</p>`+ Div
    DivTarget.innerHTML = Div;
}

Skin.SetFace = function(List) {
    var DivTarget = document.getElementById("Face");
    var Div = "";
    for (var i in List) {
        if (List[i] == 0 || List[i] == 21) {
            Div += `<label>
                        <input type="radio" name="face" value=`+ List[i] +` checked>
                        <img src="/Modules/Core/Skin/Data/NUI/Images/face`+ List[i] +`.png">
                    </label>`
        } else {
            Div += `<label>
                        <input type="radio" name="face" value=`+ List[i] +`>
                        <img src="/Modules/Core/Skin/Data/NUI/Images/face`+ List[i] +`.png">
                    </label>`
        }
    }
    Div = `<p>Face</p>`+ Div
    DivTarget.innerHTML = Div;
}

Skin.SetHair = function(Sex, List) {
    var DivTarget = document.getElementById("Hair");
    var Div = "";
    for (var i in List) {
        if (List[i] == 0) {
            Div += `<label>
                        <input type="radio" name="hair" value=`+ List[i] +` checked>
                        <img src="/Modules/Core/Skin/Data/NUI/Images/`+ Sex +`hair`+ List[i] +`.png">
                    </label>`
        } else {
            Div += `<label>
                        <input type="radio" name="hair" value=`+ List[i] +`>
                        <img src="/Modules/Core/Skin/Data/NUI/Images/`+ Sex +`hair`+ List[i] +`.png">
                    </label>`
        }
    }
    Div = `<p>Hair</p>`+ Div
    DivTarget.innerHTML = Div;
}


Skin.SetHairColor = function() {
    var List = ["#1C1F21", "#272A2C", "#312E2C", "#35261C", "#4B321F", "#5C3B24", "#6D4C35", "#6B503B", "#765C45", "#7F684E",
    "#99815D", "#A79369", "#AF9C70", "#BBA063", "#D6B97B", "#DAC38E", "#9F7F59", "#845039", "#682B1F", "#61120C", "#640F0A",
    "#7C140F", "#A02E19", "#B64B28", "#A2502F", "#AA4E2B", "#626262", "#808080", "#AAAAAA", "#C5C5C5", "#463955", "#5A3F6B",
    "#763C76", "#ED74E3", "#EB4B93", "#F299BC", "#04959E", "#025F86", "#023974", "#3FA16A", "#217C61", "#185C55", "#B6C034",
    "#70A90B", "#439D13", "#DCB857", "#E5B103", "#E69102", "#F28831", "#FB8057", "#E28B58", "#D1593C", "#CE3120", "#AD0903",
    "#880302", "#1F1814", "#291F19", "#2E221B", "#37291E", "#2E2218", "#231B15", "#020202", "#706C66", "#9D7A50"];
    var DivTarget = document.getElementById("HairColor");
    var Div = "";
    for (var i in List) {
        if (i == 0) {
            Div += `<label>
                        <input type="radio" name="haircolor" value=`+ i +` checked>
                        <span class="colorsub" style="background-color:`+ List[i] +`;"></span>
                    </label>`;
        } else {
            Div += `<label>
                        <input type="radio" name="haircolor" value=`+ i +`>
                        <span class="colorsub" style="background-color: `+ List[i] +`;"></span>
                    </label>`;
        }
    }
    Div = `<p>Hair Color</p>`+ Div
    DivTarget.innerHTML = Div;
}

Skin.SetEyesColor = function() {
    var List = ["#449244", "#204420", "#9ED8F3", "#5184BE", "#2E6D48", "#5E310C", "#A76F10", "#A5A5A5", "#C7C7C7", "#F299BC",
    "#C09841", "#78288C", "#181818", "#6C6C6C", "#E69102", "#DECC20", "#8C8C8C", "#C51E1E", "#E09118", "#C7C7C7", "#D3412F",
    "#77D32F", "#EE4433", "#7088A2", "#A2A270", "#F1F116", "#000000", "#EA0808", "#305B83", "#232323", "#D6D6D6", "#F7F7F7"];
    var DivTarget = document.getElementById("EyesColor");
    var Div = "";
    var Value = 0;
    for (var i in List) {
        if (i == 0) {
            Div += `<label>
                        <input type="radio" name="eyescolor" value=`+ i +` checked>
                        <span class="colorsub" style="background-color:`+ List[i] +`;"></span>
                    </label>`;
        } else {
            Div += `<label>
                        <input type="radio" name="eyescolor" value=`+ i +`>
                        <span class="colorsub" style="background-color: `+ List[i] +`;"></span>
                    </label>`;
        }
        Value += 1;
    }
    Div = `<p>Eyes Color</p>`+ Div
    DivTarget.innerHTML = Div;
}

Skin.SetOverlayColor = function(Overlay) {
    var List = ["#1C1F21", "#272A2C", "#312E2C", "#35261C", "#4B321F", "#5C3B24", "#6D4C35", "#6B503B", "#765C45", "#7F684E",
    "#99815D", "#A79369", "#AF9C70", "#BBA063", "#D6B97B", "#DAC38E", "#9F7F59", "#845039", "#682B1F", "#61120C", "#640F0A",
    "#7C140F", "#A02E19", "#B64B28", "#A2502F", "#AA4E2B", "#626262", "#808080", "#AAAAAA", "#C5C5C5", "#463955", "#5A3F6B",
    "#763C76", "#ED74E3", "#EB4B93", "#F299BC", "#04959E", "#025F86", "#023974", "#3FA16A", "#217C61", "#185C55", "#B6C034",
    "#70A90B", "#439D13", "#DCB857", "#E5B103", "#E69102", "#F28831", "#FB8057", "#E28B58", "#D1593C", "#CE3120", "#AD0903",
    "#880302", "#1F1814", "#291F19", "#2E221B", "#37291E", "#2E2218", "#231B15", "#020202", "#706C66", "#9D7A50"];
    var Div = "";
    for (var i in Overlay) {
        var DivTarget = document.getElementById(Overlay[i]);
        for (var j in List) {
            if (j == 0) {
                Div += `<label>
                            <input type="radio" name="`+ Overlay[i].toLowerCase() +`" value=`+ j +` checked>
                            <span class="colorsub" style="background-color:`+ List[j] +`;"></span>
                        </label>`;
            } else {
                Div += `<label>
                            <input type="radio" name="`+ Overlay[i].toLowerCase() +`" value=`+ j +`>
                            <span class="colorsub" style="background-color: `+ List[j] +`;"></span>
                        </label>`;
            }
        }
        Div = `<p>Color</p>`+ Div
        DivTarget.innerHTML = Div;
        Div = ""    
    }
}

let ToggleMouse = false

$(document).ready(function(){

    window.addEventListener('message', function(event) {
        var Data = event.data;
        if (Data.Type == "Skin") {
            if (Data.Sex == "Male") {
                if (Data.Display == true) {
					$("#IncluideSkin").load("../Modules/Core/Skin/Data/NUI/MaleSkin.html", function() {
						$('<link>').appendTo('head').attr({
							type: 'text/css', 
							rel: 'stylesheet',
							href: '../Modules/Core/Skin/Data/NUI/Main.css'
                        });
                        
                        Skin.Open();
                        Skin.Keydown();

                        var FacesId = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
                            10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
                            20, 42, 43, 44];
                        var HairId = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 
                            10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 
                            20, 21, 22, 24, 25, 26, 27, 28, 29, 
                            30, 31, 32, 33, 34, 35, 36, 72, 73];
                        var OverlayList = ["BeardColor", "EyebrowsColor", "MakeupColor", "BlushColor", "LipstickColor", "ChestHairColor"]

                        Skin.SetSkin();
                        Skin.SetFace(FacesId);
                        Skin.SetHair("male", HairId);
                        Skin.SetHairColor();
                        Skin.SetEyesColor();
                        Skin.SetOverlayColor(OverlayList);
                        
                        Skin.InitTab();
                        Skin.Input();
                        Skin.RangeButtonInput();
                        Skin.Submit();
                    });
                    $("#IncluideSkin").css({"width":"100vw", "height":"100vh"});
                    $("#IncluideSkin").hide();
                    setTimeout(function() {
                        $('#IncluideSkin').fadeIn(500);
                    }, 250);
				} else {
                    $("#IncluideSkin").css({"width":"", "height":""});
                    $("#IncluideSkin").empty();
					$("LINK[href*='../Modules/Core/Skin/Data/NUI/Main.css']").remove();
				}
            }
            
            if (Data.Sex == "Female") {
                if (Data.Display == true) {
					$("#IncluideSkin").load("../Modules/Core/Skin/Data/NUI/FemaleSkin.html", function() {
						$('<link>').appendTo('head').attr({
							type: 'text/css', 
							rel: 'stylesheet',
							href: '../Modules/Core/Skin/Data/NUI/Main.css'
                        });
                        
                        Skin.Open();
                        Skin.Keydown();

                        var FacesId = [21, 22, 23, 24, 25, 26, 27, 28, 29, 30,
                            31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41]
                        var HairId = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                            10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
                            20, 21, 22, 23, 25, 26, 27, 28, 29, 30,
                            31, 32, 33, 34, 35, 36, 37, 38, 76, 77];
                        var OverlayList = ["EyebrowsColor", "MakeupColor", "BlushColor", "LipstickColor"]

                        Skin.SetSkin();
                        Skin.SetFace(FacesId);
                        Skin.SetHair("female",HairId);
                        Skin.SetHairColor();
                        Skin.SetEyesColor();
                        Skin.SetOverlayColor(OverlayList);

                        Skin.InitTab();
                        Skin.Input();
                        Skin.RangeButtonInput();
                        Skin.Submit();
                    });
                    $("#IncluideSkin").css({"width":"100vw", "height":"100vh"});
                    $("#IncluideSkin").hide();

                    setTimeout(function() {
                        $('#IncluideSkin').fadeIn(500);
                    }, 250);
				} else {
                    $("#IncluideSkin").css({"width":"", "height":""});
					$("#IncluideSkin").empty();
					$("LINK[href*='../Modules/Core/Skin/Data/NUI/Main.css']").remove();
				}
            }
        }
    });

    Skin.Open = function() {
        ToggleMouse = true
    }

    Skin.Submit = function() {
        $(".submit").click(function () {
            ToggleMouse = false
            $.post('http://zombieoutbreak/Skin:Submit', JSON.stringify({
                Skin: parseInt($('input[name=skin]:checked').val()),
                Face: parseInt($('input[name=face]:checked').val()),
                Hair: parseInt($('input[name=hair]:checked').val()),
                HairColor: parseInt($('input[name=haircolor]:checked').val()),
                EyesColor: parseInt($('input[name=eyescolor]:checked').val()),
                Blemishes: parseInt($('input[name=blemishes]').val()),
                BlemishesOpacity: parseFloat($('input[name=blemishesopacity]').val()),
                Beard: parseInt($('input[name=beard]').val()),
                BeardOpacity: parseFloat($('input[name=beardopacity]').val()),
                BeardColor: parseInt($('input[name=beardcolor]:checked').val()),
                Eyebrows: parseInt($('input[name=eyebrows]').val()),
                EyebrowsOpacity: parseFloat($('input[name=eyebrowsopacity]').val()),
                EyebrowsColor: parseInt($('input[name=eyebrowscolor]:checked').val()),
                Wrinkles: parseInt($('input[name=wrinkles]').val()),
                WrinklesOpacity: parseFloat($('input[name=wrinklesopacity]').val()),
                Makeup: parseInt($('input[name=makeup]').val()),
                MakeupOpacity: parseFloat($('input[name=makeupopacity]').val()),
                MakeupColor: parseInt($('input[name=makeupcolor]:checked').val()),
                Blush: parseInt($('input[name=blush]').val()),
                BlushOpacity: parseFloat($('input[name=blushopacity]').val()),
                BlushColor: parseInt($('input[name=blushcolor]:checked').val()),
                Complexion: parseInt($('input[name=complexion]').val()),
                ComplexionOpacity: parseFloat($('input[name=complexionopacity]').val()),
                SunDamage: parseInt($('input[name=sundamage]').val()),
                SunDamageOpacity: parseFloat($('input[name=sundamageopacity]').val()),
                Lipstick: parseInt($('input[name=lipstick]').val()),
                LipstickOpacity: parseFloat($('input[name=lipstickopacity]').val()),
                LipstickColor: parseInt($('input[name=lipstickcolor]:checked').val()),
                Freckles: parseInt($('input[name=freckles]').val()),
                FrecklesOpacity: parseFloat($('input[name=frecklesopacity]').val()),
                ChestHair: parseInt($('input[name=chesthair]').val()),
                ChestHairOpacity: parseFloat($('input[name=chesthairopacity]').val()),
                ChestHairColor: parseInt($('input[name=chesthaircolor]:checked').val()),
                BodyBlemishes: parseInt($('input[name=bodyblemishes]').val()),
                BodyBlemishesOpacity: parseFloat($('input[name=bodyblemishesopacity]').val())
            }));
        });
    }

    Skin.Input = function() {
        $('input').on("input", function(){
            $.post('http://zombieoutbreak/Skin:Update', JSON.stringify({
                Skin: parseInt($('input[name=skin]:checked').val()),
                Face: parseInt($('input[name=face]:checked').val()),
                Hair: parseInt($('input[name=hair]:checked').val()),
                HairColor: parseInt($('input[name=haircolor]:checked').val()),
                EyesColor: parseInt($('input[name=eyescolor]:checked').val()),
                Blemishes: parseInt($('input[name=blemishes]').val()),
                BlemishesOpacity: parseFloat($('input[name=blemishesopacity]').val()),
                Beard: parseInt($('input[name=beard]').val()),
                BeardOpacity: parseFloat($('input[name=beardopacity]').val()),
                BeardColor: parseInt($('input[name=beardcolor]:checked').val()),
                Eyebrows: parseInt($('input[name=eyebrows]').val()),
                EyebrowsOpacity: parseFloat($('input[name=eyebrowsopacity]').val()),
                EyebrowsColor: parseInt($('input[name=eyebrowscolor]:checked').val()),
                Wrinkles: parseInt($('input[name=wrinkles]').val()),
                WrinklesOpacity: parseFloat($('input[name=wrinklesopacity]').val()),
                Makeup: parseInt($('input[name=makeup]').val()),
                MakeupOpacity: parseFloat($('input[name=makeupopacity]').val()),
                MakeupColor: parseInt($('input[name=makeupcolor]:checked').val()),
                Blush: parseInt($('input[name=blush]').val()),
                BlushOpacity: parseFloat($('input[name=blushopacity]').val()),
                BlushColor: parseInt($('input[name=blushcolor]:checked').val()),
                Complexion: parseInt($('input[name=complexion]').val()),
                ComplexionOpacity: parseFloat($('input[name=complexionopacity]').val()),
                SunDamage: parseInt($('input[name=sundamage]').val()),
                SunDamageOpacity: parseFloat($('input[name=sundamageopacity]').val()),
                Lipstick: parseInt($('input[name=lipstick]').val()),
                LipstickOpacity: parseFloat($('input[name=lipstickopacity]').val()),
                LipstickColor: parseInt($('input[name=lipstickcolor]:checked').val()),
                Freckles: parseInt($('input[name=freckles]').val()),
                FrecklesOpacity: parseFloat($('input[name=frecklesopacity]').val()),
                ChestHair: parseInt($('input[name=chesthair]').val()),
                ChestHairOpacity: parseFloat($('input[name=chesthairopacity]').val()),
                ChestHairColor: parseInt($('input[name=chesthaircolor]:checked').val()),
                BodyBlemishes: parseInt($('input[name=bodyblemishes]').val()),
                BodyBlemishesOpacity: parseFloat($('input[name=bodyblemishesopacity]').val())
            }));
        });
    }

    Skin.RangeButtonInput = function() {
        $('.RangeButton').click(function(){
            $.post('http://zombieoutbreak/Skin:Update', JSON.stringify({
                Skin: parseInt($('input[name=skin]:checked').val()),
                Face: parseInt($('input[name=face]:checked').val()),
                Hair: parseInt($('input[name=hair]:checked').val()),
                HairColor: parseInt($('input[name=haircolor]:checked').val()),
                EyesColor: parseInt($('input[name=eyescolor]:checked').val()),
                Blemishes: parseInt($('input[name=blemishes]').val()),
                BlemishesOpacity: parseFloat($('input[name=blemishesopacity]').val()),
                Beard: parseInt($('input[name=beard]').val()),
                BeardOpacity: parseFloat($('input[name=beardopacity]').val()),
                BeardColor: parseInt($('input[name=beardcolor]:checked').val()),
                Eyebrows: parseInt($('input[name=eyebrows]').val()),
                EyebrowsOpacity: parseFloat($('input[name=eyebrowsopacity]').val()),
                EyebrowsColor: parseInt($('input[name=eyebrowscolor]:checked').val()),
                Wrinkles: parseInt($('input[name=wrinkles]').val()),
                WrinklesOpacity: parseFloat($('input[name=wrinklesopacity]').val()),
                Makeup: parseInt($('input[name=makeup]').val()),
                MakeupOpacity: parseFloat($('input[name=makeupopacity]').val()),
                MakeupColor: parseInt($('input[name=makeupcolor]:checked').val()),
                Blush: parseInt($('input[name=blush]').val()),
                BlushOpacity: parseFloat($('input[name=blushopacity]').val()),
                BlushColor: parseInt($('input[name=blushcolor]:checked').val()),
                Complexion: parseInt($('input[name=complexion]').val()),
                ComplexionOpacity: parseFloat($('input[name=complexionopacity]').val()),
                SunDamage: parseInt($('input[name=sundamage]').val()),
                SunDamageOpacity: parseFloat($('input[name=sundamageopacity]').val()),
                Lipstick: parseInt($('input[name=lipstick]').val()),
                LipstickOpacity: parseFloat($('input[name=lipstickopacity]').val()),
                LipstickColor: parseInt($('input[name=lipstickcolor]:checked').val()),
                Freckles: parseInt($('input[name=freckles]').val()),
                FrecklesOpacity: parseFloat($('input[name=frecklesopacity]').val()),
                ChestHair: parseInt($('input[name=chesthair]').val()),
                ChestHairOpacity: parseFloat($('input[name=chesthairopacity]').val()),
                ChestHairColor: parseInt($('input[name=chesthaircolor]:checked').val()),
                BodyBlemishes: parseInt($('input[name=bodyblemishes]').val()),
                BodyBlemishesOpacity: parseFloat($('input[name=bodyblemishesopacity]').val())
            }));
        });
    }

    Skin.Keydown = function() {
        $(document).on("keydown", function(event) {
            if (ToggleMouse && event.which == 65) {
                $.post('http://zombieoutbreak/Skin:RotateLeft', JSON.stringify({
                    Left: 3
                }));
            }
            if (ToggleMouse && event.which == 68) {
                $.post('http://zombieoutbreak/Skin:RotateRight', JSON.stringify({
                    Right: 3
                }));
            }
            if (ToggleMouse && event.which == 9) {
                $.post('http://zombieoutbreak/Skin:View', JSON.stringify({
                }));
            }
        });
    }

});