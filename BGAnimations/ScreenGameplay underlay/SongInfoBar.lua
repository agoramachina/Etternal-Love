return Def.ActorFrame{

	-- Song Completion Meter
	Def.ActorFrame{
		Name="SongMeter",
		InitCommand=cmd(xy, _screen.cx, 20 ),

		Def.SongMeterDisplay{
			StreamWidth=_screen.w/2-10,
			Stream=Def.Quad{ 
				InitCommand=cmd(zoomy,18; diffuse,getMainColor("highlight"))
			}
		},

		Border( _screen.w/2-10, 22, 2, color('White')),
	},

	-- Song Title
	LoadFont("Common normal")..{
		Name="SongTitle",
		InitCommand=cmd(zoom,0.5; shadowlength,0.6; maxwidth, _screen.w/2.5 - 10; xy, _screen.cx, 20 ),
		CurrentSongChangedMessageCommand=cmd(playcommand, "Update"),
		UpdateCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			self:settext( song and song:GetDisplayFullTitle() or "" )
		end
	}
}