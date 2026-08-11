--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(nItemIdx) 
	str ={ 
	"B¹n thö c¾n mét miÕng 'Phông NguyÖt Qu¶ Dung', kÕt qu¶ kh«ng cã g× x¶y ra", 
	"B¹n ¨n mét c¸i 'Phông NguyÖt Qu¶ Dung', c¶m thÊy cã mét luång ch©n khİ lu©n chuyÓn, nhÊt thêi vâ c«ng tiÕn bé v­ît bËc", 
	"B¹n ®· ¨n 2 c¸i 'Phông NguyÖt Qu¶ Dung' råi, b©y giê kh«ng ¨n ®­îc" 
	} 
	if (GetLevel() < 80) then
		Msg2Player(str[1]);
	return end;
	local nValue = GetTask(TASK_TAYTUYKINH)
	local nTimes = GetNumber(1,nValue,5);
	if (nTimes >= 2) then
		Msg2Player(str[3]);
	else
		SetTask(TASK_TAYTUYKINH, SetNumber(1,nValue,5,nTimes+1))
		AddMagicPoint(1);
		RemoveItem(nItemIdx, 1);
		Msg2Player(str[2]);
	end
end
