Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\event_head.lua");
ITEMLIST = {5,2,13,0,1,3,1,13,1,1}
SATTHU_EXP = 150000
vatdung = 6
ITEM = {71,72,73,124}
ITEM2 = {23,12,18,20}
function DropRate(NpcIndex)
local nValue = GetTask(TASK_NVST);
local nNum = GetNumber(2,nValue,1);
    if (nNum == GetNpcValue(NpcIndex)) then
    local ser = GetNpcSer(NpcIndex);
    local pluck = GetLucky(0); --may man cua nguoi choi
    local maxlv = RANDOM(5,10);
    local bDropSpecial = 0;
    local nKindSpecial;
	nValue = SetNumber(2,nValue,1,0);
    SetTask(TASK_NVST,nValue);
	
	nValue = GetTask(TASK_RESET);
	local nTimes = GetNumber(2,nValue,4);
	nValue = SetNumber(2,nValue,4,nTimes+1);
    SetTask(TASK_RESET,nValue);
	--Add them gi thi bo vao day lun
    AddOwnExp(SATTHU_EXP)
    AddItemIDStack(AddItem(0,6,398,0,0,ser,0,0))--add theo he ngu hanh
	--Msg2Player("B¹n nhËn ®­îc mét s¸t thñ lÖnh");
	--AddSkillState(541,1,0,54)
	Msg2Player("B¹n ®· thu phôc ®­îc tªn s¸t thñ, hoµn thµnh nhiÖm vô!")
	if(nTimes == 9) then
		if(CheckRoom(2,2) == 1) then
			for i=1,2 do
			local nNewItem = AddItemID(AddItem(0,6,71,0,0,5,0,0)) -- Tien thao lo
			LockItem(nNewItem)
			nNewItem = AddItemID(AddItem(0,6,2411,0,0,5,0,0))	-- Phu quy cam hap
			LockItem(nNewItem)
			end
			Msg2Player("B¹n nhËn ®­îc phÇn th­ëng s¸t thñ.")
		end
	end
	---------------------------------
    local bluedetail,blueparti,dropnum;
    dropnum = 8; --so' luong. cuc. do` roi
	if(RANDOM(500) <= pluck) then
		maxlv = 10;
	end
	if(RANDOM(300) == 299) then
		bDropSpecial = 1;
		nKindSpecial = RANDOM(8);
	end
	--phan rot vat pham trang bi-----------------
	for i=1,dropnum do
		bluedetail = RANDOM(9);
		blueparti = RANDOM(ITEMLIST[bluedetail+1]);
		DropItem(NpcIndex, AddItem(0,0,bluedetail,blueparti,RANDOM(7,10),ser,pluck,
		RANDOM(3,maxlv),RANDOM(3,maxlv),RANDOM(1,maxlv),RANDOM(maxlv),RANDOM(maxlv),RANDOM(maxlv)));
	end
	--------------------------------------------
	--phan rot vat pham dac biet--
	if ( bDropSpecial == 1) then
		if (nKindSpecial == 0) then
			DropItem(NpcIndex,AddItem(0,0,RANDOMC(getn(ITEM),ITEM),0,0,5,0,0))--cac loai lo
		elseif (nKindSpecial == 1) then
			DropItem(NpcIndex,AddItem(0,0,RANDOMC(getn(ITEM),ITEM),0,0,5,0,0));--linhtinh
		elseif (nKindSpecial == 2) then
			DropItem(NpcIndex,AddItem(0,6,28,0,0,5,0,0)) --bikip cui`
		elseif (nKindSpecial == 3) then
			DropItem(NpcIndex,AddItem(0,6,59,0,0,5,0,0))--bikip cui`
		elseif (nKindSpecial == 4) then
			DropItem(NpcIndex,AddItem(0,6,41,0,0,5,0,0)) --bikip cui`
		else
			DropItem(NpcIndex,AddItem(0,6,15,0,0,5,0,0));--phi phong
		end
	end
	--event----------------
	addevent(4)
	-----------------------------
	end
end
