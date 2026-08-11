
function main(sel)
	if (GetLevel() >= 60) then
		SetFightState(1)
		if(NewWorld(123,1698,3374) == 1) then
		AddTermini(219)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
