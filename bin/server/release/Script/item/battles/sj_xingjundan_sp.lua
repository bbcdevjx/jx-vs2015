Include("\\script\\header\\forbidmap.lua")

function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	RemoveItem(nItemIdx,1);
	AddSkillState(472, 5, 1, 54 )
	Msg2Player("Sö dông råi 'Hµnh Qu©n §¬n ®Æc biÖt'.")	
end

