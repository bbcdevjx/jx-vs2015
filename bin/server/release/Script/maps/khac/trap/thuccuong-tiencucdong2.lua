
function main(sel)
	if (GetLevel() >= 70) then
		NewWorld(93,1575,3116)		--	
		SetFightState(1)		--
        AddTermini(146)
	else
		Talk(1,"",15645)--phia truoc nguy hiem
	end
end;
