
function main(sel)
	if (GetLevel() >= 70) then
		SetFightState(1)		--
		if(NewWorld(340,1862,3447) == 1) then
        AddTermini(225)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;

