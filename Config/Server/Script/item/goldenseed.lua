Include("\\script\\header\\taskid.lua");

function main(nItemIdx)
	local nValue = GetTask(TASK_RESET);
	local nUsed = GetNumber(1,nValue,9);
	if (nUsed >= 1) then
		Msg2Player("H«m nay c¸c h¹ ®· sö dông qu¶ hoµng kim råi, c«ng lùc t¨ng qu¸ nhanh còng sÏ bÞ ph¶n t¸c dông ®ã. §îi ngµy mai råi h·y dïng nhÐ.")
	return end
	if (GetLevel() < 120) then
		Msg2Player("§¼ng cÊp 120 trë lªn míi ®­îc sö dông Qu¶ Hoµng Kim.")
	return end
    SetTask(TASK_RESET,SetNumber(1,nValue,9,nUsed+1))
    AddOwnExp(30000000)
    RemoveItem(nItemIdx,1)
end
