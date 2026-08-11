Include( "\\script\\header\\forbidmap.lua" );
function main(nItemIdx)
	if (GetFightState() == 0 or GetTaskTemp(99) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("HiÖn t¹i b¹n kh«ng thÓ sö dông bïa vÒ thµnh!");
		return 1
	end
	
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) == 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	--if(GetCash() <500) then
	--	Msg2Player("KhÊu trõ 500 l­îng thÊt b¹i");
	--return end;
	--Pay(500);
	local itemname = GetNameItem(nItemIdx);
	local n_param = GetParamItem(nItemIdx);
	n_param = n_param - 1;
	if (n_param <= 0) then
		RemoveItem(nItemIdx,1)
		Msg2Player(""..itemname.." ®· sö dông hÕt sè lÇn, kh«ng thÓ dïng ®­îc n÷a!")
	else
		SetParamItem(nItemIdx,n_param);
		Msg2Player(""..itemname.." cßn cã thÓ sö dông "..n_param.." lÇn")
	end
	UseTownPortal();
end