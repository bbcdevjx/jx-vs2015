Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\vuotai.lua");
--nguoi choi danh quai' cuoi cung` khi chet
function LastDamage(NpcIndex)
	local nValue = GetNpcValue(NpcIndex);
	local nExp = NPC_VUOTAI[nValue][4];
	local nBossType = GetNpcBoss(NpcIndex);
	if(nBossType > 0) then
		nExp = nExp*4;
	end
	--tinh kinh nghiem cho toan doi
	local nOldPlayer = PlayerIndex;--nguoi giet quai
	local nCount = GetMSPlayerCount(1);
	for i=1,nCount do
		if(GetPMParam(1, i, 0) == 1) then --dang online thi tinh diem
			PlayerIndex = MSDIdx2PIdx(1, i);
			if(PlayerIndex == nOldPlayer) then
				AddOwnExp(nExp)
			else
				AddOwnExp(floor(nExp*50/100))
			end
		end
	end
	--rot vat pham----------
	if(nBossType > 0) then
		local w,x,y=GetNpcPos(NpcIndex);
		for i=1,10 do
		DropMapItem(w,x*32,y*32,AddItem(0,1,2,0,5,5,0,0));
		end
	elseif(RANDOM(100)>80) then
		local w,x,y=GetNpcPos(NpcIndex);
		DropMapItem(w,x*32,y*32,AddItem(0,1,2,0,5,5,0,0));
	end
	-----------------------------------------
end

--khi hoi sinh
function Revive(NpcIndex)
	local nValue = GetNpcValue(NpcIndex);
	local nBoss = NPC_VUOTAI[nValue][11];
	local nBossType = GetNpcBoss(NpcIndex);
	if(nBossType == 0) then
	SetNpcSkill(NpcIndex, NPC_VUOTAI[nValue][5][1], NPC_VUOTAI[nValue][5][2], 1)
	SetNpcSkill(NpcIndex, NPC_VUOTAI[nValue][5][3], NPC_VUOTAI[nValue][5][4], 2)
	SetNpcSkill(NpcIndex, NPC_VUOTAI[nValue][5][5], NPC_VUOTAI[nValue][5][6], 3)
	SetNpcSkill(NpcIndex, NPC_VUOTAI[nValue][5][7], NPC_VUOTAI[nValue][5][8], 4)
	
	SetNpcDmgEx(NpcIndex,NPC_VUOTAI[nValue][6],
	                                        NPC_VUOTAI[nValue][7],
	                                        NPC_VUOTAI[nValue][8],
	                                        NPC_VUOTAI[nValue][9],
											NPC_VUOTAI[nValue][10],0);--sat thuong noi cong
	SetNpcDmgEx(NpcIndex,NPC_VUOTAI[nValue][6],
	                                        NPC_VUOTAI[nValue][7],
	                                        NPC_VUOTAI[nValue][8],
	                                        NPC_VUOTAI[nValue][9],
											NPC_VUOTAI[nValue][10],1);--sat thuong ngoai cong
	else	--boss
	SetNpcSkill(NpcIndex, BOSS_VUOTAI[nBoss][3][1], BOSS_VUOTAI[nBoss][3][2], 1)
	SetNpcSkill(NpcIndex, BOSS_VUOTAI[nBoss][3][3], BOSS_VUOTAI[nBoss][3][4], 2)
	SetNpcSkill(NpcIndex, BOSS_VUOTAI[nBoss][3][5], BOSS_VUOTAI[nBoss][3][6], 3)
	SetNpcSkill(NpcIndex, BOSS_VUOTAI[nBoss][3][7], BOSS_VUOTAI[nBoss][3][8], 4)
	
	SetNpcDmgEx(NpcIndex,BOSS_VUOTAI[nBoss][4],
	                                        BOSS_VUOTAI[nBoss][5],
	                                        BOSS_VUOTAI[nBoss][6],
	                                        BOSS_VUOTAI[nBoss][7],
											BOSS_VUOTAI[nBoss][8],0);--sat thuong noi cong
	SetNpcDmgEx(NpcIndex,BOSS_VUOTAI[nBoss][4],
	                                        BOSS_VUOTAI[nBoss][5],
	                                        BOSS_VUOTAI[nBoss][6],
	                                        BOSS_VUOTAI[nBoss][7],
											BOSS_VUOTAI[nBoss][8],1);--sat thuong ngoai cong
	end
end
--Khi chet
function DeathSelf(NpcIndex)
	--DelNpc(NpcIndex);
	DelMSNpc(1,NpcIndex);
	--check xem het quai' trong ai~ chua
	local nMissV = GetNumber(2,GetMissionV(1),1) - 1;
	if(nMissV <= 0) then
		for i=1,getn(MAP_VUOTAI) do
			if(SubWorld == SubWorldID2Idx(MAP_VUOTAI[i])) then
			local nLevel=GetNumber(2,GetMissionV(1),2);
			release_npcvuotai(nLevel+1,MAP_VUOTAI[i])
			end
		end
	else
		SetMission(1,SetNumber(2,GetMissionV(1),1,nMissV));
	end
end
