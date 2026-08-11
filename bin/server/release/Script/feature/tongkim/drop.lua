
function DropRate(NpcIndex)
	local nValue = GetNpcValue(NpcIndex);
	if(nValue == 0) then
		if(random(1,10) < 8) then
		return end
		local nItemIdx = AddItem(0,6,random(159,175),0,0,5,0);--thuoc lag su dung ngay
		SetObjPickExecute(DropItem(NpcIndex, nItemIdx),1)
	else
		if(random(1,10) < 5) then
		return end
		DropItem(NpcIndex,AddItem(0,6,3359,0,0,5,0,0)) --tk bao vat
	end
	
end
