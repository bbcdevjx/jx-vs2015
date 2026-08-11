Include("\\script\\header\\taskid.lua")
function main(nItemIdx)
	Input("somayman",99);
end;

function somayman(nItemIdx)
	if(GetItemCount(0,6,2411)<= 0) then
	Talk(1,"","H×nh nh­ ng­¬i kh«ng mang theo 'Phó Quý CÈm H¹p'");
	return end;
	local num = tonumber(GetInput());
	if(num < 1 or num > 99) then
	Msg2Player("Con sè dù ®o¸n chØ ®­îc tõ 1 ®Õn 99!")
	return end
	local nTaskValue = GetTask(TASK_DUNGCHUNG);
	local nData = GetDataInt(DATA_DATCUOC);
	local nTime = GetTask(TASK_DATCUOCT);
	if(nData ~= nTime) then
	SetTask(TASK_DATCUOCT, nData);
	SetTask(TASK_DUNGCHUNG,SetNumber(2,nTaskValue,2,1));
	nData = nData - nTime;
	if(nData ~= 1) then
	SetTask(TASK_DATCUOC4, 0);
	SetTask(TASK_DATCUOC5, 0);
	SetTask(TASK_DATCUOC6, 0);
	else
	SetTask(TASK_DATCUOC4, GetTask(TASK_DATCUOC1));
	SetTask(TASK_DATCUOC5, GetTask(TASK_DATCUOC2));
	SetTask(TASK_DATCUOC6, GetTask(TASK_DATCUOC3));
	end
	SetTask(TASK_DATCUOC1, SetNumber(2,0,1,num));
	SetTask(TASK_DATCUOC2, 0);
	SetTask(TASK_DATCUOC3, 0);
	if(random(2) == 1) then
	AddItemID(AddItem(0,6,random(121,123),0,0,5,1,0));--phuc duyen
	else
	AddOwnExp(50000);
	Msg2Player("B¹n nhËn ®­îc kinh nghiÖm <color=yellow>50.000")
	end
	DelItem(1,0,6,2411);
	Msg2Player("B¹n ®· c­îc sè <color=green>"..num);
	return end
	local nDone = GetNumber(2,nTaskValue,2) + 1;
	if(nDone > 12) then
	Msg2Player("Mçi ngµy b¹n chØ ®­îc c­îc tèi ®a 12 sè!")
	return end
	SetTask(TASK_DUNGCHUNG,SetNumber(2,nTaskValue,2,nDone));
	if		(nDone == 1 ) then
	SetTask(TASK_DATCUOC1, SetNumber(2,0,1,num));
	elseif(nDone == 2 ) then
	SetTask(TASK_DATCUOC1, SetNumber(2,GetTask(TASK_DATCUOC1),2,num));
	elseif(nDone == 3 ) then
	SetTask(TASK_DATCUOC1, SetNumber(2,GetTask(TASK_DATCUOC1),3,num));
	elseif(nDone == 4 ) then
	SetTask(TASK_DATCUOC1, SetNumber(2,GetTask(TASK_DATCUOC1),4,num));
	elseif(nDone == 5 ) then
	SetTask(TASK_DATCUOC2, SetNumber(2,0,1,num));
	elseif(nDone == 6 ) then
	SetTask(TASK_DATCUOC2, SetNumber(2,GetTask(TASK_DATCUOC2),2,num));
	elseif(nDone == 7 ) then
	SetTask(TASK_DATCUOC2, SetNumber(2,GetTask(TASK_DATCUOC2),3,num));
	elseif(nDone == 8 ) then
	SetTask(TASK_DATCUOC2, SetNumber(2,GetTask(TASK_DATCUOC2),4,num));
	elseif(nDone == 9 ) then
	SetTask(TASK_DATCUOC3, SetNumber(2,0,1,num));
	elseif(nDone == 10) then
	SetTask(TASK_DATCUOC3, SetNumber(2,GetTask(TASK_DATCUOC3),2,num));
	elseif(nDone == 11) then
	SetTask(TASK_DATCUOC3, SetNumber(2,GetTask(TASK_DATCUOC3),3,num));
	elseif(nDone == 12) then
	SetTask(TASK_DATCUOC3, SetNumber(2,GetTask(TASK_DATCUOC3),4,num));
	end
	if(random(2) == 1) then
	AddItemID(AddItem(0,6,random(121,123),0,0,5,1,0));--phuc duyen
	else
	AddOwnExp(50000);
	Msg2Player("B¹n nhËn ®­îc kinh nghiÖm <color=yellow>50.000")
	end
	DelItem(1,0,6,2411);
	Msg2Player("B¹n ®· c­îc sè <color=green>"..num);
end;