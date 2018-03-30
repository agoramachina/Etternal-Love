t = Def.ActorFrame{}

local frameX = THEME:GetMetric("ScreenTitleMenu","ScrollerX")-10
local frameY = THEME:GetMetric("ScreenTitleMenu","ScrollerY")

t[#t+1] = Def.Quad{
	InitCommand=cmd(draworder,-300;xy,frameX,frameY;zoomto,SCREEN_WIDTH,160;halign,0;diffuse,getMainColor('highlight');diffusealpha,0.15;diffusetopedge,color("0,0,0,0"))
}

t[#t+1] = Def.Quad{
	InitCommand=cmd(draworder,-300;xy,frameX,frameY-100;zoomto,SCREEN_WIDTH,160;halign,0;diffuse,getMainColor('highlight');diffusealpha,0.15;diffusebottomedge,color("0,0,0,0"))
}

t[#t+1] = LoadFont("_wendy small") .. {
	InitCommand=cmd(xy,10,frameY-180;zoom,0.65;valign,1;halign,0;diffuse,getDifficultyColor("Difficulty_Couple")),
	OnCommand=function(self)
		self:settext(getThemeName())
	end,
}

t[#t+1] = LoadActor(THEME:GetPathG("","_ring")) .. {
	InitCommand=cmd(xy,capWideScale(get43size(SCREEN_WIDTH-10),SCREEN_WIDTH-256),frameY-180;diffuse,getDifficultyColor("Difficulty_Couple")diffusealpha,1;baserotationx,420)
}

t[#t+1] = LoadActor(THEME:GetPathG("","dance")) .. {

	--- large center --agoramachina
	--InitCommand=cmd(xy,capWideScale(get43size(SCREEN_WIDTH/2),SCREEN_WIDTH/2),frameY-50;diffusealpha,.10;zoom,1.25)
	--- bottom stretchx
	InitCommand=cmd(xy,capWideScale(get43size(SCREEN_WIDTH/2),SCREEN_WIDTH/2),frameY+120;diffusealpha,.10;zoomy,0.50;zoomx,.60)
}
return t