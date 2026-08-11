function main(sel)
	--12173,12176
	--Say(12174,0);
	Say(12173,2,
		"Thó vÞ ®Êy, ®i thö xem/hoason",
		"Kh«ng quan t©m, kh«ng muèn ®i./no");
end;


function hoason()
	if(GetCash() < 500) then
		Talk(1,"",12175);
	return end;
	if(NewWorld(2,2609,3590)) then
		Msg2Player("B¹n ®ang ®Õn Hoa S¬n c¶nh kü tr­êng!");
		Pay(500);
	end;	
end;

function no()
	Talk(1,"",12176);
end;