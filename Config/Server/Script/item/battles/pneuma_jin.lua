Include("\\script\\header\\forbidmap.lua")

function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	RemoveItem(nItemIdx,1);
	level = random(1,7);
	AddSkillState(466,level,1,1080)
	Msg2Player("B¹n nhËn ®­îc<color=cyan> 1 phót gi¶m thä th­¬ng "..(level*10).."%")	
end

