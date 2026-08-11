Include("\\script\\header\\forbidmap.lua");
function main(nItemIdx)
	local W,X,Y = GetWorldPos();
	local nMapId = W;	
	if ( checkSJMaps(nMapId) ~= 1 ) then
		Msg2Player("Lóc nµy b¹n kh«ng thÓ sö dông vËt phÈm nµy");
		return 1;
	end
	if(DelItem(1,0,6,215)==1) then
	ModifyAttrib(153,1000,100,0);
	ModifyAttrib(154,1000,100,0);
	end;
end