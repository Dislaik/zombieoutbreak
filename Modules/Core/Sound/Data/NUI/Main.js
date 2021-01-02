let Sounds = {};

$(document).ready(function(){

    window.addEventListener('message', function(event) {
        var Data = event.data;
        if (Data.Type == "Sound")
        {
            var i = Data.Index;
            Sounds[i] = new Howl({src: ["../Modules/" + Data.Module + "/" + Data.Resource + "/Data/Sounds/" + Data.File + ".ogg"],
                autoplay: true,
                loop: Data.Loop,
                volume: Data.Volume,
                pos : [Data.Coords.x, Data.Coords.y, Data.Coords.z],
                onend: function() {
                    if (!Data.Loop)
                    {
                        $.post('http://zombieoutbreak/Sound:Remove',JSON.stringify({
                            Index: i
                        }));
                    }
                }
            });
        }
        else if(Data.Type == "Update")
        {
            var i = Data.Index;
            Howler.volume(Data.Volume, Sounds[i]);
            Howler.pos(Data.PlayerCoords.x,Data.PlayerCoords.y,Data.PlayerCoords.z, Sounds[i]);
        }
    });
});