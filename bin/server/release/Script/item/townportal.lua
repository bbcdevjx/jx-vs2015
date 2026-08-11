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
	
	if(UseTownPortal()) then	
		RemoveItem(nItemIdx,1);
	end
end