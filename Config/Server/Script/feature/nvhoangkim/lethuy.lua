Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
--npc mac xao nhi
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,3);
	if(nValue == 8) then
		Say(15484,1,
		END_TALK.."/nv_401");
	return end
	if(nValue == 10 and GetItemCount(0,4,458)>0) then
		Say(15485,1,
		END_TALK.."/nv_402");
	return end
	Talk(1,"",15483);
end;

function nv_401()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,9));
	AddOwnExp(15000);
	Msg2Player("LÖ Thu Thñy b¶o b¹n ®Õn Hoµng Hµ Nguyªn §Çu ®¸nh b¹i Tõ Tù Lùc.")
	AddNote(2,1,"§¸nh Tõ Tù Lùc Hoµng Hµ Nguyªn §Çu <192/195>");
end

function nv_402()
	if (DelItem(1,0,4,458)==1) then
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,11));
	Msg2Player("LÖ Thu Thñy gióp b¹n tÈy tñy, hiÖn giê b¹n cã thÓ thay ®æi ®iÓm kü n¨ng.")
	Msg2Player("NÕu b¹n kh«ng thuéc Phe Trung lËp, th× sÏ kh«ng ®­îc tÈy tñy. B¹n cã thÓ vÒ t×m Phã Nam B¨ng.")
	if(GetFactionCamp() == 3) then
	Say("B¹n nhËn ®­îc 1 c¬ héi tÈy ®iÓm kü n¨ng miÔn phİ.",1,"B¾t ®Çu tÈy/taykynang");
	end
	end
end

function no()
end;