Include( "\\script\\header\\forbidmap.lua" )

--Bo cau tong kim
function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	local nowmissionid = 1;
	local curcamp = GetCurCamp();
	X = floor( X /32/ 8 );
	Y = floor( Y /32/ 16 );
	string = "<color=yellow>"..GetName().."<color><color=pink>: 'Täa ®é hiÖn t¹i cña ta lµ <color=yellow> ("..X..", "..Y..")<color>. H·y ®Õn gióp ta mét tay.'";
	Msg2MSGroup( nowmissionid, string, curcamp-1 );
	Msg2Player("B¹n sö dông bå c©u th«ng b¸o cho chiÕn h÷u täa ®é hiÖn t¹i cña b¹n.");
	RemoveItem(nItemIdx,1);
end
