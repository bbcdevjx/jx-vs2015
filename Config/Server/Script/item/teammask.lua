Include("\\script\\lib\\worldlibrary.lua");
function  main(nItem)
	local nNpcSettingIdx = GetParamItem(nItem);
	Say("LINK:"..GetNpcTempTypeName(nNpcSettingIdx).."",random(0,13),"MÆt n¹ tæ ®éi gióp cho tÊt c¶ thµnh viªn trong ®éi trë nªn gièng nhau, muèn sö dông kh«ng?", 2, "Tæ ®éi ta sÏ c¶i trang gièng nhau./yes("..nItem..")", "T¹m thêi kh«ng/no");
end

function yes(nItem)
	local size=GetTeamSize();
	if(size <= 0) then
		Msg2Player("Kh«ng cã trong ®éi ngò, kh«ng thÓ sö dông ®¹o cô nµy");
		return 1
	end

	local name = GetName()
	local nNpcSettingIdx = GetParamItem(nItem);
	if RemoveItem(nItem,1) ~= 1 then
		return
	end	
	for i=0,7 do
	local nMemId = GetTeamMem(i);
	if(nMemId > 0) then
		CallPlayerFunction(nMemId,SetMask,nNpcSettingIdx);
	end;
	end
	Msg2Team(name.." sö dông mÆt n¹ ®éi ngò, ®éi viªn c¶i trang gièng nhau.");
end

function no()
end