function  main(nItem)
	local nNpcSettingIdx = GetParamItem(nItem);
	Say("LINK:"..GetNpcTempTypeName(nNpcSettingIdx).."",random(0,13),"MÆt n¹ bang héi cã thÓ gióp cho toµn thÓ thµnh viªn c¶i trang gièng nhau, cã muèn sö dông kh«ng?", 2, "Bang héi ta sÏ c¶i trang gièng nhau./yes("..nItem..")", "T¹m thêi kh«ng/no");
end

function yes(nItem)
	local a,b = GetTongName();
	if(b == 0) then
		Msg2Player("Kh«ng ë trong bang héi, kh«ng thÓ sö dông ®¹o cô nµy.");
		return 1
	end
	local nTongFigure = GetTongFigure();
	if (nTongFigure == 3 or nTongFigure == 2)then
		Msg2Player("ChØ cã bang chñ hoÆc tr­ëng l·o míi cã thÓ sö dông ®¹o cô nµy.");
		return 1
	end	
	local name = GetName();
	local nNpcSettingIdx = GetParamItem(nItem);
	if RemoveItemByIndex(nItem,1) ~= 1 then
		return
	end
	Msg2Tong(name.." sö dông mÆt n¹ bang héi, thµnh viªn trªn m¹ng c¶i trang gièng nhau.");
	RemoveItem(nItem,1);
	for i=1,1199 do
		PlayerIndex = i;
		_,nTongID =GetTongName();
		if(GetPlayerNpcIdx() > 0 and nTongID==b) then
		SetMask(nNpcSettingIdx);
		end
	end
end

function no()
end