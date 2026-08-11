Include("\\script\\header\\taskid.lua");
function main()
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nTask = GetNumber(1,nTaskValue,9);
	if(nTask == 0) then
	Say(12916,2,
	"Gióp/giup",
	"Kh«ng gióp/kogiup"
	)
	elseif(nTask == 1 or nTask == 2) then
		if(GetItemCount(0,4,176) < 1) then
		Talk(1,"",RANDOM(12920, 12921))
		else
		SetTask(TASK_NVDANHVONG2, SetNumber(1,nTaskValue,9,3));
		AddItemID(AddItem(0,0,0,0,1,1,0,0))
		DelItem(1,0,4,176)
		AddRepute(8)
		Msg2Player("§­a c©y n¸ cho Hæ tö, hoµn thµnh nhiÖm vô.")
		Msg2Player("NhËn ®­îc 1 mãn binh khÝ.")
		Msg2Player("Danh väng cña b¹n t¨ng thªm 8 ®iÓm.")
		Talk(1,"",12919)
		end
	else
		Talk(1,"",12922)
	end
end

function giup()
	SetTask(TASK_NVDANHVONG2, SetNumber(1,GetTask(TASK_NVDANHVONG2),9,1));
	Talk(2,"",12918, 12923)
	Msg2Player("NhËn nhiÖm vô: ®Õn thî rÌn trong th«n lÊy gióp Hæ tö c©y n¸.")
end

function kogiup()
	Talk(1,"",12924)
end
