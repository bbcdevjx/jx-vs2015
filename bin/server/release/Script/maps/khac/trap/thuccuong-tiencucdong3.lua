
function main(sel)
	if (GetLevel() >= 70) then
		NewWorld(93,1703,3031)		--	
		SetFightState(1)		--
		AddTermini(147)
	else
		Talk(1,"",15645)--phia truoc nguy hiem
	end
end;
