--Ken Nguyen 06/03/2014
Include("\\script\\header\\tongkim.lua");
--Tinh diem Player chet trong chien truong Tong Kim
--MSParam
--0		online
--1		chien dau
--2		0_tong so tich luy
--3		1_tu vong
--4		2_lien tram max
--5		3_giet nguoi choi
--6 	4_tichluy gietnguoichoi
--7 	5_gietnpc
--8 	6_tichluy gietnpc
--9 	7_LT hien tai
--10	8_tichluyL LT hien tai
--11	9_bau vat
--12	10_tichluy bauvat
--13	11_doat co
--14	12_tichluy doatco
--15	cap bac-quan ham`

function OnDeath(nDesNpcIndex)
	if(SubWorld == SubWorldID2Idx(380)) then
		if(GetMSRestTime(1,1) > 0) then
		return end;
		local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
		local nOnline = GetPMParam(1,nPlayerDataIdx,0);
		local nDesPlayerIdx = NpcIdx2PIdx(nDesNpcIndex);
		if(nDesPlayerIdx <= 0) then --quai'
			if(nPlayerDataIdx > 0 and nOnline == 1) then
			SetPMParam(1,nPlayerDataIdx,3,GetPMParam(1,nPlayerDataIdx,3)+1);--tu vong
			SetPMParam(1,nPlayerDataIdx,9,0);--lien tram hien tai
			--SetPMParam(1,nPlayerDataIdx,10,0);--tich luy LT hien tai
			end
		return end
		
		local nDesPlayerData	= PIdx2MSDIdx(1,nDesPlayerIdx);
		local nDesOnline = GetPMParam(1,nDesPlayerData,0);
		if(nPlayerDataIdx > 0 and nDesPlayerData > 0 and nOnline == 1 and nDesOnline == 1) then	--co ton tai. va ca 2 dang online trong chien truong
			local szName = GetName();
			local szRank = GetRankEx();
			local nDieRank = GetPMParam(1,nPlayerDataIdx,15);	--cap bac nguoi chet
			SetPMParam(1,nPlayerDataIdx,3,GetPMParam(1,nPlayerDataIdx,3)+1);--tu vong
			SetPMParam(1,nPlayerDataIdx,9,0);--lien tram hien tai
			--SetPMParam(1,nPlayerDataIdx,10,0);--tich luy LT hien tai
			SetTimer(180*18,2)
			PlayerIndex = nDesPlayerIdx;
			local szDesName = GetName();
			local szDesRank = GetRankEx();
		
			SetPMParam(1,nDesPlayerData,5,GetPMParam(1,nDesPlayerData,5) + 1);--so luong giet player
			SetPMParam(1,nDesPlayerData,6,GetPMParam(1,nDesPlayerData,6) + TICHLUY_GIETNGUOI + TICHLUY_GIETNGUOI*nDieRank);--tich luy player,
			local CurNewLT = GetPMParam(1,nDesPlayerData,9) + 1;
			SetPMParam(1,nDesPlayerData,9,CurNewLT);--lien tram hien tai
			local MaxLT = GetPMParam(1,nDesPlayerData,4);
			if(CurNewLT > MaxLT) then
			SetPMParam(1,nDesPlayerData,4,CurNewLT);--max LT
			end
			SetPMParam(1,nDesPlayerData,10,GetPMParam(1,nDesPlayerData,10) + TICHLUY_LIENTRAM + CurNewLT);--tich luy LT hien tai
			
			local nTotalAccum = GetPMParam(1,nDesPlayerData,2) +TICHLUY_GIETNGUOI+TICHLUY_GIETNGUOI*nDieRank+TICHLUY_LIENTRAM+CurNewLT;--tong so tich luy
			SetPMParam(1,nDesPlayerData,2,nTotalAccum);
			local nRank = GetPMParam(1,nDesPlayerData,15);	--cap bac
			local nGroup = GetMSIdxGroup(1, nDesPlayerData);
			local i;
			if (nRank < 5) then
				for i=1,getn(EXPAND_RANK) do
					if(nTotalAccum >= EXPAND_RANK[i][1] and nRank < EXPAND_RANK[i][2]) then
					SetPMParam(1,nDesPlayerData,15,EXPAND_RANK[i][2])
					nRank = EXPAND_RANK[i][2]
					SetRankEx(EXPAND_RANK[i][nGroup+3],"255,0,255")
					end
				end
			end
			local szBeKill = "";
								
			if (GetCurCamp()  == 1) then
				szBeKill  = "Phe Tèng "..tbRANKNAME[nRank]..szDesName.." h¹ träng th­¬ng ng­êi phe Kim "..tbRANKNAME[nDieRank]..szName..", tæng PK lµ "..GetPMParam(1,nDesPlayerData,5);
			else
				szBeKill  = "Phe Kim "..tbRANKNAME[nRank]..szDesName.." h¹ träng th­¬ng ng­êi phe Tèng "..tbRANKNAME[nDieRank]..szName..", tæng PK lµ "..GetPMParam(1,nDesPlayerData,5);
			end
			Msg2MSAll(1,szBeKill, -2);--thong bao toan nguoi choi
			Msg2Player("<color=Pink>Chóc mõng! B¹n h¹ gôc "..tbRANKNAME[nDieRank]..szName..", tæng PK lµ "..GetPMParam(1,nDesPlayerData,5).."<color>");
		end
	end
end;