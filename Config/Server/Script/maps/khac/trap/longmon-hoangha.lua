
function main(sel)
	if (GetLevel() >= 10) then
		if(NewWorld(122,1612,3323) == 1) then	--	
		SetFightState(1)		--
        AddTermini(182)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
