--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx)
	local str ={
		"B¹n ®· xem kü quyÓn 'TÈy Tñy Kinh' nh­ng kh«ng thÓ hiÓu",
		"B¹n ®· ®äc 'TÈy Tñy Kinh', nhËn ®­îc 5 ®iÓm tiÒm n¨ng",
	}
	local nValue = GetTask(TASK_BOOKS)
	local nTimes = GetNumber(2,nValue,1);
	if (nTimes >= 15 or GetLevel() < 80) then
		Msg2Player(str[1]);
	else
		SetTask(TASK_BOOKS, SetNumber(2,nValue,1,nTimes+1))
		AddProp(5);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[2]);
	end
end;
