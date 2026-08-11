Include("\\script\\header\\tongkim.lua");
--nguoi choi danh quai' cuoi cung` khi chet
function LastDamage(NpcIndex)
	if(SubWorld == SubWorldID2Idx(380)) then
		local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
		SetPMParam(1,nPlayerDataIdx,7,GetPMParam(1,nPlayerDataIdx,7) + 1);--so luong giet npc
		SetPMParam(1,nPlayerDataIdx,8,GetPMParam(1,nPlayerDataIdx,8) + TICHLUY_GIETNPC);--tich luy npc,
		local nTotalAccum = GetPMParam(1,nPlayerDataIdx,2) +TICHLUY_GIETNPC;--tong so tich luy
		SetPMParam(1,nPlayerDataIdx,2,nTotalAccum);
		local nRank = GetPMParam(1,nPlayerDataIdx,15);	--cap bac
		local nGroup = GetMSIdxGroup(1, nPlayerDataIdx);
		local i;
		if (nRank < 5) then
			for i=1,getn(EXPAND_RANK) do
				if(nTotalAccum >= EXPAND_RANK[i][1] and nRank < EXPAND_RANK[i][2]) then
				SetPMParam(1,nPlayerDataIdx,15,EXPAND_RANK[i][2])
				nRank = EXPAND_RANK[i][2]
				SetRankEx(EXPAND_RANK[i][nGroup+3],"255,0,255")
				end
			end
		end
	end
end

--khi hoi sinh
function Revive(NpcIndex)

end
--Khi chet
function DeathSelf(NpcIndex)
	--if(GetNpcBoss(NpcIndex) == 1) then
	
	--end
end
