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

return t