return Def.ActorFrame{

	-- Song Completion Meter
	Def.ActorFrame{
		Name="SongMeter",
		InitCommand=function(self)
			self:xy(_screen.cx, 20)
		end,

		Def.SongMeterDisplay{
			StreamWidth=_screen.w/2-10,
			Stream=Def.Quad{ 
				InitCommand=function(self)
					self:zoomy(18):diffuse(getMainColor("highlight"))
				end
			}
		},

		Border( _screen.w/2-10, 22, 2),
	},

	-- Song Title
	LoadFont("Common normal")..{
		Name="SongTitle",
		InitCommand=function(self)
			self:zoom(0.5):shadowlength(0.6):maxwidth(_screen.w/2.5 - 10):xy(_screen.cx, 20)
		end,
		CurrentSongChangedMessageCommand=function(self)
			self:playcommand("Update")
		end,
		UpdateCommand=function(self)
			local song = GAMESTATE:GetCurrentSong()
			self:settext( song and song:GetDisplayFullTitle() or "" )
		end
	}
}