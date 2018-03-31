local t = Def.ActorFrame {}

local minanyms = {
	-- the logorrhea of yore
	"Irate Platypusaurusean",
	"Pancreatic_MilkTrombone",
	"Fire_Elevator",
	"Starchy DarkButter",
	"Unememorabelia Bedelia",
	"Cheezits 'N Rice",
	"Scalding brain fart",
	"Luridescence",
	"Frothy Loin",
	"Ministry of Silly Steps",
	
	-- the profile names of yore
	"mystic memer",
	"orange hands",
	"Sir Smauggy",
	"ScroogeMcdoot",
	"The King In The Hall Under The Mountain Amidst The Dragon's Lair",
	"Just Mash",
	"Just 5mash",
	"Player 1",
	"Minametra",
	"Noodlesim",
	"Default Profile",
	"Mina (backup)",
	"Mina",
	"orange hands (backup)",
	"Don Eon",
	"Tromwelskintherintherin",
	"StraitStrix",
	"UmbralChord",
	"NoSaucierMagic",
	"EgomaniaCircus",
	"stepmania bakery hero",

	-- the nightly builds of yore
	"AVAST YE STEPMATEY",
	"ALPHA DINGOBABY",
	"TOWEL FOR A PHOENIX",
	"MAYBE ITS RASPBELLINE",
	"FREE MARKOV",
	"BARK ON MOONSTRING",
	"CARAMEL CANDELABRABELLUM",
	"PATENTED TOILET MYTHOS",
	"MOONAR LANDING - THE RETURWN",
	"ORANGE BLOSSOM SPECIAL",
	"SERENADE UNDER PORCUPINE",
	"SERRATED HAMBURGER",
	"INTERGALACTIC TURKEY",
	"TURTLE LOVE",
	"BICYCLE LAUGH",
	"GODLY PLATE OF THE WHALE",
	"PURPLE PARKING METERSTICK",
	"BROCCOLI MOISTURIZER",
	"SLIGHTLY ALTERED COMPILER FLAG",
	"PARTIALLY Q-TIP KIWI",
	"POTATO PAINTING COURTESY",

	-- Ye olde names
	"Shoeeater9000",
	"Thirdeye",
	"Otiose Velleity",
	"MoreLikeYourMomesis",
	"RofflesTheCat",
	"MinaEnnui",
	"FishnaciousGrace",
	"Forp",
	"Forp II",
	"Forp III The Unavenged",
	"Lady Mericicelourne Ciestrianna De'anstrasvazanne",
	"Caecita",
	"Tempestress",
	"unself",
	"DefinitelyNotMina",
	"KillerClown",
	"Quirky Colonel Kibbles",
	"2c",
	"FroggerNanny",
	"FroggyNanner",
	"Aeristacicianistriaza",
	"FroggerNanny The Unfrogged",
	"ScatPlayKatarina",
	"Ferric Chloride Matter",
	"Bananatiger",

	-- Etternal Love
	"agoramachina",
	"tux",
}

math.random()

t[#t+1] = Def.ActorFrame {
  InitCommand=cmd(Center),
	LoadActor("woop") .. {
		OnCommand=cmd(zoomto,SCREEN_WIDTH,150;diffusealpha,0;linear,1;diffusealpha,1;sleep,.05;linear,2;diffusealpha,0)
	},
	Def.ActorFrame {
	  OnCommand=cmd(playcommandonchildren,"ChildrenOn"),
	  ChildrenOnCommand=cmd(diffusealpha,0;sleep,0.25;linear,0.1;diffusealpha,1),
		LoadFont("_wendy small") .. {
			Text=getThemeName(),
			InitCommand=cmd(y,-24),
			OnCommand=cmd(sleep,.1;linear,3;diffuse,getMainColor('negative');diffusealpha,0)
		},
		LoadFont("_wendy small") .. {
			Text="Created by " .. minanyms[math.random(#minanyms)],
			InitCommand=cmd(y,16;zoom,0.25;maxwidth,SCREEN_WIDTH),
			OnCommand=cmd(sleep,.1;linear,3;diffuse,getMainColor('negative');diffusealpha,0)
		},
	}
}

return t
