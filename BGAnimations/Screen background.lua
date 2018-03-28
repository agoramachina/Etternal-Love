
-- this variable will be used within the scope of this file like (index+1) and (index-1)
-- to continue to diffuse each sprite as we shift through the colors available in SL.Colors
--local index = 1

local file = THEME:GetPathB("", "_shared background normal/" .. "Arrows" .. ".png")  --fix this: player color option selection  --agoramachina

-- this variable will be used within the scope of this file like (index+1) and (index-1)
-- to continue to diffuse each sprite as we shift through the colors available in SL.Colors
--local index = getRandomColor()

-- time in seconds for the first NewColor (which is triggered from AF's InitCommand)
-- should be 0 so that children sprites get colored properly immediately; we'll
-- change this variable in the AF's OnCommand so that color-shifts tween appropriately
local delay = 0

local af = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:FullScreen():Center():diffuse( Color.Black ) end,
		BackgroundImageChangedMessageCommand=function(self)
			THEME:ReloadMetrics()
---			ActiveColorIndex = ThemePrefs.Get("SimplyLoveColor")
			self:linear(1):diffuse(Color.Black )

		end,
	}
}

-- --------------------------------------------------------
-- non-RainbowMode (normal) background

local file_info = {
	ColorRGB = {2,1,2,1,2,1,2,2,1,2},
	diffusealpha = {0.05,0.2,0.1,0.1,0.1,0.1,0.1,0.05,0.1,0.1},
	xy = {0,40,80,120,200,280,360,400,480,560},
	texcoordvelocity = {{0.03,0.01},{0.03,0.02},{0.03,0.01},{0.02,0.02},{0.03,0.03},{0.02,0.02},{0.03,0.01},{-0.03,0.01},{0.05,0.03},{0.03,0.04}}
}

local t = Def.ActorFrame {
	InitCommand=function(self)
	--	if 'RainbowMode' == true then

	--		self:visible(false)
	--	else
			self:diffusealpha(0)
	--	end
	end,
	OnCommand=cmd(accelerate,0.8; diffusealpha,1),
	BackgroundImageChangedMessageCommand=function(self)
	--	if not 'RainbowMode' == true then

			self:visible(true):linear(0.6):diffusealpha(1)
	--	else
	--		self:linear(0.6):diffusealpha(0):queuecommand("Hide")
	--	end
	end,
	HideCommand=function(self) self:visible(false) end,
}

for i=1,10 do
	t[#t+1] = Def.Sprite {
		Texture=file,
		InitCommand=cmd(diffuse, getEtternalColor( file_info.ColorRGB[i] ) ),  ---fix this --agoramachina
		ColorSelectedMessageCommand=cmd(linear, 0.5; diffuse, getMainColor( file_info.ColorRGB[i] ); diffusealpha, file_info.diffusealpha[i] ),

		OnCommand=cmd(zoom,1.3; xy, file_info.xy[i], file_info.xy[i]; customtexturerect,0,0,1,1;
			texcoordvelocity, file_info.texcoordvelocity[i][1], file_info.texcoordvelocity[i][2]; diffusealpha, file_info.diffusealpha[i] ),
		BackgroundImageChangedMessageCommand=function(self)
			local new_file = THEME:GetPathB("", "_shared background normal/" .. "Arrows" .. ".png")
			self:Load(new_file)
		end
	}
end

af[#af+1] = t

return af