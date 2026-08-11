--Loi di tat' len sa mac dia bieu
function main(sel)

	--NewWorld(131,1864,3605)		--	qua con lon
	if(GetLevel() >= 70) then
		SetFightState(1)		--
		if(NewWorld(224,1621,3214) == 1) then	--qua sa mac dia bieu
		AddTermini(229)
		end
	else
	Talk(1,"",15645)--phia truoc nguy hiem
	end
end;
