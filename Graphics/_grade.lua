local grade = ...
assert(grade, "needs a grade")

-- todo: grade colors and such?
return LoadFont("_wendy small")..{
	Text=THEME:GetString("Grade",grade);
	InitCommand=cmd(zoom,0.4;diffuse,color("#FFFFFF");shadowlength,0;strokecolor,color("#FFFFFF"));
};