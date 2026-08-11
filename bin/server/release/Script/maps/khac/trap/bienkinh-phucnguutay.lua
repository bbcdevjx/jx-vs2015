
function main(sel)
	if (GetLevel() >= 10) then
		SetFightState(1)		--
		if(NewWorld(41,2078,2805) == 1) then --	
		AddTermini(105)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
