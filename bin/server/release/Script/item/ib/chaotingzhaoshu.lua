Include("\\script\\header\\taskid.lua");
function main(nItemIdx)
	if (GetPK() == 0) then
		Say("HiÖn t¹i ®iÓm PK cña b¹n lµ 0, kh«ng cÇn sö dông 'Th­ ®Æc xa triÒu ®×nh'", 0);
		Msg2Player("HiÖn t¹i ®iÓm PK cña b¹n lµ 0, kh«ng cÇn sö dông 'Th­ ®Æc xa triÒu ®×nh'");
		return 1;
	end;
	RemoveItem(nItemIdx,1);
	SetPK(0);
	Say("B¹n sö dông <color=yellow>"..GetNameItem(nItemIdx).."<color>, trÞ PK b©y giê cña ng­¬i lµ 0", 0);
	Msg2Player("B¹n sö dông <color=yellow>"..GetNameItem(nItemIdx).."<color> trÞ PK b©y giê cña ng­¬i lµ 0");
	if (GetWorldPos() == 208) then
		SetTask(TASK_DUNGCHUNG3, SetNumber(3,GetTask(TASK_DUNGCHUNG3),3,0));
	end;
end;

function no()
end;