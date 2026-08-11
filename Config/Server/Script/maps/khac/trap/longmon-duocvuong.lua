
function main(sel)
	if (GetLevel() >= 10) then
		NewWorld(140,2428,3731)		--	
		SetFightState(1)
        AddTermini(183)
	else
		Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
