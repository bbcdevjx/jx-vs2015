Include("\\script\\header\\taskid.lua");

function main()
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nTask = GetNumber(1,nTaskValue,8);
	if(nTask == 0) then
	Say(12910,2,
	"Gióp/giup",
	"Kh«ng gióp/kogiup"
	)
	elseif(nTask == 1) then
		if(GetItemCount(0,4,179) < 1) then
		Talk(1,"",12912)
		else
		SetTask(TASK_NVDANHVONG2, SetNumber(1,nTaskValue,8,2));
		DelItem(1,0,4,179)
		Msg2Player("Ng« L·o Gia b¶o b¹n ®Õn gÆp Hång Mai.")
		Talk(1,"",12911)
		end
	else
		Talk(1,"",12913)
	end
end

function giup()
	SetTask(TASK_NVDANHVONG2, SetNumber(1,GetTask(TASK_NVDANHVONG2),8,1));
	Talk(1,"",12912)
	Msg2Player("NhËn nhiÖm vô: ®Õn hiÖu thuèc mua Xuyªn bèi hoµn vÒ cho Ng« L·o Gia.")
end

function kogiup()
end
