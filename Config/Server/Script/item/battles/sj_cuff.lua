Include("\\script\\header\\forbidmap.lua")

function add496()
		level = random(1,2);
		AddSkillState(496,level,1,1080)
		Msg2Player("B¹n nhËn ®­îc<color=cyan> t¨ng ®éng t¸c xuÊt chiªu trong 1 phót "..(level*10).."%")	
end

Tab={add496}

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

