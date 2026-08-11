Include("\\script\\header\\forbidmap.lua")

function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	RemoveItem(nItemIdx,1);
	CastSkill( 492, 1);
	Msg2Player("B¹n ®· sö dông 1 lÖnh bµi");
end