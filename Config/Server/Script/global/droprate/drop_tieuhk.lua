--hoangnhk
ITEMLIST = {5,2,13,0,1,3,1,13,1,1}

function DropRate(NpcIndex)
local ser = GetNpcSer(NpcIndex);
local pluck = GetLucky(0); --may man cua nguoi choi
local maxlev = random(7,10);
if(RANDOM(200) <= pluck) then
maxlev = 10
end
----------------Boss tieu hoang kim-----------------------------------------------------------
local nSel = 0;
local bluedetail,blueparti,dropnum;
dropnum = 12; --so' luong. cuc. do` roi
for i=1,dropnum do
	nSel = RANDOM(350);
	if(nSel == 299) then
		DropItem(NpcIndex, AddItem(0,4,RANDOM(3,30),0,0,5,0,0) )--bikip
	--elseif(nSel == 298) then
		--DropItem(NpcIndex, AddItem(0,2, 0,RANDOM(158,166),0,0,0,150,0)) --an bang dinh quoc
	elseif(nSel == 199) then
		DropItem(NpcIndex, AddItem(0,2,13,0,0,5,0,0)) --volammattich
	elseif(nSel == 99) then
		DropItem(NpcIndex, AddItem(0,2,14,0,0,5,0,0)) --taytuykinh
	elseif(nSel == 98) then
		DropItem(NpcIndex, AddItem(2,0,RANDOM(185,192),0,0,0,150,0)) --hiep cot nhu tinh
	elseif(nSel == 97) then
		DropItem(NpcIndex, AddItem(0,2,RANDOM(54,55),0,0,5,0,0));--linhtinh
	elseif(nSel == 96) then
	    DropItem(NpcIndex, AddItem(0,4,RANDOM(238,240),0,0,5,0,0)) --thuy tinh
	elseif(nSel == 95) then	
        DropItem(NpcIndex, AddItem(0,4,353,0,0,5,0,0)) --tinh hong bao thach
	else
		--lseif (nKindSpecial == 2) then
		bluedetail = RANDOM(9);
		blueparti = RANDOM(ITEMLIST[bluedetail+1]);
		DropItem(NpcIndex, AddItem(0,0,bluedetail,blueparti,RANDOM(9,10),ser,pluck,
		RANDOM(5,maxlev),RANDOM(5,maxlev),RANDOM(3,maxlev),RANDOM(maxlev),RANDOM(maxlev),RANDOM(maxlev)));
	end
end
end;