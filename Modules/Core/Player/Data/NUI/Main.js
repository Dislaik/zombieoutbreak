var TotalPoints
var AvailableTraits
var CacheTraits = {
	"Positive" : {},
	"Negative" : {}
}
var ChosenTraits = {
	"Positive" : {},
	"Negative" : {}
}


Player.SetOccupations = function(List) {
    var DivTarget = document.getElementById("Ocuppations");
    var Div = "";

	for (var _ in List) {
		var DivMarjorSkills = "";

		if (List[_].Name == "unemployed") {

			for (var __ in List[_].MajorSkills) {
				DivMarjorSkills += `<p>+`+ List[_].MajorSkills[__].Level +` `+ List[_].MajorSkills[__].Label +`</p>`
			}

            Div += `<label>
						<input type="radio" name="Ocuppations" value="`+ List[_].Name +`" checked>
						<span class="Occupatons-Item Tooltip">
							<p>`+ List[_].Label +`</p>
							<span>
								<p>`+ List[_].Description +`</p>
								`+ DivMarjorSkills +`
							</span>
						</span>
					</label>`;
        } else {

			for (var __ in List[_].MajorSkills) {
				DivMarjorSkills += `<p>+`+ List[_].MajorSkills[__].Level +` `+ List[_].MajorSkills[__].Label +`</p>`
			}

            Div += `<label>
						<input type="radio" name="Ocuppations" value="`+ List[_].Name +`">
						<span class="Occupatons-Item Tooltip">
							<p>`+ List[_].Label +`</p>
							<span>
								<p>`+ List[_].Description +`</p>
								`+ DivMarjorSkills +`
							</span>
						</span>
					</label>`;
        }
    }

    Div =	`<p>Occupations</p>
				<div class="Content">`
					+ Div + 
				`</div>`

    DivTarget.innerHTML = Div;
}

Player.SetTraits = function(List) {
	for (var _ in List) {
		var DivTarget = $("#"+ _ +"Traits");
		var Div = ""
		var Symbol
		if (_ == "Positive") {
			Symbol = "-"
		} else if (_ == "Negative") {
			Symbol = "+"
		}

		for (var __ in List[_]) {
			//console.log(__, AvailableTraits[_][__].Name)
			Div += `<label>
						<input type="radio" name="Traits" value=`+ List[_][__].Name +`>
						<span class="Traits-`+ _ +`-Item Tooltip">
							<p>`+ List[_][__].Label +`</p>
							<p class="Right">`+ Symbol + List[_][__].Points +` Points</p>
							<span>
								<p>`+ List[_][__].Description +`</p>
							</span>
						</span>
					</label>`
		}

		DivTarget.html(Div);
	}
}

