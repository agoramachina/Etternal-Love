local t = Def.ActorFrame{}

t[#t+1] = LoadFont("_wendy small") .. {
	Name = "currentTime",
	InitCommand=cmd(xy,SCREEN_WIDTH-5,SCREEN_BOTTOM;halign,1;valign,1;zoom,0.19)
}

t[#t+1] = LoadFont("_wendy small") .. {
	Name = "SessionTime",
	InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_BOTTOM-5;halign,0.5;valign,1;zoom,0.19)
}

local function Update(self)
	local year = Year()
	local month = MonthOfYear()+1
	local day = DayOfMonth()
	local hour = Hour()
	local minute = Minute()
	local second = Second()
	self:GetChild("currentTime"):settextf("%04d-%02d-%02d %02d:%02d:%02d",year,month,day,hour,minute,second)
	
	local sessiontime = GAMESTATE:GetSessionTime()
	self:GetChild("SessionTime"):settextf("Session Time: "..SecondsToHHMMSS(sessiontime))
	self:diffuse(getMainColor('positive'))
end

t.InitCommand=cmd(SetUpdateFunction,Update)
return t