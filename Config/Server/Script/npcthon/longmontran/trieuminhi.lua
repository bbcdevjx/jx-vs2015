Include("\\script\\header\\taskid.lua");
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local nTask = GetNumber(1,nTaskValue,8);
	if(nTask == 1) then
	Talk(8,"nvthon",12075,12076,12077,12078,12079,12080,12081,12082)
	else
	Talk(1,"",12083)
	end
end;

function nvthon()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),8,2));
	Talk(1,"",12084)
	Msg2Player("Kh«ng ngê ph¶n øng cña TriÖu Mi Nhi m¹nh mÏ nh­ vËy. Hay lµ ta quay l¹i hái l·o ¨n mµy.")
end;