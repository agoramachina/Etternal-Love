--- vvv ORIGINAL vvv
---return Def.Quad {
---	InitCommand=cmd(xy,SCREEN_CENTER_X,SCREEN_CENTER_Y;zoomto,SCREEN_WIDTH,SCREEN_HEIGHT);
---	OnCommand=cmd(diffuse,color("0,0,0,1");sleep,0.1;linear,0.1;diffusealpha,0);
--- };

local image = THEME:GetPathB("", "ScreenGameplay in/")--- ThemePrefs.Get("VisualTheme")

local t = Def.ActorFrame{

	Def.Quad{
		InitCommand=cmd(diffuse,Color.Black; Center; FullScreen),
		OnCommand=cmd(sleep,1.4; accelerate,0.6; diffusealpha,0)
	},

	LoadActor(image.."")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.4; diffuse, GetMainColor('highlight'); Center; rotationz,10; diffusealpha,0; zoom,0; diffusealpha,0.9; linear,0.6; rotationz,0; zoom,1.1; diffusealpha,0)
	},
	LoadActor(image.."")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.4; diffuse, GetMainColor('highlight'); Center; rotationy,180; rotationz,-10; diffusealpha,0; zoom,0.2; diffusealpha,0.8; decelerate,0.6; rotationz,0; zoom,1.3; diffusealpha,0)
	},
	LoadActor(image.."")..{
		InitCommand=cmd(diffusealpha,0),
		OnCommand=cmd(sleep,0.4; diffuse, GetMainColor('highlight'); Center; rotationz,10; diffusealpha,0; zoom,0; diffusealpha,1; decelerate,0.8; rotationz,0; zoom,0.9; diffusealpha,0)
	}
}
return t