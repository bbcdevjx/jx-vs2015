Include("\\script\\header\\forbidmap.lua")

function add495()
		level = random(10,20);
		AddSkillState(495, level, 1,1080)
		Msg2Player("B¹n nhËn ®­îc<color=cyan> t¨ng søc m¹nh tÊn c«ng trong 1 phót "..(level*10).."%")	
end

Tab={add495}

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
