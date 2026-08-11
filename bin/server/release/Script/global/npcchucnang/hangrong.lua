function main(NpcIndex)
	local NOT_TRADE = "KÕt thóc ®èi tho¹i/no";
	Say(10093,3,
		"Ta muèn xem qua/giaodich",
		"Mua thÎ t¸n gÉu[50 v¹n l­îng]/thetangau",
		NOT_TRADE)
end;

function thetangau()
	if(GetCash() >= 500000) then
		Pay(500000);
		AddItemID(AddItem(0,6,1063,0,0,5,0,0));
	else
		MsgPlayer("<sex> ®Ó quªn tiÒn trong r­¬ng chøa råi sao?");
	end;
end;

function giaodich()
	Sale(96);
end;

function no()
end;
