function main(NpcIndex)
	if (GetTeamSize() > 1) and (IsCaptain() == 1) then
	Talk(1,"Wswear_select", 11374) 
	else 
	Talk(1,"", 11375) 
	end 
end;

function Wswear_select() 
	if (GetSex() == 0) then 
		P_sex = "thi’u hi÷p" 
	else 
		P_sex = "n˜ hi÷p" 
	end 
	Say("<npc>: Hay thÀt, hay thÀt chÿ c«n "..P_sex.." cÔng d≠Íng 3000 l≠Óng Æ” tu sˆa t≠Íng PhÀt th◊ ta bµn ti÷p chuy÷n nµy.",2,"Quy™n 3000 l≠Óng./Wswear_yes","ThÊi b· Æi!/Wswear_no") 
end; 

function Wswear_yes() 
	if (GetCash() >= 3000) then 
		--if(SwearBrother(GetTeam()) == 1)then 
		--	SwearBrother(GetTeam());
		--	Pay(3000) 
		--	Msg2Team("ChÛc mıng c∏c vﬁ k’t ngh‹a kim lan.") 
		-- else 
			-- Msg2Team("Trong nh„m c„ quan h÷ phu th™, k’t b∏i th t bπi") 
		-- end 
	else 
		Talk(1,"", 11376) 
	end 
end; 

function Wswear_no() 
end; 

