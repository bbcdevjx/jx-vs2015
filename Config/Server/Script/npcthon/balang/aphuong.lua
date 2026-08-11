Include("\\script\\header\\taskid.lua");
function main()
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local nTask = GetNumber(1,nTaskValue,6);
	if(nTask == 0) then
	Say(11297,2,
	"Gióp/giup",
	"Kh«ng gióp/kogiup"
	)
	elseif(nTask == 1) then
		if(GetItemCount(0,4,181) > 0) then
		SetTask(TASK_NVDANHVONG,SetNumber(1,nTaskValue,6,2));
		if(GetSex() == 0) then
		AddItemID(AddItem(0,0,7,2,1,4,0,0))
		Msg2Player("NhËn ®­îc mét chiÕc mò.")
		else
		AddItemID(AddItem(0,0,7,8,1,4,0,0))
		Msg2Player("NhËn ®­îc mét chiÕc tr©m.")
		end
		DelItem(1,0,4,181)
		AddRepute(6)
		Msg2Player("§­a ®«i b«ng tai cho A Ph­¬ng hoµn thµnh nhiÖm vô.")
		Msg2Player("Thanh thÕ giang hå cña b¹n gia t¨ng 6 ®iÓm.")
		Talk(1,"",11298)
		else
		Talk(1,"",11299)
		end
	else
		Talk(1,"",RANDOM(11300,11301))
	end
end;

function giup()
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),6,1));
	Talk(1,"",11299)
	Msg2Player("NhËn nhiÖm vô: A Ph­¬ng nhê b¹n ®i xem thö cã mãn trang søc nµo gi¸ rÎ lµm cña håi m«n kh«ng.")
end

function kogiup()
end
