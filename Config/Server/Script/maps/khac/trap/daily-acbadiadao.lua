
function main(sel)
	if (GetLevel() >= 10) then
		if(NewWorld(163,1558,3199) == 1) then
		SetFightState(1)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
