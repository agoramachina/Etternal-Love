
-- change this to allow for player visual theme options --agoramachina
local file = THEME:GetPathB("", "_shared background normal/" .. "Arrows" .. ".png")  --fix this: player color option selection  --agoramachina

-- time in seconds for the first NewColor (which is triggered from AF's InitCommand)
-- should be 0 so that children sprites get colored properly immediately; we'll
-- change this variable in the AF's OnCommand so that color-shifts tween appropriately
local delay = 0

local af = Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:FullScreen():Center():diffuse( Color.Black ) end,
		BackgroundImageChangedMessageCommand=function(self)
			THEME:ReloadMetrics()
			self:linear(1):diffuse(Color.Black )
		end,
	}
}

-- --------------------------------------------------------
-- non-RainbowMode (normal) background

local file_info = {
	ColorRGB = {getMainColor('highlight'),getMainColor('positive'),getMainColor('highlight'),getMainColor('positive'),getMainColor('highlight'),getMainColor('positive'),getMainColor('highlight'),getMainColor('highlight'),getMainColor('positive'),getMainColor('highlight')},
	diffusealpha = {0.05,0.2,0.1,0.1,0.1,0.1,0.1,0.05,0.1,0.1},
	xy = {0,40,80,120,200,280,360,400,480,560},
	texcoordvelocity = {{0.03,0.01},{0.03,0.02},{0.03,0.01},{0.02,0.02},{0.03,0.03},{0.02,0.02},{0.03,0.01},{-0.03,0.01},{0.05,0.03},{0.03,0.04}}
}

local t = Def.ActorFrame {
	InitCommand=function(self)
			self:diffusealpha(0)
	end,
	OnCommand=function(self)
		self:accelerate(0.8):diffusealpha(1)
	end,
	BackgroundImageChangedMessageCommand=function(self)
			self:visible(true):linear(0.6):diffusealpha(1)
	end,
	HideCommand=function(self) self:visible(false) end,
}

for i=1,10 do
	t[#t+1] = Def.Sprite {
		Texture=file,
		InitCommand=function(self)
			self:diffuse(file_info.ColorRGB[i])
		end,
			texcoordvelocity, file_info.texcoordvelocity[i][1], file_info.texcoordvelocity[i][2]; diffusealpha, file_info.diffusealpha[i] ),
		BackgroundImageChangedMessageCommand=function(self)
			local new_file = THEME:GetPathB("", "_shared background normal/" .. "Arrows" .. ".png")
			self:Load(new_file)
		end
	}
end

af[#af+1] = t




return af