local gc = Var("GameCommand")

return Def.ActorFrame {
	LoadFont("_wendy small") .. {
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText()),
		OnCommand=cmd(halign,0),
		GainFocusCommand=cmd(zoom,0.45;diffusealpha,1;diffuse,getRandomColor()),
		LoseFocusCommand=cmd(diffuse,getMainColor('positive');diffusealpha,0.7;zoom,0.3),
 	}
}

