--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx) 
	str ={ 
	"B¹n thö c¾n mét miÕng 'Cèng NguyÖt Phï Dung', kÕt qu¶ kh«ng cã g× x¶y ra", 
	"B¹n ¨n mét c¸i 'Cèng NguyÖt Phï Dung', c¶m thÊy thÓ tr¹ng nhÑ nh­ tho¸t tôc, h¬i thë v« cïng s¶ng kho¸i", 
	"B¹n ®· ¨n 3 c¸i 'Cèng NguyÖt Phï Dung' råi, b©y giê kh«ng ¨n ®­îc" 
	} 
	if (GetLevel() < 80) then
		Msg2Player(str[1]);
	return end;
	local nValue = GetTask(TASK_TAYTUYKINH)
	local nTimes = GetNumber(1,nValue,6);
	if (nTimes >= 3) then
		Msg2Player(str[3]);
	else
		SetTask(TASK_TAYTUYKINH, SetNumber(1,nValue,6,nTimes+1))
		AddProp(5);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[2]);
	end
end
