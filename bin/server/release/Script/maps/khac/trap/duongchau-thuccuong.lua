
function main(sel)
	if (GetLevel() >= 10) then
		SetFightState(1)
		if(NewWorld(92,1632,3290) == 1) then		--	
		AddTermini(151)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
