Include("\\script\\header\\taskid.lua");

function main()
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local nTask = GetNumber(1,nTaskValue,9);
	if(nTask == 0) then
	Say(12929,2,
	"Gióp/giup",
	"Kh«ng gióp/kogiup"
	)
	elseif(nTask == 1) then
	Talk(1,"",12930)
	elseif(nTask == 2) then
		SetTask(TASK_NVDANHVONG, SetNumber(1,nTaskValue,9,3));
		if(GetSex() == 0) then
		AddItemID(AddItem(0,0,7,2,1,1,0,0))
		Msg2Player("NhËn ®­îc mét chiÕc mò.")
		else
		AddItemID(AddItem(0,0,7,8,1,1,0,0))
		Msg2Player("NhËn ®­îc mét ng©n thoa.")
		end
		AddRepute(5)
		Msg2Player("Th«ng b¸o tin vÞ vâ s­ nhËn Hæ tö lµm ®å ®Ö cho cha Hæ tö, hoµn thµnh nhiÖm vô.")
		Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm.")
		Talk(1,"",12931)
	else
	Talk(1,"",12932)
	end
end

function giup()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),9,1));
	Talk(1,"",12930)
	Msg2Player("NhËn nhiÖm vô: §i xin cho Hæ Tö häc vâ.")
end

function kogiup()
end
