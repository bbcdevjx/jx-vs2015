Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc thai cong cong
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 2) then
		Say(10674,1,
		END_TALK.."/nv_201");
	return end
	if(nValue == 4 and GetItemCount(0,4,503)>0) then
		Say(10704,1,
		END_TALK.."/nv_202");
	return end
	Talk(1,"",10675);
end;

function nv_201()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,3));
	Msg2Player("§i lªn Phôc Ng­u S¬n ®«ng t×m Kim phËt.")
	AddNote(3,1,"Th¸i c«ng c«ng nãi b¹n ®i Phôc Ng­u s¬n ®¸nh b¹i TiÓu Kú Nhi (226,205)");
end

function nv_202()
	if(DelItem(1,0,4,503)==1) then
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,5));
	Msg2Player("B¹n nhËn ®­îc 1 b×nh Thiªn H­¬ng Ngäc Chi Cao. Mang vÒ cho V©n Nhi.")
	end
end

function no()
end;