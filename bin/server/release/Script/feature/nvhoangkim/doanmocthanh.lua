Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc doan moc thanh
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 25) then
		Say(11039,1,
		END_TALK.."/nv_601");
	return end
	if(nValue == 26 and GetLevel() >= 60) then
		Talk(1,"nv_602","HiÖn giê kh¶ n¨ng cña ta ®ñ ®èi phã Liªu §Þnh råi chø?");
	return end
	if(nValue == 28) then
		Say(11063,1,
		END_TALK.."/done60");
	return end
	Talk(1,"",11027);
end;

function nv_601()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,26));
	if(GetLevel() >= 60) then
		nv_602();
	else
		Talk(1,"",11033);
	end
end

function nv_602()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,27));
	Talk(1,"",11041);
	Msg2Player("§Õn L·o Hæ ®éng giÕt Liªu §Þnh.");
	AddNote(3,1,"§i giÕt Liªu §Þnh ë L·o Hæ ®éng (196,202)");
end

function done60()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,29));
	AddItemID(AddItem(0,4,463,0,0,5,0,0));
	AddSkillState( 509, 1,0, 180);
	Msg2Player("B¹n nhËn ®­îc Bµn Long C«i!");
	Msg2Player("§Õn gÆp Long Ngò thØnh gi¸o.");
end

function no()
end;