Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc Dao thach mon
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 13) then
		Say(10874,1,
		END_TALK.."/nv_40");
	return end
	if(nValue == 14 and GetLevel() >= 40) then
		nv_401();
	return end
	if(nValue == 16 and GetItemCount(0,4,199)>0) then
		Say(10877,1,
		END_TALK.."/done40");
	return end
	Talk(1,"",14933);
end;

function nv_40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,14));
	if(GetLevel() >= 40) then
		nv_401();
	else
		Talk(1,"",10875);
	end
end

function nv_401()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,15));
	Say(10876,1,
		END_TALK.."/no");
	Msg2Player("§i Thôc C­¬ng S¬n t×m Tiªu V« Th­êng");
	AddNote(3,1,"§µo Th¹ch M«n nhê b¹n h¹ s¸t TiÕu V« Th­êng ë Thôc C­¬ng S¬n (243,200)");
end

function done40()
	if(DelItem(1,0,4,199)==1) then
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,17));
	AddItemID(AddItem(0,4,462,0,0,5,0,0));
	AddOwnExp(280000);
	AddSkillState(509,1,0,180);
	Msg2Player("B¹n nhËn ®­îc TrÊn Minh Chi Liªn.");
	AddItemID(AddItem(2,0,184,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 chiÕc nhÉn.")
	Msg2Player("B¹n nhËn ®­îc 280.000 ®iÓm kinh nghiÖm");
	Msg2Player("Quay vÒ Giang T©n Th«n t×m Phã L«i Th­ ");
	AddNote(3,1,"Hoµn thµnh nhiÖm vô! H¾n nãi b¹n h·y quay vÒ Giang T©n Th«n t×m Phã L«i Th­");
	Talk(1,"fwd","LÇn nµy may nhê ng­¬i gióp, nh÷ng thø nµy ta tÆng ng­¬i.");
	end
end

function fwd()
	Talk(1,"taytuy",10878);
end;

function taytuy()
	if(GetFactionCamp() == 2) then
	Say("B¹n nhËn ®­îc 1 c¬ héi tÈy ®iÓm kü n¨ng miÔn phÝ.",1,"B¾t ®Çu tÈy/taykynang");
	end
end;

function no()
end;