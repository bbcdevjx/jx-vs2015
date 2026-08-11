Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\tongkim.lua");
Include("\\script\\header\\vuotai.lua");
Include("\\script\\header\\liendau.lua");
Include("\\script\\header\\phonglangdo.lua");
Include("\\script\\header\\taskid.lua");
function OnTimer()
	StopTimer();
end;

function OnMissionTimer(nIndex) --nIndex la so id nhiem vu, TongKim la mission 1
	--SubWorld la bien' toan` cau` luu chi so map, phai doi ra mapid
	if(SubWorld == SubWorldID2Idx(380)) then
		ontime_tongkim(nIndex)
	elseif(SubWorld == SubWorldID2Idx(396)) then
		ontime_liendau(nIndex)
	elseif(SubWorld == SubWorldID2Idx(337)) then
		ontime_phonglangdo(nIndex)
	else
		for i=1,getn(MAP_VUOTAI) do
			if(SubWorld == SubWorldID2Idx(MAP_VUOTAI[i])) then
			ontime_vuotai(nIndex, i,MAP_VUOTAI[i])
			return end
		end
		for i=1,getn(MAP_LIENDAU) do
			if(SubWorld == SubWorldID2Idx(MAP_LIENDAU[i])) then
			ontime_dautruongliendau(nIndex)
			return end
		end
	end
end;

function ontime_tongkim(nIndex)
	StopMissionTimer(nIndex,1);--tat hen gio so 1
	local nTongc = GetMSPlayerCount(nIndex,0);
	local nKimc = GetMSPlayerCount(nIndex,1);
	local nCount = GetMSPlayerCount(nIndex);
	if(nTongc == 0 or nKimc == 0) then
		for i=1,nCount do
		if(GetPMParam(nIndex, i, 0) == 1) then --dang online
			PlayerIndex = MSDIdx2PIdx(nIndex, i);
			SetPKMode(0,0);--phuc hoi pk tu do
			SetFightState(0);--phi chien dau
			SetPunish(0);
			SetDeathScript("")
			SetReviveNow(0);
			RestoreRankEx();
			local nCamp = GetCurCamp();
			RestoreCamp();--phuc hoi phe ban dau
			if(nCamp == 1) then --tong
			NewWorld(325,RANDOM(1537,1548), RANDOM(3160,3195));
			SetRevPos(325,1)
			else	--kim
			NewWorld(325,RANDOM(1566,1588), RANDOM(3079,3096));
			SetRevPos(325,2)
			end
		end
		end
		CloseMission(nIndex);
		AddCountNews(13910,5); --1 ben ko co nguoi
	return end
	AddCountNews(10651,5) --chien tran da bat dau
	for i=1,nCount do
		if(GetPMParam(nIndex, i, 0) == 1) then --neu co online thi ep kieu chien dau
			PlayerIndex = MSDIdx2PIdx(nIndex, i);
			SetPKMode(1,1)--ep kieu chien dau
			SetPMParam(nIndex,i,1,1) --set param 1 dang trong thoi gian chien dau
			PutMessage("§Þch qu©n ®· xuÊt hiÖn!",5,0);
		end
	end
	if(GetMissionV(0) ~= 2) then
	release_npctk();
	end;
end;

function ontime_vuotai(nIndex, nGlbMission,nMap)
	StopMissionTimer(nIndex,1);--tat hen gio so 1
	SetGlbMission(DATA_MAPVUOTAI+nGlbMission, 0)--set lai chua dang ky cho lan sau
	if(GetMSPlayerCount(nIndex,0) == 0) then--map nay ko ai tham gia->close
		CloseMission(nIndex);
	return end
	StartMissionTimer(nIndex,2, 30*1080)--thoi gian ket thuc vuot ai
	--bat dau add npc ai~ 1
	release_npcvuotai(1,nMap)
end;

