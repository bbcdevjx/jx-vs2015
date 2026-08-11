Include("\\script\\header\\taskid.lua");

function main(sel)
	if (GetLevel() < 90) then
		Talk(1,"","Ng­êi ch¬i ph¶i cÊp 90 trë lªn vµ ®· nép thÎ míi sö dông ®­îc");
	return end;

	local nTotalTask = GetTask(TASK_RESET3);
	local nTaskValue = GetNumber(1,nTotalTask,7);	
	if(nTaskValue >= 2) then
		Msg2Player("Mçi ngµy mçi ng­êi chØ ®­îc sö dung 2 Long HuyÕt Hoµn");
	return end;
	SetTask(TASK_RESET3, SetNumber(1,nTotalTask, 7, nTaskValue+1))
	nTotalTask = GetTask(TASK_RESET);
	nTaskValue = GetNumber(1,nTotalTask,4);
	SetTask(TASK_RESET, SetNumber(1,nTotalTask, 4, nTaskValue+1))
	Talk(1,"","Thu ®­îc thªm c¬ héi 1 lÇn tham gia ho¹t ®éng <th¸ch ®Êu thêi gian>!");
	RemoveItem(sel,1);
end