Player.SetAppearance = function(Model) {

	///////////////////// Skin /////////////////////

	var SkinList = [ 
		{Color : "#E7B78E", Index : 0 },
		{Color : "#442F1E", Index : 2},
		{Color : "#C79C77", Index : 4},
		{Color : "#C7BA77", Index : 6},
		{Color : "#9B7554", Index : 8},
		{Color : "#C7A777", Index : 10},
	];
	var SkinRandom = SkinList[Math.floor(Math.random() * SkinList.length)];

	SkinDiv = document.getElementById("Skin");
	Div = "";
	for (var _ in SkinList) {
		if (SkinList[_].Index == SkinRandom.Index) {
			Div += `<option value="`+ SkinList[_].Index +`" selected>`+ SkinList[_].Color +`</option>`;
		} else {
			Div += `<option value="`+ SkinList[_].Index +`">`+ SkinList[_].Color +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	SkinDiv.innerHTML = Div;

	///////////////////// Face /////////////////////

	if (Model == "mp_m_freemode_01") {
		var FaceList = [
			{Name : "Benjamin", Index : 0},
			{Name : "Daniel", Index : 1},
			{Name : "Joshua", Index : 2},
			{Name : "Noah", Index : 3},
			{Name : "Andrew", Index : 4},
			{Name : "Juan", Index : 5},
			{Name : "Alex", Index : 6},
			{Name : "Isaac", Index : 7},
			{Name : "Evan", Index : 8},
			{Name : "Ethan", Index : 9},
			{Name : "Vincent", Index : 10},
			{Name : "Angel", Index : 11},
			{Name : "Diego", Index : 12},
			{Name : "Adrian", Index : 13},
			{Name : "Gabriel", Index : 14},
			{Name : "Michael", Index : 15},
			{Name : "Santiago", Index : 16},
			{Name : "Kevin", Index : 17},
			{Name : "Louis", Index : 18},
			{Name : "Samuel", Index : 19},
			{Name : "Anthony", Index : 20},
			{Name : "Claude", Index : 42},
			{Name : "Niko", Index : 43},
				{Name : "Jhon", Index : 44}
		];
	} else {
		var FaceList = [
			{Name : "Hannah", Index : 21},
			{Name : "Audrey", Index : 22},
			{Name : "Jasmine", Index : 23},
			{Name : "Giselle", Index : 24},
			{Name : "Amelia", Index : 25},
			{Name : "Isabella", Index : 26},
			{Name : "Zoe", Index : 27},
			{Name : "Ava", Index : 28},
			{Name : "Camila", Index : 29},
			{Name : "Violet", Index : 30},
			{Name : "Sophia", Index : 31},
			{Name : "Evelyn", Index : 32},
			{Name : "Nicole", Index : 33},
			{Name : "Ashley", Index : 34},
			{Name : "Grace", Index : 35},
			{Name : "Brianna", Index : 36},
			{Name : "Natalie", Index : 37},
			{Name : "Olivia", Index : 38},
			{Name : "Elizabeth", Index : 39},
			{Name : "Charlotte", Index : 40},
			{Name : "Emma", Index : 41}
		];
	}
	var FaceRandom = FaceList[Math.floor(Math.random() * FaceList.length)];
	
	var FaceDiv = document.getElementById("Face");
	Div = "";
	for (var _ in FaceList) {
		if (FaceList[_].Index == FaceRandom.Index) {
			Div += `<option value="`+ FaceList[_].Index +`" selected>`+ FaceList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ FaceList[_].Index +`">`+ FaceList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	FaceDiv.innerHTML = Div;

	///////////////////// Hair /////////////////////

	if (Model == "mp_m_freemode_01") {
		var HairList = [
			{Name : "Shave", Index : 0},
			{Name : "Buzzcut", Index : 1},
			{Name : "Faux Hawk", Index : 2},
			{Name : "Hipster", Index : 3},
			{Name : "Side Parting", Index : 4},
			{Name : "Shorter Cut", Index : 5},
			{Name : "Biker", Index : 6},
			{Name : "Ponytail", Index : 7},
			{Name : "Cornrows", Index : 8},
			{Name : "Slicked", Index : 9},
			{Name : "Short Brushed", Index : 10},
			{Name : "Spikey", Index : 11},
			{Name : "Caesar", Index : 12},
			{Name : "Chopped", Index : 13},
			{Name : "Dreads", Index : 14},
			{Name : "Long Hair", Index : 15},
			{Name : "Shaggy Curls", Index : 16},
			{Name : "Surfer Dude", Index : 17},
			{Name : "Short Side Part", Index : 18},
			{Name : "High Slicked Sides", Index : 19},
			{Name : "Long Slicked", Index : 20},
			{Name : "Hipster Youth", Index : 21},
			{Name : "Classic Cornrows", Index : 24},
			{Name : "Palm Cornrows", Index : 25},
			{Name : "Lightning Cornrows", Index : 26},
			{Name : "Whipped Cornrows", Index : 27},
			{Name : "Zig Zag Cornrows", Index : 28},
			{Name : "Snail Cornrows", Index : 29},
			{Name : "Hightop", Index : 30},
			{Name : "Loose Swept Back", Index : 31},
			{Name : "Undercut Swept Back", Index : 32},
			{Name : "Undercut Swept Side", Index : 33},
			{Name : "Spiked Mohawk", Index : 34},
			{Name : "Mod", Index : 35},
			{Name : "Layered Mod", Index : 36},
			{Name : "Flattop", Index : 72},
			{Name : "Military Buzzcut", Index : 73}
		];
	} else {
		var HairList = [
			{Name : "Shave", Index : 0},
			{Name : "Short", Index : 1},
			{Name : "Layered Bob", Index : 2},
			{Name : "Pigtails", Index : 3},
			{Name : "Ponytail", Index : 4},
			{Name : "Braided Mohawk", Index : 5},
			{Name : "Braids", Index : 6},
			{Name : "Bob", Index : 7},
			{Name : "Faux Hawk", Index : 8},
			{Name : "French Twist", Index : 9},
			{Name : "Long Bob", Index : 10},
			{Name : "Loose Tied", Index : 11},
			{Name : "Pixie", Index : 12},
			{Name : "Shaved Bangs", Index : 13},
			{Name : "Top Knot", Index : 14},
			{Name : "Wavy Bob", Index : 15},
			{Name : "Messy Bun", Index : 17},
			{Name : "Pin Up Girl", Index : 16},
			{Name : "Tight Bun", Index : 19},
			{Name : "Twisted Bob", Index : 20},
			{Name : "Flapper Bob", Index : 18},
			{Name : "Big Bangs", Index : 21},
			{Name : "Braided Top Knot", Index : 22},
			{Name : "Pinched Cornrows", Index : 25},
			{Name : "Leaf Cornrows", Index : 26},
			{Name : "Zig Zag Cornrows", Index : 27},
			{Name : "Pigtail Bangs", Index : 28},
			{Name : "Wave Braids", Index : 29},
			{Name : "Coil Braids", Index : 30},
			{Name : "Rolled Quiff", Index : 31},
			{Name : "Loose Swept Back", Index : 32},
			{Name : "Undercut Swept Back", Index : 33},
			{Name : "Undercut Swept Side", Index : 34},
			{Name : "Spiked Mohawk", Index : 35},
			{Name : "Bandana and Braid", Index : 36},
			{Name : "Layered Mod", Index : 38},
			{Name : "Skinbyrd", Index : 37},
			{Name : "Neat Bun", Index : 76},
			{Name : "Short Bob", Index : 77}
		];
	}
	var HairRandom = HairList[Math.floor(Math.random() * HairList.length)];

	var HairDiv = document.getElementById("Hair");
	Div = "";
	for (var _ in HairList) {
		if (HairList[_].Index == HairRandom.Index) {
			Div += `<option value="`+ HairList[_].Index +`" selected>`+ HairList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ HairList[_].Index +`">`+ HairList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	HairDiv.innerHTML = Div;

	///////////////////// HairColor /////////////////////

	var HairColorList = [
		{ Name : "#1C1F21", Index : 0},
		{ Name : "#272A2C", Index : 1},
		{ Name : "#312E2C", Index : 2},
		{ Name : "#35261C", Index : 3},
		{ Name : "#4B321F", Index : 4},
		{ Name : "#5C3B24", Index : 5},
		{ Name : "#6D4C35", Index : 6},
		{ Name : "#6B503B", Index : 7},
		{ Name : "#765C45", Index : 8},
		{ Name : "#7F684E", Index : 9},
		{ Name : "#99815D", Index : 10},
		{ Name : "#A79369", Index : 11},
		{ Name : "#AF9C70", Index : 12},
		{ Name : "#BBA063", Index : 13},
		{ Name : "#D6B97B", Index : 14},
		{ Name : "#DAC38E", Index : 15},
		{ Name : "#9F7F59", Index : 16},
		{ Name : "#845039", Index : 17},
		{ Name : "#682B1F", Index : 18},
		{ Name : "#61120C", Index : 19},
		{ Name : "#640F0A", Index : 20},
		{ Name : "#7C140F", Index : 21},
		{ Name : "#A02E19", Index : 22},
		{ Name : "#B64B28", Index : 23},
		{ Name : "#A2502F", Index : 24},
		{ Name : "#AA4E2B", Index : 25},
		{ Name : "#626262", Index : 26},
		{ Name : "#808080", Index : 27},
		{ Name : "#AAAAAA", Index : 28},
		{ Name : "#C5C5C5", Index : 29},
		/*{ Name : "#463955", Index : 30},
		{ Name : "#5A3F6B", Index : 31},
		{ Name : "#763C76", Index : 32},
		{ Name : "#ED74E3", Index : 33},
		{ Name : "#EB4B93", Index : 34},
		{ Name : "#F299BC", Index : 35},
		{ Name : "#04959E", Index : 36},
		{ Name : "#025F86", Index : 37},
		{ Name : "#023974", Index : 38},
		{ Name : "#3FA16A", Index : 39},
		{ Name : "#217C61", Index : 40},
		{ Name : "#185C55", Index : 41},
		{ Name : "#B6C034", Index : 42},
		{ Name : "#70A90B", Index : 43},
		{ Name : "#439D13", Index : 44},
		{ Name : "#DCB857", Index : 45},
		{ Name : "#E5B103", Index : 46},
		{ Name : "#E69102", Index : 47},
		{ Name : "#F28831", Index : 48},
		{ Name : "#FB8057", Index : 49},
		{ Name : "#E28B58", Index : 50},
		{ Name : "#D1593C", Index : 51},
		{ Name : "#CE3120", Index : 52},
		{ Name : "#AD0903", Index : 53},
		{ Name : "#880302", Index : 54},
		{ Name : "#1F1814", Index : 55},
		{ Name : "#291F19", Index : 56},
		{ Name : "#2E221B", Index : 57},
		{ Name : "#37291E", Index : 58},
		{ Name : "#2E2218", Index : 59},
		{ Name : "#231B15", Index : 60},
		{ Name : "#020202", Index : 61},
		{ Name : "#706C66", Index : 62},
		{ Name : "#9D7A50", Index : 63}*/
	];
	var HairColorRandom = HairColorList[Math.floor(Math.random() * HairColorList.length)];

	var HairColorDiv = document.getElementById("HairColor");
	Div = "";
	for (var _ in HairColorList) {
		if (HairColorList[_].Index == HairColorRandom.Index) {
			Div += `<option value="`+ HairColorList[_].Index +`" selected>`+ HairColorList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ HairColorList[_].Index +`">`+ HairColorList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	HairColorDiv.innerHTML = Div;

	///////////////////// Eyes /////////////////////

	var EyesList = [
		{ Name : "Green", Index : 0},
		{ Name : "Emerald", Index : 1},
		{ Name : "Light Blue", Index : 2},
		{ Name : "Ocean Blue", Index : 3},
		{ Name : "Light Brown", Index : 4},
		{ Name : "Dark Brown", Index : 5},
		{ Name : "Hazel", Index : 6},
		{ Name : "Dark Gray", Index : 7},
		{ Name : "Light Gray", Index : 8},
		/*{ Name : "Pink", Index : 9},
		{ Name : "Yellow", Index : 10},
		{ Name : "Purple", Index : 11},
		{ Name : "Blackout", Index : 12},
		{ Name : "Shades of Gray", Index : 13},
		{ Name : "Tequila Sunrise", Index : 14},
		{ Name : "Atomic", Index : 15},
		{ Name : "Warp", Index : 16},
		{ Name : "ECola", Index : 17},
		{ Name : "Space Ranger", Index : 18},
		{ Name : "Ying Yang", Index : 19},
		{ Name : "Bullseye", Index : 20},
		{ Name : "Lizard", Index : 21},
		{ Name : "Dragon", Index : 22},
		{ Name : "Extra Terrestrial", Index : 23},
		{ Name : "Goat", Index : 24},
		{ Name : "Smiley", Index : 25},
		{ Name : "Possessed", Index : 26},
		{ Name : "Demon", Index : 27},
		{ Name : "Infected", Index : 28},
		{ Name : "Alien", Index : 29},
		{ Name : "Undead", Index : 30},
		{ Name : "Zombie", Index : 31}*/
	];
	var EyesRandom = EyesList[Math.floor(Math.random() * EyesList.length)];

	var EyesDiv = document.getElementById("Eyes");
	Div = "";
	for (var _ in EyesList) {
		if (EyesList[_].Index == EyesRandom.Index) {
			Div += `<option value="`+ EyesList[_].Index +`" selected>`+ EyesList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ EyesList[_].Index +`">`+ EyesList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	EyesDiv.innerHTML = Div;

	///////////////////// Eyebrows /////////////////////

	var EyebrowsList = [
		{ Name : "Balanced", Index : 0},
		{ Name : "Fashion", Index : 1},
		{ Name : "Cleopatra", Index : 2},
		{ Name : "Quizzical", Index : 3},
		{ Name : "Femme", Index :4},
		{ Name : "Seductive", Index : 5},
		{ Name : "Pinched", Index : 6},
		{ Name : "Chola", Index : 7},
		{ Name : "Triomphe", Index : 8},
		{ Name : "Carefree", Index : 9},
		{ Name : "Curvaceous", Index : 10},
		{ Name : "Rodent", Index : 11},
		{ Name : "Double Tram", Index : 12},
		{ Name : "Thin", Index : 13},
		{ Name : "Penciled", Index : 14},
		{ Name : "Mother Plucker", Index : 15},
		{ Name : "Straight and Narrow", Index : 16},
		{ Name : "Natural", Index : 17},
		{ Name : "Fuzzy", Index : 18},
		{ Name : "Unkempt", Index : 19},
		{ Name : "Caterpillar", Index : 20},
		{ Name : "Regular", Index : 21},
		{ Name : "Mediterranean", Index : 22},
		{ Name : "Groomed", Index : 23},
		{ Name : "Bushels", Index : 24},
		{ Name : "Feathered", Index : 25},
		{ Name : "Prickly", Index : 26},
		{ Name : "Monobrow", Index : 27},
		{ Name : "Winged", Index : 28},
		{ Name : "Triple Tram", Index : 29},
		{ Name : "Arched Tram", Index : 30},
		{ Name : "Cutouts", Index : 31},
		{ Name : "Fade Away", Index : 32},
		{ Name : "Solo Tram", Index : 33}
	];
	var EyebrowsRandom = EyebrowsList[Math.floor(Math.random() * EyebrowsList.length)];

	var EyebrowsDiv = document.getElementById("Eyebrows");
	Div = "";
	for (var _ in EyebrowsList) {
		if (EyebrowsList[_].Index == EyebrowsRandom.Index) {
			Div += `<option value="`+ EyebrowsList[_].Index +`" selected>`+ EyebrowsList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ EyebrowsList[_].Index +`">`+ EyebrowsList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	EyebrowsDiv.innerHTML = Div;

	///////////////////// Beards /////////////////////

	if (Model == "mp_m_freemode_01") {
		var BeardsList = [
			{ Name : "Clean Shaven", Index : -1},
			{ Name : "Light Stubble", Index : 0},
			{ Name : "Balbo", Index : 1},
			{ Name : "Circle Beard", Index : 2},
			{ Name : "Goatee", Index : 3},
			{ Name : "Chin", Index : 4},
			{ Name : "Chin Fuzz", Index : 5},
			{ Name : "Pencil Chin Strap", Index : 6},
			{ Name : "Scruffy", Index : 7},
			{ Name : "Musketeer", Index : 8},
			{ Name : "Mustache", Index : 9},
			{ Name : "Trimmed Beard", Index : 10},
			{ Name : "Stubble", Index : 11},
			{ Name : "Thin Circle Beard", Index : 12},
			{ Name : "Horseshoe", Index : 13},
			{ Name : "Pencil and 'Chops", Index : 14},
			{ Name : "Chin Strap Beard", Index : 15},
			{ Name : "Balbo and Sideburns", Index : 16},
			{ Name : "Mutton Chops", Index : 17},
			{ Name : "Scruffy Beard", Index : 18},
			{ Name : "Curly", Index : 19},
			{ Name : "Curly & Deep Stranger", Index : 20},
			{ Name : "Handlebar", Index : 21},
			{ Name : "Faustic", Index : 22},
			{ Name : "Otto & Patch", Index : 23},
			{ Name : "Otto & Full Stranger", Index : 24},
			{ Name : "Light Franz", Index : 25},
			{ Name : "The Hampstead", Index : 26},
			{ Name : "The Ambrose", Index : 27},
			{ Name : "Lincoln Curtain", Index : 28}
		];
	} else {
		var BeardsList = [
			{ Name : "None", Index : -1}
		]
	}
	var BeardsRandom = BeardsList[Math.floor(Math.random() * BeardsList.length)];

	var BeardsDiv = document.getElementById("Beards");
	Div = "";
	for (var _ in BeardsList) {
		if (BeardsList[_].Index == BeardsRandom.Index) {
			Div += `<option value="`+ BeardsList[_].Index +`" selected>`+ BeardsList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ BeardsList[_].Index +`">`+ BeardsList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	BeardsDiv.innerHTML = Div;

	if (Model == "mp_f_freemode_01") {
		document.getElementById("Beards-Text").classList.add("Disabled");
		BeardsDiv.classList.add("Disabled");
	} else {
		document.getElementById("Beards-Text").classList.remove("Disabled");
		BeardsDiv.classList.remove("Disabled");
	}

	///////////////////// Chest /////////////////////

	if (Model == "mp_m_freemode_01") {
		var ChestList = [
			{ Name : "Shaved", Index : -1},
			{ Name : "Natural", Index : 0},
			{ Name : "The Strip", Index : 1},
			{ Name : "The Tree", Index : 2},
			{ Name : "Hairy", Index : 3},
			{ Name : "Grisly", Index : 4},
			{ Name : "Ape", Index : 5},
			{ Name : "Groomed Ape", Index : 6},
			/*{ Name : "Bikini", Index : 7},
			{ Name : "Lightning Bolt", Index : 8},
			{ Name : "Reverse Lightning", Index : 9},
			{ Name : "Love Heart", Index : 10},
			{ Name : "Chestache", Index : 11},
			{ Name : "Happy Face", Index : 12},
			{ Name : "Skull", Index : 13},*/
			{ Name : "Snail Trail", Index : 14},
			{ Name : "Slug and Nips", Index : 15},
			/*{ Name : "Hairy Arms", Index : 16}*/
		];
	} else {
		var ChestList = [
			{ Name : "None", Index : -1}
		]
	}
	var ChestRandom = ChestList[Math.floor(Math.random() * ChestList.length)];
	
	var ChestDiv = document.getElementById("Chest");
	Div = "";
	for (var _ in ChestList) {
		if (ChestList[_].Index == ChestRandom.Index) {
			Div += `<option value="`+ ChestList[_].Index +`" selected>`+ ChestList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ ChestList[_].Index +`">`+ ChestList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	ChestDiv.innerHTML = Div;

	////////////////////////////////////////////////////
	///////////////////// Clothing /////////////////////
	////////////////////////////////////////////////////

	if (Model == "mp_f_freemode_01") {
		document.getElementById("Chest-Text").classList.add("Disabled");
		ChestDiv.classList.add("Disabled");
	} else {
		document.getElementById("Chest-Text").classList.remove("Disabled");
		ChestDiv.classList.remove("Disabled");
	}

	///////////////////// Hat /////////////////////

	if (Model == "mp_m_freemode_01") {
		var HatList = [
			{ Name : "None", Index : -1},
			{ Name : "Naughty Cap", Index: 44}
		];
	} else {
		var HatList = [
			{ Name : "None", Index : -1},
			{ Name : "Naughty Cap", Index: 43}
		]
	}

	var HatDiv = document.getElementById("Hat");
	Div = "";
	for (var _ in HatList) {
		Div += `<option value="`+ HatList[_].Index +`">`+ HatList[_].Name +`</option>`;
	}
	Div = `<select>`+ Div + `</select>`
	HatDiv.innerHTML = Div;

	///////////////////// Glasses /////////////////////

	if (Model == "mp_m_freemode_01") {
		var GlassesList = [
			{ Name : "None", Index : -1},
			{ Name : "Regular", Index : 20}
		];
	} else {
		var GlassesList = [
			{ Name : "None", Index : -1},
			{ Name : "Regular", Index : 21}
		]
	}

	var GlassesDiv = document.getElementById("Glasses");
	Div = "";
	for (var _ in GlassesList) {
		Div += `<option value="`+ GlassesList[_].Index +`">`+ GlassesList[_].Name +`</option>`;
	}
	Div = `<select>`+ Div + `</select>`
	GlassesDiv.innerHTML = Div;

	///////////////////// Tshirt /////////////////////

	if (Model == "mp_m_freemode_01") {
		var TshirtList = [
			{ Name : "None", Index : -1},
			{ Name : "White Tshirt", Index : 22}
		];
	} else {
		var TshirtList = [
			{ Name : "None", Index : -1},
			{ Name : "White Tshirt", Index : 73}
		]
	}
	var TshirtRandom = TshirtList[Math.floor(Math.random() * (TshirtList.length - 1)) + 1];

	var TshirtDiv = document.getElementById("Tshirt");
	Div = "";
	for (var _ in TshirtList) {
		if (TshirtList[_].Index == TshirtRandom.Index) {
			Div += `<option value="`+ TshirtList[_].Index +`" selected>`+ TshirtList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ TshirtList[_].Index +`">`+ TshirtList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	TshirtDiv.innerHTML = Div;

	///////////////////// Pants /////////////////////

	if (Model == "mp_m_freemode_01") {
		var PantsList = [
			{ Name : "None", Index : -1},
			{ Name : "Jeans Black", Index : 1}
		];
	} else {
		var PantsList = [
			{ Name : "None", Index : -1},
			{ Name : "Jeans Blue", Index : 1}
		]
	}
	var PantsRandom = PantsList[Math.floor(Math.random() * (PantsList.length - 1)) + 1];

	var PantsDiv = document.getElementById("Pants");
	Div = "";
	for (var _ in PantsList) {
		if (PantsList[_].Index == PantsRandom.Index) {
			Div += `<option value="`+ PantsList[_].Index +`" selected>`+ PantsList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ PantsList[_].Index +`">`+ PantsList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	PantsDiv.innerHTML = Div;

	///////////////////// Shoes /////////////////////

	if (Model == "mp_m_freemode_01") {
		var ShoesList = [
			{ Name : "None", Index : -1},
			{ Name : "Regular", Index : 1}
		];
	} else {
		var ShoesList = [
			{ Name : "None", Index : -1},
			{ Name : "Regular", Index : 3}
		]
	}
	var ShoesRandom = ShoesList[Math.floor(Math.random() * (ShoesList.length - 1)) + 1];

	var ShoesDiv = document.getElementById("Shoes");
	Div = "";
	for (var _ in ShoesList) {
		if (ShoesList[_].Index == ShoesRandom.Index) {
			Div += `<option value="`+ ShoesList[_].Index +`" selected>`+ ShoesList[_].Name +`</option>`;
		} else {
			Div += `<option value="`+ ShoesList[_].Index +`">`+ ShoesList[_].Name +`</option>`;
		}
	}
	Div = `<select>`+ Div + `</select>`
	ShoesDiv.innerHTML = Div;

	Player.Select();
}

Player.Translate = function(List)
{
	for (var _ in List) 
	{
		var Translate = document.getElementById(_);
		if (Translate != null)
		{
			Translate.innerHTML = List[_];
		}
	}
}

Player.DeleteTraits = function(List, Name, Counter) {

	for (var _ in List)
	{
		for (var __ in List[_])
		{
			//console.log(List[_][__].Name, List[_][__].Counter)
			if (List[_][__].Name == Name || List[_][__].Name == Counter)
			{
				//console.log(AvailableTraits[_][__].Name)
				//////var Index = AvailableTraits[_].indexOf(AvailableTraits[_][__])
				//console.log(Index)
				CacheTraits[_][__] = List[_][__]
				/////AvailableTraits[_].splice(Index, 1);
				delete List[_][__];

			}

		}

	}
}

Player.TooltipsDetection = function()
{
	var tooltips = document.querySelectorAll('.Tooltip span');

	window.onmousemove = function (e) {
		var x = (e.clientX + 20) + 'px',
			y = (e.clientY + 20) + 'px';
		for (var i = 0; i < tooltips.length; i++) {
			tooltips[i].style.top = y;
			tooltips[i].style.left = x;
		}
	};
}

Player.Select = function()
{
	var x, i, j, l, ll, selElmnt, a, b, c;
	/*look for any elements with the class "custom-select":*/
	x = document.getElementsByClassName("custom-select");
	l = x.length;
	for (i = 0; i < l; i++) {
	selElmnt = x[i].getElementsByTagName("select")[0];
	//console.log(x[i].hasAttribute('id'))
	ll = selElmnt.length;
	/*for each element, create a new DIV that will act as the selected item:*/
	a = document.createElement("DIV");
	a.setAttribute("class", "select-selected");
	if (selElmnt.options[selElmnt.selectedIndex].innerHTML.charAt(0) == "#")
	{
		a.innerHTML = `<div class="custom-select-color" style="background-color: `+ selElmnt.options[selElmnt.selectedIndex].innerHTML +`;"></div>`;
	}
	else
	{
		a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
	}
	///console.log(a.innerHTML);
	x[i].appendChild(a);
	/*for each element, create a new DIV that will contain the option list:*/
	b = document.createElement("DIV");
	b.setAttribute("class", "select-items select-hide");
	for (j = 0; j < ll; j++) {
		/*for each option in the original select element,
		create a new DIV that will act as an option item:*/
		c = document.createElement("DIV");
		c.dataset.html = selElmnt.options[j].innerHTML
		if (selElmnt.options[j].innerHTML.charAt(0) == "#")
		{
			c.innerHTML  = `<div class="custom-select-color" style="background-color: `+ selElmnt.options[j].innerHTML +`;"></div>`;
		}
		else
		{
			c.innerHTML = selElmnt.options[j].innerHTML;
		}
		c.addEventListener("click", function(e) {
			/*when an item is clicked, update the original select box,
			and the selected item:*/
			var y, i, k, s, h, sl, yl;
			s = this.parentNode.parentNode.getElementsByTagName("select")[0];
			sl = s.length;
			h = this.parentNode.previousSibling;
			for (i = 0; i < sl; i++) {
				//console.log(s.options[i].innerHTML, this.innerHTML )
				if (s.options[i].innerHTML == this.innerHTML || s.options[i].innerHTML == this.dataset.html) {
					s.selectedIndex = i;
					h.innerHTML = this.innerHTML;
					y = this.parentNode.getElementsByClassName("same-as-selected");
					yl = y.length;
					for (k = 0; k < yl; k++) {
						y[k].removeAttribute("class");
					}
					this.setAttribute("class", "same-as-selected");
					break;
				}
			}
			h.click();
		});
		b.appendChild(c);
	}
	x[i].appendChild(b);
	a.addEventListener("click", function(e) {
		/*when the select box is clicked, close any other select boxes,
		and open/close the current select box:*/
		e.stopPropagation();
		closeAllSelect(this);
		this.nextSibling.classList.toggle("select-hide");
		//this.classList.toggle("select-arrow-active");
		});
	}
	function closeAllSelect(elmnt) {
		/*a function that will close all select boxes in the document,
		except the current select box:*/
		var x, y, i, xl, yl, arrNo = [];
		x = document.getElementsByClassName("select-items");
		y = document.getElementsByClassName("select-selected");
		xl = x.length;
		yl = y.length;
		for (i = 0; i < yl; i++) {
			if (elmnt == y[i]) {
			arrNo.push(i)
			/*} else {
			y[i].classList.remove("select-arrow-active");*/
			}
		}
		for (i = 0; i < xl; i++) {
			if (arrNo.indexOf(i)) {
			x[i].classList.add("select-hide");
			}
		}
  	}
}

$(document).ready(function(){
	$("#IncluidePlayer").load("../Modules/Core/Player/Data/NUI/Index.html", function() {
		$('<link>').appendTo('head').attr({
			type: 'text/css', 
			rel: 'stylesheet',
			href: '../Modules/Core/Player/Data/NUI/Main.css'
		});

		$("#OccupationsAndTraits").hide();
		$("#CustomizeCharacter").hide();
	});

	window.addEventListener('message', function(event) {
		var data = event.data;

		if (data.Type === "Player") {
			if (data.Display == true) {

				$("#OccupationsAndTraits").show();
				Player.Translate(data.Locale)

				TotalPoints = data.Points
				AvailableTraits = data.Traits

				Player.SetOccupations(data.Occupations);
				Player.SetMajorSkills(data.Occupations, data.Locale, data.Points);
				Player.SetTraits(data.Traits);
				//Player.SetAppearance();
				
				Player.AddTrait();
				Player.RemoveTrait();
				Player.Next();
				Player.Back();
				Player.Play();
				Player.UpdateGender();
				Player.UpdateAppearance();

				Player.TooltipsDetection();

				/*$("#IncluideCharacter").hide();
				setTimeout(function() {
                    $('#IncluideCharacter').fadeIn(1000);
                }, 250);*/
			} else {
				$("#IncluidePlayer").hide();
				//$("#IncluideCharacter").empty();
				//$("LINK[href*='../Modules/Core/Character/Data/NUI/Main.css']").remove();
			}
		}
	});

	Player.SetMajorSkills = function(List, Locale, Points) 
	{
		var DivTarget = $("#MajorSkills")
		TotalPoints = Points
		var NegativePoints
		var Div = "";

		for (var _ in List) 
		{
			if (List[_].Name == $("input[name='Ocuppations']:checked").val()) 
			{
				for (var __ in List[_].MajorSkills)
				{
					Div += `<label>
								<span class="MajorSkills-Item">
									<p>` + List[_].MajorSkills[__].Label + `</p>
									<p class="Right">` + List[_].MajorSkills[__].Level +`</p><p class="Right">` + Locale.level + `</p>
								</span>
							</label>`;
				}

				NegativePoints = List[_].PointsCost
			}
		}

		DivTarget.html(Div);

		TotalPoints = TotalPoints - NegativePoints
		$("#PointsSpend").html(TotalPoints);

		$("input[name='Ocuppations']").change(function()
		{
			TotalPoints = Points
			var Div = "";

			for (var _ in List) 
			{
				if (List[_].Name == $("input[name='Ocuppations']:checked").val()) 
				{
					for (var __ in List[_].MajorSkills)
					{
						Div += `<label>
								<span class="MajorSkills-Item">
									<p>` + List[_].MajorSkills[__].Label + `</p>
									<p class="Right">` + List[_].MajorSkills[__].Level +`</p><p class="Right">` + Locale.level + `</p>
								</span>
							</label>`;
					}

					NegativePoints = List[_].PointsCost
				}
			}

			DivTarget.html(Div);

			TotalPoints = TotalPoints - NegativePoints

			for (var _ in ChosenTraits) 
			{
				//console.log(_, ChosenTraits[_])
				for (var __ in ChosenTraits[_])
				{
					if (_ == "Positive")
					{
						TotalPoints = TotalPoints - ChosenTraits[_][__].Points
					}
					else if (_ == "Negative")
					{
						TotalPoints = TotalPoints + ChosenTraits[_][__].Points
					}
				}
				//TotalPoints = TotalPoints - ChosenTraits[_].Points
			}

			$("#PointsSpend").html(TotalPoints);

		});
	}

	Player.AddTrait = function()
	{
		$("#AddTrait").click(function()
		{
			if (typeof $("input[name='Traits']:checked").val() != "undefined")
			{
				//console.log(TotalPoints)
				//if (TotalPoints > 0)
				//{
					for (var _ in AvailableTraits)
					{
						for (var __ in AvailableTraits[_])
						{
							if (AvailableTraits[_][__].Name == $("input[name='Traits']:checked").val())
							{
								//if (TotalPoints >= List[_][__].Points)
								//{
								if (_ == "Positive")
								{
									TotalPoints = TotalPoints - AvailableTraits[_][__].Points
								}
								else if (_ == "Negative")
								{
									TotalPoints = TotalPoints + AvailableTraits[_][__].Points
									
								}

								//ChosenTraits[_].push(List[_][__])
								ChosenTraits[_][__] = AvailableTraits[_][__]

								//console.log(ChosenTraits[_][__])
								Player.DeleteTraits(AvailableTraits, AvailableTraits[_][__].Name, AvailableTraits[_][__].Counter);

								Player.UpdateAvailableTraits();
								Player.UpdateChosenTraits();

								Player.TooltipsDetection();
								///Player.Select();
									
								//}
							}
						}
					}
				//}
			}

			$("#PointsSpend").html(TotalPoints);
		})
	}

	Player.RemoveTrait = function(List)
	{
		$("#RemoveTrait").click(function()
		{
			if (typeof $("input[name='ChosenTraits']:checked").val() != "undefined")
			{

				for (var _ in ChosenTraits)
				{
					for (var __ in ChosenTraits[_])
					{
						if (ChosenTraits[_][__].Name == $("input[name='ChosenTraits']:checked").val())
						{
							if (_ == "Positive")
							{
								TotalPoints = TotalPoints + ChosenTraits[_][__].Points
							}
							else if (_ == "Negative")
							{
								TotalPoints = TotalPoints - ChosenTraits[_][__].Points
								
							}

							var TargetTrait = ChosenTraits[_][__]
						}
					}
				}

				//console.log(TargetTrait.Name, TargetTrait.Counter)

				for (var _ in CacheTraits)
				{
					for (var __ in CacheTraits[_])
					{
						//console.log(_, __, CacheTraits[_][__].Name)
						if (CacheTraits[_][__].Name == TargetTrait.Name || CacheTraits[_][__].Name == TargetTrait.Counter)
						{
							//console.log(CacheTraits[_][__].Name)
							AvailableTraits[_][__] = CacheTraits[_][__]

							delete ChosenTraits[_][__]


						}
					}
				}

				
				Player.UpdateAvailableTraits();
				Player.UpdateChosenTraits();

				Player.TooltipsDetection();

				$("#PointsSpend").html(TotalPoints);
			}
		})
	}

	Player.UpdateChosenTraits = function()
	{	
		var DivTarget = $("#ChosenTrait");
		var Div = "";
		var Symbol
		

		for (var _ in ChosenTraits)
		{
			if (_ == "Positive")
			{
				Symbol = "+"
			}
			else if (_ == "Negative")
			{
				Symbol = "-"
			}

			for (var __ in ChosenTraits[_])
			{
				//console.log(_, __, ChosenTraits[_][__])
				Div += `<label>
							<input type="radio" name="ChosenTraits" value=`+ ChosenTraits[_][__].Name +`>
							<span class="Traits-`+ _ +`-Item Tooltip">
								<p>`+ ChosenTraits[_][__].Label +`</p>
								<p class="Right">`+ Symbol + ChosenTraits[_][__].Points +` Points</p>
								<span>
									<p>`+ ChosenTraits[_][__].Description +`</p>
								</span>
							</span>
						</label>`
			}
		}

		DivTarget.html(Div);
	}

	Player.UpdateAvailableTraits = function() 
	{
		for (var _ in AvailableTraits)
		{
			var DivTarget = $("#"+ _ +"Traits");
			var Div = ""
			var Symbol
			if (_ == "Positive")
			{
				Symbol = "-"
			}
			else if (_ == "Negative")
			{
				Symbol = "+"
			}

			for (var __ in AvailableTraits[_])
			{
				Div += `<label>
							<input type="radio" name="Traits" value=`+ AvailableTraits[_][__].Name +`>
							<span class="Traits-`+ _ +`-Item Tooltip">
								<p>`+ AvailableTraits[_][__].Label +`</p>
								<p class="Right">`+ Symbol + AvailableTraits[_][__].Points +` Points</p>
								<span>
									<p>`+ AvailableTraits[_][__].Description +`</p>
								</span>
							</span>
						</label>`
			}

			DivTarget.html(Div);
		}
	}

	Player.Next = function()
	{
		$("#Next").click(function()
		{
			console.log("next")
			if (TotalPoints >= 0) 
			{
				var gender = ["mp_m_freemode_01", "mp_f_freemode_01"];
				var defaultGender = gender[Math.floor(Math.random() * gender.length)];
				var Div = "";

				if (defaultGender == "mp_m_freemode_01")
				{
					Div =  `<option value="mp_m_freemode_01" selected>Male</option>
							<option value="mp_f_freemode_01">Female</option>`;
				}
				else
				{
					Div =  `<option value="mp_m_freemode_01">Male</option>
							<option value="mp_f_freemode_01" selected>Female</option>`;
				}

				Div = `<select>`+ Div +`</select>`
				$("#Gender").html(Div)

				$.post('http://zombieoutbreak/Player:Next', JSON.stringify({
					model : defaultGender
				}));


				Player.SetAppearance(defaultGender);

				$.post('http://zombieoutbreak/Player:UpdateAppearance', JSON.stringify({
					skin : parseInt($('option:selected', "#Skin").val()),
					face : parseInt($('option:selected', "#Face").val()),
					hair : parseInt($('option:selected', "#Hair").val()),
					haircolor : parseInt($('option:selected', "#HairColor").val()),
					eyes : parseInt($('option:selected', "#Eyes").val()),
					eyebrows : parseInt($('option:selected', "#Eyebrows").val()),
					beards : parseInt($('option:selected', "#Beards").val()),
					chest : parseInt($('option:selected', "#Chest").val()),
					hat : parseInt($('option:selected', "#Hat").val()),
					glasses : parseInt($('option:selected', "#Glasses").val()),
					top : parseInt($('option:selected', "#Tshirt").val()),
					pants : parseInt($('option:selected', "#Pants").val()),
					shoes : parseInt($('option:selected', "#Shoes").val())
				}));
				

				$("#OccupationsAndTraits").hide();
				$("#CustomizeCharacter").show();
			}
			else
			{
				var Div = `<div class="Message-Background">
								<div class="Message">
									<button id="CloseMessage" onclick="this.parentElement.parentElement.style.display='none';">Close</button> 
									<p class="Font-Roboto">WARNING!</p>
									<br>
									<p class="Font-Roboto">You don't have enough points to continue.</p>
								</div>
							</div>`

				$("#IncluideCharacter").append(Div);
			}
		})
	}

	Player.UpdateGender = function()
	{

		$("#Gender").click(function() {
			var model = $('option:selected', this).val()

			$.post('http://zombieoutbreak/Player:UpdateModel', JSON.stringify({
				model : model
			}));

			var Div = "";
			if (model == "mp_m_freemode_01") {
				Div =  `<option value="mp_m_freemode_01" selected>Male</option>
						<option value="mp_f_freemode_01">Female</option>`;
			} else {
				Div =  `<option value="mp_m_freemode_01">Male</option>
						<option value="mp_f_freemode_01" selected>Female</option>`;
			}

			Div = `<select>`+ Div +`</select>`;
			$("#Gender").html(Div);

			Player.SetAppearance(model);

			$.post('http://zombieoutbreak/Player:UpdateAppearance', JSON.stringify({
				skin : parseInt($('option:selected', "#Skin").val()),
				face : parseInt($('option:selected', "#Face").val()),
				hair : parseInt($('option:selected', "#Hair").val()),
				haircolor : parseInt($('option:selected', "#HairColor").val()),
				eyes : parseInt($('option:selected', "#Eyes").val()),
				eyebrows : parseInt($('option:selected', "#Eyebrows").val()),
				beards : parseInt($('option:selected', "#Beards").val()),
				chest : parseInt($('option:selected', "#Chest").val()),
				hat : parseInt($('option:selected', "#Hat").val()),
				glasses : parseInt($('option:selected', "#Glasses").val()),
				top : parseInt($('option:selected', "#Tshirt").val()),
				pants : parseInt($('option:selected', "#Pants").val()),
				shoes : parseInt($('option:selected', "#Shoes").val())
			}));

		});
	}

	Player.UpdateAppearance = function()
	{
		var Select = `#Skin, #Face, #Hair, #HairColor, #Eyes, #Eyebrows, #Beards, #Chest, #Hat, #Glasses, #Tshirt, #Pants, #Shoes`

		$(Select).click(function() {
			$.post('http://zombieoutbreak/Player:UpdateAppearance', JSON.stringify({
				skin : parseInt($('option:selected', "#Skin").val()),
				face : parseInt($('option:selected', "#Face").val()),
				hair : parseInt($('option:selected', "#Hair").val()),
				haircolor : parseInt($('option:selected', "#HairColor").val()),
				eyes : parseInt($('option:selected', "#Eyes").val()),
				eyebrows : parseInt($('option:selected', "#Eyebrows").val()),
				beards : parseInt($('option:selected', "#Beards").val()),
				chest : parseInt($('option:selected', "#Chest").val()),
				hat : parseInt($('option:selected', "#Hat").val()),
				glasses : parseInt($('option:selected', "#Glasses").val()),
				top : parseInt($('option:selected', "#Tshirt").val()),
				pants : parseInt($('option:selected', "#Pants").val()),
				shoes : parseInt($('option:selected', "#Shoes").val())
			}));
		});
	}

	Player.Back = function()
	{
		$("#Back").click(function()
		{
			$.post('http://zombieoutbreak/Player:Back', JSON.stringify({

			}));
			$("#OccupationsAndTraits").show();
			$("#CustomizeCharacter").hide();
		})
	}

	Player.Play = function()
	{
		$("#Play").click(function()
		{
			$.post('http://zombieoutbreak/Player:Play', JSON.stringify({
				firstname : $("#FirstName").val(),
				lastname : $("#LastName").val(),
				model : $('option:selected', "#Gender").val(),
				occupation : $("input[name='Ocuppations']:checked").val(),
				skin : parseInt($('option:selected', "#Skin").val()),
				face : parseInt($('option:selected', "#Face").val()),
				hair : parseInt($('option:selected', "#Hair").val()),
				haircolor : parseInt($('option:selected', "#HairColor").val()),
				eyes : parseInt($('option:selected', "#Eyes").val()),
				eyebrows : parseInt($('option:selected', "#Eyebrows").val()),
				beards : parseInt($('option:selected', "#Beards").val()),
				chest : parseInt($('option:selected', "#Chest").val()),
				hat : parseInt($('option:selected', "#Hat").val()),
				glasses : parseInt($('option:selected', "#Glasses").val()),
				tshirt : parseInt($('option:selected', "#Tshirt").val()),
				pants : parseInt($('option:selected', "#Pants").val()),
				shoes : parseInt($('option:selected', "#Shoes").val())
			}));
			setTimeout(function() {
            	$('#IncluideCharacter').fadeOut(1000);
            }, 250);
		})
	}

});