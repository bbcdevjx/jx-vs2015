
function main(sel)
	if (GetLevel() >= 70) then
		SetFightState(1)		--
		if(NewWorld(336,1131,3191) == 1) then
        AddTermini(224)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;

