Include("\\script\\header\\taskid.lua")
--nguoi choi danh quai' cuoi cung` khi chet
CACLOAITHUOC = {
{"Tö Môc tóc",112},{"§Þa cÈm th¶o",113},{"ThiÕn th¶o",114},{"Hæ nhÜ th¶o",115},{"Linh Chi",116}
}

function LastDamage(NpcIndex)
	local nValue = GetTask(TASK_NVDANHVONG);
	local nRec = GetNumber(1,nValue,3);
	if(nRec > 0) then
		if(random(1,2) == 1) then
		for i=1,getn(CACLOAITHUOC) do
			if(GetItemCount(0,4,CACLOAITHUOC[i][2]) <= 0) then
			AddItemID(AddItem(0,4,CACLOAITHUOC[i][2],0,0,5,0,0))
			Msg2Player("B¹n nhËn ®­îc 1 "..CACLOAITHUOC[i][1])
			return end
		end
		end
	end
end;

--khi phuc sinh
function Revive(NpcIndex)

	SetNpcLife(NpcIndex, 200);--set mau' quai' ngay tai day cung duoc
	local bBlueBoss = 0;
	if RANDOM(100) < 2 then		--xac suat 2% ra boss xanh
		bBlueBoss = 1;
	end
	if bBlueBoss == 1 then	--thiet lap thuoc tinh cho boss xanh
		SetNpcBoss(NpcIndex,1)
		local nLife = GetNpcLife(NpcIndex);
		nLife = floor(nLife/4);
		if(nLife <= 0) then
			nLife = 1
		end
		SetNpcLife(NpcIndex, nLife);
		SetNpcExp(NpcIndex, 1600);--kn boss xanh
		SetNpcHitRecover(NpcIndex,12);
		SetNpcSpeed(NpcIndex, 8);
		SetNpcResist(NpcIndex, 75, 75, 75, 75, 75);
		SetNpcDmgEx(NpcIndex,25,0,0,0,0,1);--sat thuong ngoai cong
	else	--thiet lap sat thuong cho npc thuong`
		SetNpcBoss(NpcIndex,0)
		SetNpcExp(NpcIndex, 400);--set kn quai thuong`
		SetNpcHitRecover(NpcIndex,6);
	end
end

--Khi chet
function DeathSelf(NpcIndex)
end
