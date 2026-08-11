
function main(sel)
	if (GetLevel() >= 10) then
		SetFightState(1)
		if(NewWorld(90, 1651,3571)	 == 1) then
		AddTermini(150)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
