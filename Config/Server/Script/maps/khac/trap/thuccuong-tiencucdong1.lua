
function main(sel)
	if (GetLevel() >= 70) then
		NewWorld(93,1525,3173)		--	
		SetFightState(1)		--
		AddTermini(145)
	else
		Talk(1,"",15645)--phia truoc nguy hiem
	end
end;
