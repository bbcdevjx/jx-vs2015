--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx)
	local str={
		"B¹n cÇm quyÓn Vâ L©m MËt TÞch nghiªn cøu c¶ nöa ngµy, kÕt qu¶ còng kh«ng lÜnh ngé ®­îc g×. ",
		"B¹n cÇm quyÓn Vâ L©m MËt TÞch nghiªn cøu c¶ nöa ngµy, kÕt qu¶ lÜnh ngé ®­îc chót Ýt. ",
		"B¹n cÇm quyÓn Vâ L©m MËt TÞch nghiªn cøu c¶ nöa ngµy, kÕt qu¶ còng thu ®­îc mét vµi ®iÒu t©m ®¾c liªn quan ®Õn vâ c«ng ",
		"B¹n ®· nghiÒn ngÉm kü quyÓn Vâ L©m MËt TÞch, nh­ng kh«ng thu ®­îc ®iÒu g× t©m ®¾c "
		}
	local nValue = GetTask(TASK_BOOKS)
	local nTimes = GetNumber(2,nValue,2);
	if (nTimes >= 15) then
		Msg2Player(str[4]);
	elseif(GetLevel() < 80) then
		Msg2Player(str[2]);
	else
		SetTask(TASK_BOOKS, SetNumber(2,nValue,2,nTimes+1))
		AddMagicPoint(1);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[3]);
	end
end;