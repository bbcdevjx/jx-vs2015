Include("\\script\\startgame\\npcpos.lua");

function addtrainingnpc()
	for i=1,getn(BALANGHUYEN) do
	AddNPCEx(RANDOMC(31,42,43),10,53,BALANGHUYEN[i][1],BALANGHUYEN[i][2],DEATHFILE0X,
		5,nil,1,RANDOMC(0,1,2,3,4),nil,nil,nil,40,5,10,15,nil,600,nil,nil,DROPFILE0X);
	end
end;
