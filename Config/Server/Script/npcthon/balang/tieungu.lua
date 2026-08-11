Include("\\script\\header\\taskid.lua");

function main()
	local nTaskValue = GetNumber(1,GetTask(TASK_DAOTAYTUY),9);
	if(nTaskValue == 0) then
	Say(11275,2,
	"Gióp/giup",
	"Kh«ng gióp/kogiup"
	)
	elseif(nTaskValue == 3) then
		if(GetItemCount(0,4,180) > 0) then
		SetTask(TASK_DAOTAYTUY,SetNumber(1,GetTask(TASK_DAOTAYTUY),9,4));
		if(GetSex() == 0) then
		AddItemID(AddItem(0,0,5,0,1,1,0,0))
		Msg2Player("LÊy ®­îc ®«i giÇy cá.")
		else
		AddItemID(AddItem(0,0,5,2,1,1,0,0))
		Msg2Player("LÊy ®­îc ®«i giÇy thªu.")
		end
		DelItem(1,0,4,180)
		AddRepute(5)
		Msg2Player("§­a Tú Bµ hoµn cho TiÓu Ng­ hoµn thµnh nhiÖm vô.")
		Msg2Player("Danh väng b¹n t¨ng thªm 5 ®iÓm.")
		Talk(1,"",11276)
		else
		Talk(1,"",11277)
		end
	else
		Talk(1,"",11278)
	end
end;

function giup()
	SetTask(TASK_DAOTAYTUY,SetNumber(1,GetTask(TASK_DAOTAYTUY),9,1));
	Talk(1,"",11280)
	Msg2Player("NhËn nhiÖm vô: §i t×m thuèc cho cha TiÓu Ng­   ")
end

function kogiup()
	Talk(1,"",11281)
end
