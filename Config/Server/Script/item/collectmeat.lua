--hoangnhk
Include("\\script\\header\\taskid.lua");

function main(nItemIdx)
	if(RemoveItem(nItemIdx,1)==1)then
	local nTaskValue = GetTask(TASK_THITTUOI);
	nTaskValue = nTaskValue + 1;
	SetTask(TASK_THITTUOI, nTaskValue);	
	local nTask = GetNumber(2,GetTask(TASK_DUNGCHUNG2),4);
	if (nTaskValue == 1) and (nTask == 0 ) then
		Msg2Player("B¹n cã thÓ ®Õn c¸c Vâ s­ ë c¸c T©n Thñ Th«n nhËn 1 vµi nhiÖm vô mua b¸n thÞt t­¬i.")
	elseif (nTask ~= 0 ) then
		if (nTask == nTaskValue) then
			Msg2Player("B¹n ®· nhËn ®­îc ®ñ thÞt t­¬i, cã thÓ trë vÒ t×m Vâ s­ giao nhiÖm vô.")
		end
	end
	end;
end