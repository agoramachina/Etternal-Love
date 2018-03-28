local defaultConfig = {

	main = {
		enabled = "#820081", 
		highlight = "#C1006F", 
		negative = "#C1006F", 
	    positive = "#820081", 
	    frames = "#000111", 
	    disabled = "#656573"
	},

	clearType = {
		Clear = "#33aaff", 
		SDCB = "#656573", 
		Invalid = "#e61e25", 
	    BF = "#999999", 
	    MFC = "#66ccff", 
	    FC = "#66cc66", 
	    SDP = "#cc8800", 
	    WF = "#dddddd", 
	    MF = "#cc6666", 
	    NoPlay = "#656573", 
	    SDG = "#448844", 
	    PFC = "#eeaa00", 
	    Failed = "#e61e25", 
	    None = "#656573"
	},

	difficulty = {
		Hard = "#413AD0", 
		Challenge = "#0073FF", 
		Routine = "#52008E", 
		Difficulty_Beginner = "#FF003C",
		Difficulty_Challenge= "#0073FF",
    	Difficulty_Couple = "#ed0972", 
    	Difficulty_Hard = "#413AD0", 
	    Beginner = "#FF003C", 
	    Difficulty_Routine = "#52008E", 
	    Difficulty_Medium = "#8200A1", 
	    Difficulty_Edit = "#656573", 
	    Easy = "#C1006F", 
	    Difficulty_Easy = "#C1006F", 
	    Edit = "#656573", 
	    Couple = "#ed0972", 
	    Medium = "#8200A1"
	},

	difficultyVivid = {
		Hard = "#413AD0", 
		Challenge = "#0073FF", 
		Routine = "#52008E", 
	    Difficulty_Beginner = "#FF003C", 
	    Difficulty_Challenge = "#0073FF", 
	    Difficulty_Couple = "#ed0972", 
	    Difficulty_Hard = "#413AD0", 
	    Beginner = "#FF003C", 
	    Difficulty_Routine = "#52008E", 
	    Difficulty_Medium = "#8200A1", 
	    Difficulty_Edit = "#656573", 
	    Easy = "#C1006F", 
	    Difficulty_Easy = "#C1006F", 
	    Edit = "#656573", 
	    Couple = "#ed0972", 
	    Medium = "#8200A1"
	},

	grade = {
	    Grade_Tier01 = "#FFD200", 
	    Grade_Tier02 = "#0073FF",
	    Grade_Tier03 = "#413AD0",
	    Grade_Tier04 = "#8200A1",
	    Grade_Tier05 = "#C1006F", 
	    Grade_Tier06 = "#FF003C", 
	    Grade_Tier07 = "#555555", 
	    Grade_Tier08 = "#000000", 
	    Grade_Tier09 = "#000000",
	    Grade_Tier10 = "#000000", 
	    Grade_Tier11 = "#000000", 
	    Grade_Tier12 = "#000000", 
	    Grade_Tier13 = "#000000",
	    Grade_Tier14 = "#000000", 
	    Grade_Tier15 = "#000000", 
	    Grade_Tier16 = "#000000", 
	    Grade_Tier17 = "#000000", 
	    Grade_Failed = "#cdcdcd", 
	    Grade_None = "#656573"
	},

	judgment = { -- Colors of each Judgment types
		TapNoteScore_W1= "#99ccff", 
		TapNoteScore_W2= "#f2cb30", 
		TapNoteScore_W3= "#14cc8f", 
		TapNoteScore_W4= "#1ab2ff",
		TapNoteScore_W5= "#ff1ab3", 
		TapNoteScore_Miss= "#cc2929", 
		HoldNoteScore_Held= "#f2cb30", 
		HoldNoteScore_LetGo= "#cc2929"
	},

	songLength = {
		long = "#412AD0", 
		normal = "#FFFFFF", 
		marathon = "#C1006F"
	},
}

colorConfig = create_setting("colorConfig", "colorConfig.lua", defaultConfig,-1)
colorConfig:load()

--keys to current table. Assumes a depth of 2.
local curColor = {"",""}

function getTableKeys()
	return curColor
end

function setTableKeys(table)
	curColor = table 
end

function getEtternalColor(i)
eternalColor = {	
	    "#C1006F",
	    "#413AD0"
	}
	return color(etternalColor[i])
end

function getSimpleColor(i) --replace this w/ getEtternalColor --agoramachina
simpleColor = {
		"#FF3C23",
	    "#FF003C",
	    "#C1006F",
	    "#8200A1",
	    "#413AD0",
	    "#0073FF",
	    "#00ADC0",
	    "#5CE087",
	    "#AEFA44",
	    "#FFFF00",
	    "#FFBE00",
	    "#FF7D00"}
	return color(simpleColor[i])
end


function getRandomColor()
	rainbow = {
		"#FF3C23",
	    "#FF003C",
	    "#C1006F",
	    "#8200A1",
	    "#413AD0",
	    "#0073FF",
	    "#00ADC0",
	    "#5CE087",
	    "#AEFA44",
	    "#FFFF00",
	    "#FFBE00",
	    "#FF7D00"}
	return color(rainbow[math.random(12)])
end

function getMainColor(type)
	return color(colorConfig:get_data().main[type])
end

function getGradeColor (grade)
	return color(colorConfig:get_data().grade[grade]) or color(colorConfig:get_data().grade['Grade_None']);
end

function getDifficultyColor(diff)
	return color(colorConfig:get_data().difficulty[diff]) or color("#ffffff");
end

function getVividDifficultyColor(diff)
	return color(colorConfig:get_data().difficultyVivid[diff]) or color("#ffffff")
end

function offsetToJudgeColor(offset,scale)
	local offset = math.abs(offset)
	if not scale then
		scale = PREFSMAN:GetPreference("TimingWindowScale")
	end
	if offset <= scale*PREFSMAN:GetPreference("TimingWindowSecondsW1") then
		return color(colorConfig:get_data().judgment["TapNoteScore_W1"])
	elseif offset <= scale*PREFSMAN:GetPreference("TimingWindowSecondsW2") then
		return color(colorConfig:get_data().judgment["TapNoteScore_W2"])
	elseif offset <= scale*PREFSMAN:GetPreference("TimingWindowSecondsW3") then
		return color(colorConfig:get_data().judgment["TapNoteScore_W3"])
	elseif offset <= scale*PREFSMAN:GetPreference("TimingWindowSecondsW4") then
		return color(colorConfig:get_data().judgment["TapNoteScore_W4"])
	elseif offset <= scale*PREFSMAN:GetPreference("TimingWindowSecondsW5") then
		return color(colorConfig:get_data().judgment["TapNoteScore_W5"])
	else
		return color(colorConfig:get_data().judgment["TapNoteScore_Miss"])
	end
end

function byJudgment(judge)
	return color(colorConfig:get_data().judgment[judge])
end

function byDifficulty(diff)
	return color(colorConfig:get_data().difficulty[diff])
end

-- Colorized stuff
function ByMSD(x)
	if x then
		--return HSV(math.max(330 - (x/40)*250, -30), 0.9, 0.9)
		return HSV(math.max(95 - (x/40)*150, -50), 0.9, 0.9)
	end
	return HSV(0, 0.9, 0.9)
end

function ByMusicLength(x)
	if x then
		x = math.min(x,600)
		--return HSV(math.max(300 - (x/900)*250, -30), 0.9, 0.9)
		return HSV(math.max(95 - (x/900)*150, -50), 0.9, 0.9)
	end
	return HSV(0, 0.9, 0.9)
end
