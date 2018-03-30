local defaultConfig = {
	ScreenFilter = 0,
	JudgeType = 1,
	AvgScoreType = 0,
	GhostScoreType = 1,
	DisplayPercent = true,
	TargetTracker = true,
	TargetGoal = 93,
	TargetTrackerMode = 0,
	JudgeCounter = true,
	ErrorBar = true,
	PlayerInfo = true,
	FullProgressBar = true,
	MiniProgressBar = true,
	LaneCover = 0, -- soon to be changed to: 0=off, 1=sudden, 2=hidden
	LaneCoverHeight = 10,
	NPSDisplay = true,
	NPSGraph = false,
	CBHighlight = false,
	OneShotMirror = false,
	JudgmentText = true,
	ReceptorSize = 100,
	BackgroundType = 1,
	ProgressBarPos = 1, --moved from theme options into here, 1 = top; 0 = bottom
	CustomizeGameplay = false,
	GameplayXYCoordinates = {
		JudgeX = 0,
		JudgeY = 50,
		ComboX = 30,
		ComboY = 0,
		ErrorBarX = SCREEN_CENTER_X,
		ErrorBarY = SCREEN_CENTER_Y -202,
		TargetTrackerX = SCREEN_CENTER_X-300,
		TargetTrackerY = 150,
		MiniProgressBarX = SCREEN_CENTER_X,
		MiniProgressBarY = SCREEN_CENTER_Y + 34,
		FullProgressBarX = SCREEN_CENTER_X,
		FullProgressBarY = 20,
		JudgeCounterX = -40,
		JudgeCounterY = -40,
		DisplayPercentX = SCREEN_CENTER_X-375,
		DisplayPercentY = -280, 
		NPSDisplayX = 10,
		NPSDisplayY = SCREEN_BOTTOM - 170,
		NPSGraphX = 0,
		NPSGraphY = SCREEN_BOTTOM - 160,
		NotefieldX = 0,
		NotefieldY = 15,
		---bpmdisplay/songinfo/rate pos is in WifeJudgmentSpotting.lua --agoramachina

	},
	GameplaySizes = {
		JudgeZoom = 0.9,
		ComboZoom = 0.6,
		ErrorBarWidth = 240,
		ErrorBarHeight = 22,
		TargetTrackerZoom = 0.4,
		FullProgressBarWidth = 1.0,
		FullProgressBarHeight = 1.0,
		DisplayPercentZoom = 2.0,
		NPSDisplayZoom = 0.4,
		NPSGraphWidth = 1.0,
		NPSGraphHeight = 1.0,
		NotefieldWidth = 1.0,
		NotefieldHeight = 1.0,
	},
}

playerConfig = create_setting("playerConfig", "playerConfig.lua", defaultConfig, -1)
playerConfig:load()

function LoadProfileCustom(profile, dir)
	local players = GAMESTATE:GetEnabledPlayers()
	local playerProfile
	local pn
	for k,v in pairs(players) do
		playerProfile = PROFILEMAN:GetProfile(v)
		if playerProfile:GetGUID() == profile:GetGUID() then
			pn = v
		end;
	end; 

	if pn then
		playerConfig:load(pn_to_profile_slot(pn))
	end
end

function SaveProfileCustom(profile, dir)
	local players = GAMESTATE:GetEnabledPlayers()
	local playerProfile
	local pn
	for k,v in pairs(players) do
		playerProfile = PROFILEMAN:GetProfile(v)
		if playerProfile:GetGUID() == profile:GetGUID() then
			pn = v
		end;
	end; 

	if pn then
		playerConfig:set_dirty(pn_to_profile_slot(pn))
		playerConfig:save(pn_to_profile_slot(pn))
	end
end