function ontime_liendau(nIndex)	--map 396
	StopMissionTimer(nIndex,1);--tat hen gio so 1
	SetMission(0, 0)--set lai chua dang ky cho lan sau(so nguoi dang ky)
	local nCount = GetMSPlayerCount(nIndex);
	if(nCount == 0) then
	 CloseMission(nIndex)
	return end
	local nNo = 1;
	local nSubWorldTemp = SubWorldID2Idx(396)
	repeat
		SubWorld = nSubWorldTemp
		local nP1 = GetPMParam(nIndex, nNo, 0);
		local nP2 = GetPMParam(nIndex, nNo+1, 0);
		if( nP1 == 1 and nP2 == 1) then
			local nMap = MAP_LIENDAU[(nNo+1)/2]
			nP1 = MSDIdx2PIdx(nIndex, nNo);
			nP2 = MSDIdx2PIdx(nIndex, nNo+1);
			SubWorld = SubWorldID2Idx(nMap)
			OpenMission(1)
			StartMissionTimer(1,1, 180)--10s sau bat dau tran dau
			PlayerIndex = nP1
			LeaveTeam()
			LockMoveItem(1)
			NewWorld(nMap, 1614,3203)
			SetCurCamp(1) --set phe phai'
			SetPunish(1)
			AddMSPlayer(1,0)
			PlayerIndex = nP2
			LeaveTeam()
			LockMoveItem(1)
			NewWorld(nMap, 1622,3196)
			SetCurCamp(2) --set phe phai'
			SetPunish(1)
			AddMSPlayer(1,1)
		elseif(nP1 == 1) then
			PlayerIndex = MSDIdx2PIdx(nIndex, nNo);
			local nGroup = GetTask(TASK_LIENDAU) - 1;
			local n1,n2,n3,n4,n5,Name1,Name2 = GetDataGr(nGroup);
			n2 = SetNumber(3,n2,1,GetNumber(3,n2,1)+1);
			n3 = n3 + LIENDAU_THANG;
			SetDataGr(nGroup, n1,n2,n3,n4,n5,Name1,Name2);
			AddHonor(LIENDAU_THANG);
			SetPos(1540,3050);
			LockMoveItem(0)
			Msg2Player(LIENDAU_MSGBOCUOC)
			local DesID = GetMSPlayerID(nIndex, nNo+1);
			if(DesID ~= 0) then
				DesID = FindDataId(DesID);
				if(DesID >= 0) then
					n1,n2,n3,n4,n5,Name1,Name2 = GetDataGr(DesID);
					n2 = SetNumber(3,n2,3,GetNumber(3,n2,3)+1);
					SetDataGr(DesID, n1,n2,n3,n4,n5,Name1,Name2);
				end
			end
		elseif(nP2 == 1) then
			PlayerIndex = MSDIdx2PIdx(nIndex, nNo+1);
			local nGroup = GetTask(TASK_LIENDAU) - 1;
			local n1,n2,n3,n4,n5,Name1,Name2 = GetDataGr(nGroup);
			n2 = SetNumber(3,n2,1,GetNumber(3,n2,1)+1);
			n3 = n3 + LIENDAU_THANG;
			SetDataGr(nGroup, n1,n2,n3,n4,n5,Name1,Name2);
			AddHonor(LIENDAU_THANG);
			SetPos(1540,3050);
			LockMoveItem(0)
			Msg2Player(LIENDAU_MSGBOCUOC)
			local DesID = GetMSPlayerID(nIndex, nNo);
			if(DesID ~= 0) then
				DesID = FindDataId(DesID);
				if(DesID >= 0) then
					n1,n2,n3,n4,n5,Name1,Name2 = GetDataGr(DesID);
					n2 = SetNumber(3,n2,3,GetNumber(3,n2,3)+1);
					SetDataGr(DesID, n1,n2,n3,n4,n5,Name1,Name2);
				end
			end
		end
		nNo = nNo+2;
	until (nNo > nCount);
	SubWorld = nSubWorldTemp
	CloseMission(nIndex)
end;

function ontime_phonglangdo(nIndex)
	StopMissionTimer(nIndex,1);--tat hen gio so 1
	if(GetMSPlayerCount(nIndex,0) == 0) then--map nay ko ai tham gia->close
		CloseMission(nIndex);
	return end
	local nCount = GetMSPlayerCount(nIndex);
	for i=1,nCount do
		if(GetPMParam(nIndex, i, 0) == 1) then --neu co online thi chuyen fight
			PlayerIndex = MSDIdx2PIdx(nIndex, i);
			SetFightState(1);
		end
	end
	StartMissionTimer(nIndex,2, 8*1080)--thoi gian boss ra
	StartMissionTimer(nIndex,3, 30*1080)--thoi gian qua ben kia
	--bat dau add npc
	release_npcphonglang()
end;

function ontime_dautruongliendau(nIndex)
	StopMissionTimer(nIndex,1);--tat hen gio so 1
	local nCount = GetMSPlayerCount(nIndex);
	if(nCount < 2) then
	 CloseMission(nIndex)
	return end
	PlayerIndex = MSDIdx2PIdx(nIndex, 1);
	SetFightState(1)
	SetPKMode(2,1)
	IgnoreState();
	SetReviveNow(1);
	SetDeathScript("\\script\\player\\death_liendau.lua")
	SetDmgScript("\\script\\player\\death_liendau.lua")
	PlayerIndex = MSDIdx2PIdx(nIndex, 2);
	SetFightState(1)
	SetPKMode(2,1)
	IgnoreState();
	SetReviveNow(1);
	SetDeathScript("\\script\\player\\death_liendau.lua")
	SetDmgScript("\\script\\player\\death_liendau.lua")
	StartMissionTimer(nIndex,2, 8640)--thoi gian ca tran dau 8 phut
end;
