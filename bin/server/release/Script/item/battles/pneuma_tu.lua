Include("\\script\\header\\forbidmap.lua")

function add466()
		level = random(1,4);
		AddSkillState(466,level,1,1080)
		Msg2Player("B¹n nhËn ®­îc<color=cyan> 1 phót gi¶m thä th­¬ng "..(level*10).."%")	
end

function add467()
		level = random(1,4);
		AddSkillState(467,level,1,1080)
		Msg2Player("B¹n nhËn ®­îc<color=cyan> 1 phót gi¶m thêi gian tróng ®éc: "..(level*10).."%")	
end

Tab={add466,add467}

function main( nItemIndex)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		RemoveItem(nItemIndex,1);
	end
end
