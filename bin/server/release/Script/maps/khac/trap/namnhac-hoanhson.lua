
function main(sel)
	if (GetLevel() >= 10) then
		if(NewWorld(56,1493,3530) == 1) then		--	
		SetFightState(1)		--
        AddTermini(49)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
    end
end;
