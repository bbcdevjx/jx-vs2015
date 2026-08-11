
function main(sel)
	if (GetLevel() >= 40) then
		if(NewWorld(325, 1523,3201) == 1) then	
		SetFightState(0)
		end
	else
		Talk(1, "", "§¼ng cÊp 40 trë lªn míi ®­îc ra chiÕn tr­êng!")
    end
end;
