Include("\\script\\header\\loidai.lua");

function main()
	Say("C¸c h¹ muèn rêi l«i ®µi ph¶i kh«ng",3,"§óng vËy, ta muèn rêi khái ®©y!/yes","Ta lµ ®éi tr­ëng, ta muèn biÕt thø tù thi ®Êu./joinkey","Kh«ng cÇn/no")
end;

function yes()
	LeaveGame();
	local w,x,y = Rev2Pos(BW_COMPETEMAP[1],GetCurRevID());
	NewWorld(w,floor(x/32),floor(y/32));
end

function no()
end
