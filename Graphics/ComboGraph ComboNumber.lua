return LoadFont("_wendy small") .. {
	InitCommand=function(self)
		self:zoom(0.3):diffuse(color("#FFFFFF"))
	end;
};