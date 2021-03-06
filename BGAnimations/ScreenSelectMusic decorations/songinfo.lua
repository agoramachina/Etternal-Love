local update = false
local t = Def.ActorFrame{
	BeginCommand=cmd(queuecommand,"Set"),
	OffCommand=cmd(bouncebegin,0.2;xy,-500,0), -- visible(false) doesn't seem to work with sleep
	OnCommand=cmd(bouncebegin,0.2;xy,0,0),
	SetCommand=function(self)
		self:finishtweening()
		if getTabIndex() == 0 then
			self:queuecommand("On")
			update = true
		else 
			self:queuecommand("Off")
			update = false
		end
	end,
	TabChangedMessageCommand=cmd(queuecommand,"Set"),
	PlayerJoinedMessageCommand=cmd(queuecommand,"Set")

}


t[#t+1] = Def.Banner{
	InitCommand=cmd(x,8;y,58;halign,0;valign,0;scaletoclipped,capWideScale(get43size(384),384),capWideScale(get43size(120),120)),

	SetMessageCommand=function(self)
		if update then
			local top = SCREENMAN:GetTopScreen()
			if top:GetName() == "ScreenSelectMusic" or top:GetName() == "ScreenNetSelectMusic" then
				local song = GAMESTATE:GetCurrentSong()
				local group = top:GetMusicWheel():GetSelectedSection()
				if song then
					self:LoadFromSong(song)
				elseif group then
					self:LoadFromSongGroup(group)
				end
			end
		end
		self:scaletoclipped(capWideScale(get43size(384),384),capWideScale(get43size(120),120))
	end,
	CurrentSongChangedMessageCommand=cmd(queuecommand,"Set")
}


--remove this --agoramachina
--[[
function Border(width, height, bw)
	return Def.ActorFrame {
		Def.Quad {
			InitCommand=cmd(zoomto, width-2*bw, height-2*bw;  MaskSource,true)
		},
		Def.Quad {
			InitCommand=cmd(zoomto,width,height; MaskDest)
		},
		Def.Quad {
			InitCommand=cmd(diffusealpha,0; clearzbuffer,true)
		},
	}
end;
--]]


--[[
--- hacky fix to take care of banner border issues on screenselectmusic remove this --agoramachina  
--top
t[#t+1] = Def.Quad{
	InitCommand=cmd(xy,8,58;zoomto,capWideScale(get43size(384),384),1;halign,0;diffuse,color("0,0,0,.9");diffusetopedge,color("0,0,0,.8"))
}
--left
t[#t+1] = Def.Quad{
	InitCommand=cmd(xy,8,118;zoomto,1,120;halign,0;diffuse,color("0,0,0,1"))
}
--]]


return t