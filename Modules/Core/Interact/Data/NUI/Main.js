Interact.options = function(list) {
    var divTarget = document.getElementById("options");
    var div = "";

    for (var i in list) {
        div += `<button value=`+ list[i].name +`>`+ list[i].label +`</button>`;
    }

    divTarget.innerHTML = div;
}

Interact.sleepClock = function(timer) {
	var id = setInterval(function() {
			timer -= 1000

			var textWakeUp = "Time remaining to wake up: "
			var minutes = Math.floor((timer % (1000 * 60 * 60)) / (1000 * 60));
			var seconds = Math.floor((timer % (1000 * 60)) / 1000);
		
			if (timer < 0) {
				clearInterval(id);
			} else {
				document.getElementById("timer").innerHTML = textWakeUp + minutes + "m " + seconds + "s ";
			}
	}, 1000);
}

$(document).ready(function(){
	$("#IncluideInteract").load("../Modules/Core/Interact/Data/NUI/Main.html", function() {
		$('<link>').appendTo('head').attr({
			type: 'text/css', 
			rel: 'stylesheet',
			href: '../Modules/Core/Interact/Data/NUI/Main.css'
		})
		$("#IncluideInteract").hide();
		$("#options").hide();
		$("#sleep").hide();
	});


	window.addEventListener('message', function(event) {
		var data = event.data;
		if (data.Type === "Interact") {
			if (data.Display == true) {
				$("#IncluideInteract").show();
				$("#options").show();
				//$("#IncluideInteract").css("z-index", 2)

                Interact.options(data.Options);
                Interact.Action(data.Target);


			} else {
				$("#options").hide();
				$("#IncluideInteract").hide();
				//$("#IncluideInteract").css("z-index", 0)
			}
		}

		if (data.type === "Interact_Sleep") {
			if (data.display == true) {
				$("#IncluideInteract").show();
				setTimeout(function() {
                    $('#sleep').fadeIn(1000);
                }, 250);

				Interact.sleepClock(data.Timer);
				
			} else {
				$("#IncluideInteract").fadeOut(1000);
				$('#sleep').fadeOut(1000);
			}
		}

	});

    Interact.Action = function(target) {
        $("button").click(function() {
            $.post("http://zombieoutbreak/Interact:"+ $(this).val(), JSON.stringify({
                entity: parseInt(target)
			}));
        });
    }


});