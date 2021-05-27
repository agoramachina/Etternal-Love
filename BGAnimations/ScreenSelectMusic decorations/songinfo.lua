local update = false
local t = Def.ActorFrame{
	BeginCommand=function(self)
		self:queuecommand("Set")
	end,
	OffCommand=function(self)
		self:bouncebegin(0.2):xy(-500,0) -- visible(false) doesn't seem to work with sleep
	end,
	OnCommand=function(self)
		self:bouncebegin(0.2):xy(0,0)
	end,
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
	TabChangedMessageCommand=function(self)
		self:queuecommand("Set")
	end,
	PlayerJoinedMessageCommand=function(self)
		self:queuecommand("Set")
	end

}


t[#t+1] = Def.Sprite {
	InitCommand=function(self)
		self:x(8):y(58):halign(0):valign(0):scaletoclipped(capWideScale(get43size(384),384),capWideScale(get43size(120),120))
	end,

	SetMessageCommand=function(self)
		if update then
			local top = SCREENMAN:GetTopScreen()
			if top:GetName() == "ScreenSelectMusic" or top:GetName() == "ScreenNetSelectMusic" then
				local song = GAMESTATE:GetCurrentSong()
				local group = top:GetMusicWheel():GetSelectedSection()
				if song then
					local bnpath = GAMESTATE:GetCurrentSong():GetBannerPath()
					if not bnpath then
						bnpath = THEME:GetPathG("Common", "fallback banner")
					end
					self:LoadBackground(bnpath)
				else
					local bnpath = SONGMAN:GetSongGroupBannerPath(SCREENMAN:GetTopScreen():GetMusicWheel():GetSelectedSection())
					if not bnpath or bnpath == "" then
						bnpath = THEME:GetPathG("Common", "fallback banner")
					end
					self:LoadBackground(bnpath)
				end
			end
		end
		self:scaletoclipped(capWideScale(get43size(384),384),capWideScale(get43size(120),120))
	end,
	CurrentSongChangedMessageCommand=function(self)
		self:queuecommand("Set")
	end
}


--remove this --agoramachina
--[[
function Border(width, height, bw)
	return Def.ActorFrame {
		Def.Quad {
			InitCommand=function(self)
				self:zoomto(width-2*bw, height-2*bw):MaskSource(true)
			end
		},
		Def.Quad {
			InitCommand=function(self)
				self:zoomto(width,height): MaskDest()
			end
		},
		Def.Quad {
			InitCommand=function(self)
				self:diffusealpha(0):clearzbuffer(true)
			end
		},
	}
end;
--]]


--[[
--- hacky fix to take care of banner border issues on screenselectmusic remove this --agoramachina  
--top
t[#t+1] = Def.Quad{
	InitCommand=function(self)
		self:xy(8,58):zoomto(capWideScale(get43size(384),384),1):halign(0):diffuse(color("0,0,0,.9")):diffusetopedge(color("0,0,0,.8"))
	end
}
--left
t[#t+1] = Def.Quad{
	InitCommand=function(self)
		self:xy(8,118):zoomto(1,120):halign(0):diffuse(color("0,0,0,1"))
	end
}
--]]


return t