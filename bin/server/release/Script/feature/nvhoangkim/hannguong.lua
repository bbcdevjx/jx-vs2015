Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc han giang doc dieu tau - han ngu ong
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,3);
	if(nValue == 13) then
		Say(14716,1,
		END_TALK.."/nv_501");
	return end
	Talk(1,"","§éc c©u hµn giang, t©m nh­ chÝnh thñy, ung dung tù t¹i!");
end;

function nv_501()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,14));
	AddOwnExp(30000);
	Msg2Player("Hµn Giang §éc §iÕu TÈu b¶o b¹n ®Õn n¬i trèng tr·i (221,182) quyÕt ®Êu víi «ng ta!")	
	AddNote(2,1,"Hµn Giang §éc §iÕu TÈu b¶o b¹n ®Õn n¬i trèng tr·i (221,182) quyÕt ®Êu víi «ng ta!");
end

function no()
end;