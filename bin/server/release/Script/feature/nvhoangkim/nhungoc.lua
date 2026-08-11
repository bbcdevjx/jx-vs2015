Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc Nhu Ngoc
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 18) then
		Say(10970,1,
		END_TALK.."/nv_501");
	return end
	Talk(1,"",14648);
end;

function nv_501()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,19));
	Msg2Player("Nh­ Ngäc b¶o b¹n ®i t×m TrÇn Tam B¶o (219,187)");
	AddNote(3,1,"Nh­ Ngäc b¶o b¹n ®i t×m TrÇn Tam B¶o (219,187)");
end

function no()
end;