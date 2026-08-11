Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc doan moc due
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 24) then
		Say(11025,1,
		END_TALK.."/nv_60");
	return end
	Say(14427,1,
		END_TALK.."/no");
end;

function nv_60()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,25));
	Msg2Player("B¹n t×m ®Õn Long M«n TrÊn gÆp §oan Méc Thanh.");
	AddNote(3,1,"§oan Méc DuÖ b¶o b¹n ®i Long M«n TrÊn gÆp §oan Méc Thanh");
end

function no()
end;