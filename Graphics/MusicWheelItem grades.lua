return Def.ActorFrame{
	Def.Quad{
		InitCommand=cmd(xy,2,-2;zoomto,4,38),
		SetGradeCommand=function(self,params)
			if params.Grade then
				self:diffuse(getDifficultyColor("Difficulty_"..params.Difficulty))
				self:diffusealpha(0.5)
			else
				self:diffusealpha(0)
			end
		end
	},
	Def.Sprite {
		InitCommand=cmd(xy,-14,-2;zoomto,4,19),
		SetGradeCommand=function(self,params)
			if params.Favorited then
				self:Load(THEME:GetPathG("","urthemannowdog"))
				self:zoomto(24,24)
				self:visible(true)
			else
				self:visible(false)
			end
		end,
	},
	Def.Sprite {
		InitCommand=cmd(xy,-40,-2;zoomto,4,19),
		SetGradeCommand=function(self,params)
			if params.PermaMirror then
				self:Load(THEME:GetPathG("","punchthekeysforgodssake"))
				self:zoomto(24,24)
				self:visible(true)
			else
				self:visible(false)
			end
		end,
	},
	Def.Quad{
		InitCommand=cmd(xy,2,-2;zoomto,4,19),
		SetGradeCommand=function(self,params)
			if params.HasGoal then
				self:diffuse(byJudgment("TapNoteScore_Miss"))
				self:diffusealpha(1)
			else
				self:diffusealpha(0)
			end
		end
	},
	LoadFont("_wendy small") .. {
        InitCommand=cmd(xy,16,-1;zoom,0.32;maxwidth,WideScale(get43size(20),20)/0.5),
        SetGradeCommand=function(self,params)
			local sGrade = params.Grade or 'Grade_None'
			self:valign(0.5)
			self:settext(THEME:GetString("Grade",ToEnumShortString(sGrade)) or "")
			self:diffuse(getGradeColor(sGrade))
        end
	}
}