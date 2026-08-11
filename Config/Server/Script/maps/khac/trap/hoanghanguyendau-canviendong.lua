
function main()
	if (GetLevel() >= 70) then
		if (random(1,2) == 1) then
			NewWorld(124,1671,3421)    
		else
			NewWorld(124,1586,3208)
		end
		SetFightState(1)
		AddTermini(181)
	else
		Talk(1,"",15645)--phia truoc nguy hiem
	end
end;
