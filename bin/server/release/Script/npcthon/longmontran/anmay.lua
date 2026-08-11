Include("\\script\\header\\taskid.lua");
function main()
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local nTask = GetNumber(1,nTaskValue,8);
	if(nTask == 0) then
	Talk(1,"nhiemvu","VÞ ®¹i hiÖp nµy, xin gióp ta mét viÖc...")
	elseif(nTask == 1) then
		Talk(1,"",12043)
	elseif(nTask == 2) then
		Talk(1,"hoanthanh",12041)
	else
		Talk(1,"",12042)
	end
end;

function nhiemvu()
	Say(12044,2,
	"Gióp/giup",
	"Kh«ng gióp/kogiup"
	)
end;

function hoanthanh()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),8,3));
	if(GetSex() == 0) then
		AddItemID(AddItem(0,0,8,1,1,1,0,0))
	else
		AddItemID(AddItem(0,0,8,0,1,1,0,0))
	end
		AddRepute(5)
		Msg2Player("NhËn ®­îc mét hé uyÓn.")
		Msg2Player("Nãi ph¶n øng cña Mi Nhi cho l·o ¨n mµy hoµn thµnh nhiÖm vô.")
		Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm.")
		Talk(1,"",12048)
end;

function giup()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),8,1));
	Talk(1,"",12045)
	Msg2Player("NhËn nhiÖm vô gióp l·o ¨n mµy ®­a tin cho TriÖu Mi Nhi")
end

function kogiup()
	Talk(2,"",12046,12047)
end
