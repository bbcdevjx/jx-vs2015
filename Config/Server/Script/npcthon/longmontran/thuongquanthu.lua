Include("\\script\\header\\taskid.lua");
function main()
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local nTask = GetNumber(1,nTaskValue,7);
	if(nTask == 0) then
	Talk(2,"nhiemvu",12049,12050)
	elseif(nTask == 2) then
		Talk(1,"hoanthanh",12051)
	else
		Talk(1,"",12052)
	end
end;

function nhiemvu()
	Say(12053,2,
	"Gióp h¾n nghÜ ra biÖn ph¸p/giup",
	"KhÝch lÖ tinh thÇn h¾n/kogiup"
	)
end;

function hoanthanh()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),7,3));
		AddItemID(AddItem(0,0,1,0,1,1,0,0))
		AddRepute(3)
		Msg2Player("NhËn ®­îc mét mãn binh khÝ.")
		Msg2Player("B¸o tin t×m ®­îc viÖc cho Th­îng Quan Thu hoµn thµnh nhiÖm vô.")
		Msg2Player("Danh väng cña b¹n t¨ng thªm 3 ®iÓm.")
		Talk(1,"",12056)
end;

function giup()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),7,1));
	Talk(1,"",12054)
	Msg2Player("NhËn nhiÖm vô giíi thiÖu c«ng viÖc cho Th­îng Quan Thu")
end

function kogiup()
	Talk(1,"",12055)
end
