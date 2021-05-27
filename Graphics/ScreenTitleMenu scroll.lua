local gc = Var("GameCommand")

return Def.ActorFrame {
	LoadFont("_wendy small") .. {
		Text=THEME:GetString("ScreenTitleMenu",gc:GetText()),
		OnCommand=function(self)
			self:halign(0)
		end,
		GainFocusCommand=function(self)
			self:zoom(0.45):diffusealpha(1):diffuse(getRandomColor())
		end,
		LoseFocusCommand=function(self)
			self:diffuse(getMainColor('positive')):diffusealpha(0.7):zoom(0.3)
		end,
 	}
}

