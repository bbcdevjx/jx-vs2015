Include("\\script\\header\\forbidmap.lua")

function add480()
		level = random(1,5);
		AddSkillState(480, level, 1, 1080 )
		Msg2Player("B¹n nhËn ®­îc<color=cyan> §éc s¸t néi c«ng trong 1 phót t¨ng: "..(level*10).." ®iÓm")	
end

function add485()
		level = random(1,5);
		AddSkillState(485, level, 1, 1080 )
		Msg2Player("B¹n nhËn ®­îc<color=cyan> §éc s¸t ngo¹i c«ng trong 1 phót t¨ng: "..(level*10).." ®iÓm")	
end

Tab={add480,add485}

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

