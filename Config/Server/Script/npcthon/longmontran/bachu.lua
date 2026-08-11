Include("\\script\\header\\taskid.lua");
MAX_RESTTIME = 2700	--45 phut lam 1 lan
function main(NpcIndex)
	local nValue = GetTask(TASK_NVDANHVONG);
	local nvtanthu = GetNumber(1,nValue,7);
	if(nvtanthu == 1) then
		Talk(5,"nvthon",12090,12091,12092,12093,12094)
	return end
	local nTaskTime = GetTask(TASK_THOIGIAN);
	local nCurTime = GetCurServerSec();
	if(nCurTime - nTaskTime < MAX_RESTTIME) then	--chua vuot 45 phut
		Talk(1,"",12099)
	return end
	if(GetNumber(1,nValue, 1) ~= 1) then --chua co nhan
		Say(12095,2,
		"BiÕt råi/timthit",
		"PhiÒn chÕt ®i ®­îc/no")
	else
		if(GetNumber(1,nValue, 2) > 2) then--3 mieng thit
		Talk(1,"",12096)
		Msg2Player("B¹n nhËn ®­îc 10 ®iÓm danh väng.")
		AddRepute(10)
		SetTask(TASK_NVDANHVONG, SetNumber(2,nValue,1,0))
		SetTask(TASK_THOIGIAN,nCurTime)
		else
		Talk(1,"",12097)
		end
	end
end;

function timthit()
	local nValue = GetTask(TASK_NVDANHVONG);
	nValue = SetNumber(1,nValue,1,1);
	SetTask(TASK_NVDANHVONG, nValue);
	nValue = SetNumber(1,nValue,2,0);
	SetTask(TASK_NVDANHVONG, nValue);
	local str = "NhËn nhiÖm vô, vµo rõng lÊy 3 miÕng thÞt heo cho bµ chñ.<281/291><273/261><222/260>";
	Msg2Player(str)
	AddNote(13,1,str)
end;

function nvthon()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),7,2));
	Talk(1,"",12100)
	Msg2Player("Bµ chñ ®· ®ång ý mêi Th­îng Quan Thu ®Õn ®©y gióp viÖc! H·y mang tin vui nµy ®Õn cho h¾n.")
end;

function no()
end;