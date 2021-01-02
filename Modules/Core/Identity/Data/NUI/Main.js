Identity.CheckBox = function(box) {
    var cbs = document.getElementsByClassName("Checkbox");
    for (var i = 0; i < cbs.length; i++) {
        cbs[i].checked = false;
    }
    box.checked = true;
}

Identity.CheckEntries = function() {
	var EntryList = [
		document.getElementById("FirstName_Entry"), 
		document.getElementById("LastName_Entry"),
		document.getElementById("DateOfBirth_Entry")
	];
	for(element of EntryList)
	{
		element.addEventListener("input", function(){
			document.getElementById('Submit').disabled = (EntryList[0].value === '' || EntryList[1].value === '' || EntryList[2].value === '');
		})
	}
}

Identity.SelectList = function(Class) {
	var x, i, j, l, ll, selElmnt, a, b, c;
	x = document.getElementsByClassName("Select-List");
	l = x.length;
	for (i = 0; i < l; i++) {
		selElmnt = x[i].getElementsByTagName("select")[0];
		ll = selElmnt.length;
		a = document.createElement("DIV");
		a.setAttribute("class", "select-selected");
		a.setAttribute("data-value", selElmnt.options[selElmnt.selectedIndex].value)
		a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
		var SelectClasses = document.getElementById("SkillsDetails");
		SelectClasses.innerHTML = `<p>${Class[selElmnt.options[selElmnt.selectedIndex].value].Description}</p>`;
		x[i].appendChild(a);
		b = document.createElement("DIV");
		b.setAttribute("class", "select-items select-hide");
		for (j = 0; j < ll; j++) {
			c = document.createElement("DIV");
			c.innerHTML = selElmnt.options[j].innerHTML;
			c.addEventListener("click", function(e) {
				var y, i, k, s, h, sl, yl;
				s = this.parentNode.parentNode.getElementsByTagName("select")[0];
				sl = s.length;
				h = this.parentNode.previousSibling;
				for (i = 0; i < sl; i++) {
					if (s.options[i].innerHTML == this.innerHTML) {
						s.selectedIndex = i;
						h.innerHTML = this.innerHTML;
						y = this.parentNode.getElementsByClassName("same-as-selected");
						yl = y.length;
						for (k = 0; k < yl; k++) {
							y[k].removeAttribute("class");
						}
						this.setAttribute("class", "same-as-selected");
						var SelectClasses = document.getElementById("SkillsDetails");
						SelectClasses.innerHTML = `<p>${Class[s.options[i].value].Description}</p>`;
						this.setAttribute("data-value", s.options[i].value)
						break;
					}
				}
				h.click();
			});
			b.appendChild(c);
		}
		x[i].appendChild(b);
		a.addEventListener("click", function(e) {
			e.stopPropagation();
			CloseSelectList(this);
			this.nextSibling.classList.toggle("select-hide");
			this.classList.toggle("select-arrow-active");
		});
	}

	CloseSelectList = function(elmnt) {
		var x, y, i, xl, yl, arrNo = [];
		x = document.getElementsByClassName("select-items");
		y = document.getElementsByClassName("select-selected");
		xl = x.length;
		yl = y.length;
		for (i = 0; i < yl; i++) {
			if (elmnt == y[i]) {
				arrNo.push(i)
			} else {
				y[i].classList.remove("select-arrow-active");
			}
		}
		for (i = 0; i < xl; i++) {
			if (arrNo.indexOf(i)) {
				x[i].classList.add("select-hide");
			}
		}
	}

	document.addEventListener("click", CloseSelectList);
}

Identity.Translate = function(Lang) {
	if (Lang == "EN") {
		document.getElementById("Title").innerHTML = "Identity Creator";
		document.getElementById("FirstName").innerHTML = "First Name";
		document.getElementById("LastName").innerHTML = "Last Name";
		document.getElementById("DateOfBirth").innerHTML = "Date Of Birth";
		document.getElementById("Sex").innerHTML = "Sex";
		document.getElementById("Male").innerHTML = "Male";
		document.getElementById("Female").innerHTML = "Female";
		document.getElementById("Occupation").innerHTML = "Occupation";
		document.getElementById("Skills").innerHTML = "Description";
		document.getElementById("Submit").innerHTML = "Create Identity";
	} else if (Lang == "ES") {
		document.getElementById("Title").innerHTML = "Creador de Identidad";
		document.getElementById("FirstName").innerHTML = "Nombre";
		document.getElementById("LastName").innerHTML = "Apellido";
		document.getElementById("DateOfBirth").innerHTML = "Fecha De Nacimiento";
		document.getElementById("Sex").innerHTML = "Sexo";
		document.getElementById("Male").innerHTML = "Masculino";
		document.getElementById("Female").innerHTML = "Femenino";
		document.getElementById("Occupation").innerHTML = "Ocupación";
		document.getElementById("Skills").innerHTML = "Descripción";
		document.getElementById("Submit").innerHTML = "Crear Identidad";
	};
}

Identity.SetSelectList = function(Classes) {
	var SelectClasses = document.getElementById("Occupations")
	var Div = "";
	for (var Class in Classes) {
		Div += `<option value="${Class}">${Classes[Class].Label}</option>`;
	}
	SelectClasses.innerHTML = Div;
}

let PreventList = true;

$(document).ready(function(){


	window.addEventListener('message', function(event) {
		var Data = event.data;
		if (Data.Type === "Identity") {
			if (Data.Display == true) {
				$("#IncluideIdentity").load("../Modules/Core/Identity/Data/NUI/Main.html", function() {
					$('<link>').appendTo('head').attr({
						type: 'text/css', 
						rel: 'stylesheet',
						href: '../Modules/Core/Identity/Data/NUI/Main.css'
					});

					Identity.Translate(Data.Locale);
					Identity.CheckEntries();
					Identity.SetSelectList(Data.Occupation);
					Identity.SelectList(Data.Occupation);
					Identity.Submit();
				});

				$("#IncluideIdentity").hide();
				setTimeout(function() {
                    $('#IncluideIdentity').fadeIn(1000);
                }, 250);
			} else {
				$("#IncluideIdentity").empty();
				$("LINK[href*='../Modules/Core/Identity/Data/NUI/Main.css']").remove();
			}
		}
	});

	Identity.Submit = function() {
		$("#Submit").click(function () {
			let EntryFirstName = $("#FirstName_Entry").val()
			let EntryLastName = $("#LastName_Entry").val()
			let EntryDateOfBirth = $("#DateOfBirth_Entry").val()
			let Male = $("#MaleCheckbox").prop('checked')
			let Female = $("#FemaleCheckbox").prop('checked')
			let EntryOccupation = $(".same-as-selected").data('value')
			if (!$(".same-as-selected").data("value")) {
				EntryOccupation = $(".select-selected").data('value')
			}
			let EntrySex;
			if (Male) {
				EntrySex = "Male";
			} else if (Female) {
				EntrySex = "Female";
			}
			$.post('http://zombieoutbreak/Identity:Submit', JSON.stringify({
				FirstName: EntryFirstName,
				LastName: EntryLastName,
				DateOfBirth: EntryDateOfBirth,
				Sex: EntrySex,
				Occupation: EntryOccupation
			}));
		})
	}
});