
function main(sel)
	if (GetLevel() >= 10) then
		SetFightState(1)
		if(NewWorld(70,1608,3230) == 1) then
        AddTermini(47)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
