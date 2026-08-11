--hoangnhk
Include("\\script\\header\\event_head.lua");
ITEMLIST = {5,2,13,0,1,3,1,13,1,1}
MONEY = 425
function DropRate(NpcIndex)
local btype = GetNpcBoss(NpcIndex);
local ser = GetNpcSer(NpcIndex);
local pluck = GetLucky(0); --may man cua nguoi choi
local maxlev = 5;
local nSel = random(0,10);
local nItemIdx = 0;
if(RANDOM(800) <= pluck) then
maxlev = 9
end
----------------For blue boss-----------------------------------------------------------
if(btype == 1) then--boss xanh
local bluedetail,blueparti,dropnum;
dropnum = 7; --so' luong. cuc. do` roi
for i=1,dropnum do
	nSel = random(0,10);
	if(nSel < 5) then
		DropMoney(NpcIndex,MONEY)
	elseif(nSel == 9) then
		nItemIdx = AddItem(0,6,212,0,0,5,0,0);
		SetObjPickExecute(DropItem(NpcIndex, nItemIdx),1)
	else
		if (RANDOM(1000)==999) then
			DropItem(NpcIndex, AddItem(0,6,15,0,0,5,0,0));
		else
		bluedetail = RANDOM(9);
		blueparti = RANDOM(ITEMLIST[bluedetail+1]);
		DropItem(NpcIndex, AddItem(0,0,bluedetail,blueparti,RANDOM(7,9),ser,pluck,
		RANDOM(1,maxlev),RANDOM(maxlev),RANDOM(maxlev),RANDOM(maxlev),RANDOM(maxlev),RANDOM(maxlev)));
		end
	end
end
return end
-----------------------------------------------------------------------------------------
if(nSel > 5) then	--khong rot
return end
----------------------------------------------------------------------------------------
local minluck = 0;
local detail = RANDOM(9);
local parti = RANDOM(ITEMLIST[detail+1]);
	if(nSel < 2) then
		DropMoney(NpcIndex,MONEY)
	elseif(nSel == 5) then
		if(random(2) == 1) then
		nItemIdx = AddItem(0,6,205,0,0,5,0,0);
		SetObjPickExecute(DropItem(NpcIndex, nItemIdx),1)
		end;
	else
		if(RANDOM(pluck) > 0) then
		minluck = 1;
		end
		DropItem(NpcIndex, AddItem(0,0,detail,parti,RANDOM(5,9),ser,pluck,
		RANDOM(minluck,maxlev),RANDOM(maxlev),RANDOM(maxlev),RANDOM(maxlev),RANDOM(maxlev),RANDOM(maxlev)))
	end
	--event----------------
	dropevent(NpcIndex);
	-------------------------------------------------------------------------------
end