Include("\\script\\header\\taskid.lua");
MAX_RESTTIME = 3600	--60 phut lam 1 lan
function main(NpcIndex)
	local nValue = GetTask(TASK_NVDANHVONG);
	local nTaskTime = GetTask(TASK_THOIGIAN5);
	local nCurTime = GetCurServerSec();
	if(GetRepute()<2 or (nCurTime - nTaskTime < MAX_RESTTIME)) then
		Talk(1,"",RANDOM(12564,12566))
	return end
	if(GetNumber(1,nValue, 3) ~= 1) then --chua co nhan
		Talk(6,"yeucau",12558,12559,12560,12561,12562,12563)
	else
		if(kiemtra() == 1) then
		Talk(2,"",12556,12557)
		Msg2Player("B¹n nhËn ®­îc 15 ®iÓm danh väng.")
		AddRepute(15)
		SetTask(TASK_NVDANHVONG, SetNumber(1,nValue,3,0))
		SetTask(TASK_THOIGIAN5,nCurTime)
		else
		Talk(1,"",12567)
		end
	end
end;

function yeucau()
	Say(12567,2,
		"§Ó ta t×m gióp/timthuoc",
		"Ta bËn råi/no")
end;

function timthuoc()
	local nValue = GetTask(TASK_NVDANHVONG);
	nValue = SetNumber(1,nValue,3,1);
	SetTask(TASK_NVDANHVONG, nValue);
	Talk(1,"",10342);
	AddNote(13,1,"§Õn D­îc V­¬ng cèc t×m 5 lo¹i thuèc vÒ cho c« g¸i: Tö Môc Tóc, §Þa CÈm Th¶o, ThiÕn Th¶o, Hæ NhÜ th¶o vµ Linh Chi (304,233) (297,227) (301,221)");
end;

function kiemtra()
	for i=112,116 do
		if(GetItemCount(0,4,i) <= 0) then
		return 0 end
	end
	for i=112,116 do
		DelItem(1,0,4,i)
	end
	return 1
end;

function no()
end;