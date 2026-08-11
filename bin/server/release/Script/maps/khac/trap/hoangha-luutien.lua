
function main(sel)
	if (GetLevel() >= 10) then
		SetFightState(1)
		if(NewWorld(125,1809,3208) == 1) then
        AddTermini(178)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;

