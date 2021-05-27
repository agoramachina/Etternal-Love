local enabled = themeConfig:get_data().global.SongBGEnabled
local brightness = 0.4
local t = Def.ActorFrame{}

if enabled then
	t[#t+1] = LoadSongBackground()..{
		BeginCommand=function(self)
			self:scaletocover(0,0,SCREEN_WIDTH,SCREEN_BOTTOM)
			self:diffusealpha(brightness)
		end
	}
end

t[#t + 1] =
	Def.Sprite {
	Name = "Banner",
	OnCommand = function(self)
		self:x(SCREEN_CENTER_X):y(38):valign(0)
		self:scaletoclipped(capWideScale(get43size(336), 336), capWideScale(get43size(105), 105))
		local bnpath = GAMESTATE:GetCurrentSong():GetBannerPath()
		if not bnpath then
			bnpath = THEME:GetPathG("Common", "fallback banner")
		end
		self:LoadBackground(bnpath)
	end
}


return t
