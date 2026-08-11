Include( "\\script\\header\\forbidmap.lua" )
--Ma Tuy Hieu Giac
function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	CastSkill(505,1)
	RemoveItem(nItemIdx,1,1);
end