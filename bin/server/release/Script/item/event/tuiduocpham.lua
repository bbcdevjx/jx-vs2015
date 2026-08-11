Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\forbidmap.lua");

function main(nItemIdx)
	local nSubWorldID = GetWorldPos();
	if(checkTRAINMaps(nSubWorldID) == 0 or GetFightState()==0) then
		Msg2Player("ChØ nhËn d­îc phÈm hç trî t¹i b¶n ®å luyÖn c«ng");
	return end;
	local nLfTime = GetParamItem(nItemIdx) - GetCurServerSec();
	if(nLfTime > 0) then
		Msg2Player(format("Sau <color=Red>%d gi©y<color> míi cã thÓ nhËn tiÕp",nLfTime));
	return end;
	--if(GetNormalPKState()~= 0) then
	--Msg2Player("Tr¹ng th¸i hßa b×nh míi cã thÓ nhËn");
	--return end;
	local nFreeCell=CalcFreeItemCellCount();
	if(nFreeCell <= 0) then
		Msg2Player("Xin s¾p xÕp Ýt nhÊt 1 « trèng míi cã thÓ nhËn");
	return
	elseif(nFreeCell > 20) then
		nFreeCell = 20;
	end;
	local nPayMoney = 0;
	if(GetLevel()>= 130 or GetTranslife() >=1) then
		local nMoney = 0;
		if(SERVER_MODE == 0) then
			nMoney = 4500;
		else
			nMoney = 78;
		end;
		nPayMoney=nFreeCell*nMoney;
		if(GetCash(2) <nPayMoney) then
			nFreeCell = floor(GetCash(2)/nMoney);
			if(nFreeCell <= 0) then
			Msg2Player("Hµnh trang kh«ng ®ñ ng©n l­îng kh«ng thÓ nhËn");
			return end;
			nPayMoney = nFreeCell*nMoney;
		end;
		nPayMoney = nPayMoney+nPayMoney*10/100;
		Pay(nPayMoney,2);
	end;
	local nNewIdx;
	for i = 1,nFreeCell do
		if(SERVER_MODE == 0) then
			nNewIdx=LockItem(AddItemID(AddItem(0,1,2,0,5,0,0,0)),-2) -- ngu hoa ngoc lo hoan
		else
			nNewIdx=LockItem(AddItemID(AddItem(0,1,2,0,4,0,0,0)),-2) -- that khieu bo tam dan
		end;
	end
	Msg2Player("B¹n nhËn ®­îc "..nFreeCell.." "..GetNameItem(nNewIdx)..", khÊu trõ "..nPayMoney.." l­îng");
	SetParamItem(nItemIdx,GetCurServerSec()+3*nFreeCell);
end