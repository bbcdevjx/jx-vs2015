Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua");
function OnTimer()
	local PK_value = GetPK(); 
	local nMapId = GetWorldPos(); 
	StopTimer(); 

	if (nMapId == 208) then
	if (PK_value > 1) then
		Msg2Player("Sau khi xem xÐt kü hµnh ®éng ph¹m téi, téi cña ng­¬i gi¶m bít.") 
		SetPK(PK_value - 1) 
		SetTask(TASK_DUNGCHUNG3, SetNumber(3,GetTask(TASK_DUNGCHUNG3),3,100+(PK_value-1)));
		SetTimer(2*60*60*18,9)
	else
		Msg2Player("Sau khi xem xÐt kü hµnh ®éng ph¹m téi, cuèi cïng b¹n còng r­a s¹ch téi cña m×nh.")
		SetPK(0)
		SetTask(TASK_DUNGCHUNG3, SetNumber(3,GetTask(TASK_DUNGCHUNG3),3,100)); 
	end
	end
end;

function OnMissionTimer(nIndex)
	StopMissionTimer(nIndex,9);
end;