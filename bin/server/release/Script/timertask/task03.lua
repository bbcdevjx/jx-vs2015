Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\tongkim.lua");
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\event_head.lua");

function OnTimer()
	StopTimer();
end;

function OnMissionTimer(nIndex)
	StopMissionTimer(nIndex,3);
	if(SubWorld == SubWorldID2Idx(380)) then
		local nCount = GetMSPlayerCount(1);
		local nTongAcc,nKimAcc,nPlayerCamp = 0,0,0;
		local i;
		for i=1,nCount do
			if(GetMSIdxGroup(1, i) == 0) then
				nTongAcc = nTongAcc + GetPMParam(1,i,2);
			else
				nKimAcc = nKimAcc + GetPMParam(1,i,2);
			end
		end
		if(nTongAcc > nKimAcc) then
			nPlayerCamp = 1;
		elseif(nTongAcc < nKimAcc) then
			nPlayerCamp = 2;
		else
			nPlayerCamp = 0;
		end
		for i=1,nCount do
		if(GetPMParam(1, i, 0) == 1) then --dang online thi tinh diem
			PlayerIndex = MSDIdx2PIdx(1, i);
			SetPKMode(0,0);--phuc hoi pk tu do
			SetFightState(0);--phi chien dau
			SetPunish(0);
			RestoreRankEx();
			local nTotalAccum = GetPMParam(1,i,2);
			local nCamp = GetCurCamp();
			if(nPlayerCamp == nCamp) then --nam trong phe chien thang, thuong them tich luy
			local nAccum = TICHLUY_THUONG * GetPMParam(1, i, 15);
			nTotalAccum = nTotalAccum + nAccum;
			Talk(1,"","Xin chóc mõng! B¹n nhËn ®­îc phÇn th­ëng <color=yellow>"..nAccum.."<color> ®iÓm tÝch lòy");
			AddItemID(AddItem(0,6,11,0,0,5,0,0))--phao bong
			end
			if(nCamp == 1) then --tong
				AddValue(4,nTotalAccum);
			else	--kim
				AddValue(5,nTotalAccum);
			end
			AddAccum(nTotalAccum);
			if(nCamp == 1) then --tong
			NewWorld(325,RANDOM(1537,1548), RANDOM(3160,3195));
			SetRevPos(325,1)
			else	--kim
			NewWorld(325,RANDOM(1566,1588), RANDOM(3079,3096));
			SetRevPos(325,2)
			end
			SetDeathScript("") --set script khi chet
			SetReviveNow(0);
			SetCurCamp(GetCamp());--phuc hoi phe ban dau
			--event----------------
			addevent(6)
			--end------------------
		end
		end
		if(nPlayerCamp == 1) then
		AddNews(format("§¹i chiÕn Tèng Kim ®· kÕt thóc. TÝch lòy Tèng %d:%d Kim. Phe Tèng giµnh ®­îc th¾ng lîi!",nTongAcc,nKimAcc));
		elseif(nPlayerCamp == 2) then
		AddNews(format("§¹i chiÕn Tèng Kim ®· kÕt thóc. TÝch lòy Tèng %d:%d Kim. Phe Kim giµnh ®­îc th¾ng lîi!",nTongAcc,nKimAcc));
		else
		AddNews(format("§¹i chiÕn Tèng Kim ®· kÕt thóc. TÝch lòy Tèng %d:%d Kim. TrËn nµy ®· hßa!",nTongAcc,nKimAcc));
		end
		for i=0,21 do
			SetMission(i,0);
		end
		CloseMission(1);	--dong mission
	elseif(SubWorld == SubWorldID2Idx(337)) then
		ontime_phonglangdo(nIndex)
	end
end;

function ontime_phonglangdo(nIndex)
	StopMissionTimer(nIndex,3);
	local nCount = GetMSPlayerCount(1);
	for i=1,nCount do
		if(GetPMParam(1, i, 0) == 1) then --dang online
			PlayerIndex = MSDIdx2PIdx(1, i);
			SetDeathScript("") --set script khi chet
			SetLogoutRV(0);
			SetPKMode(0,0);--phuc hoi pk tu do
			SetPunish(0);
			NewWorld(336,RANDOM(1333,1349),RANDOM(2850,2861));
			SetTask(TASK_DUNGCHUNG,SetNumber(1,GetTask(TASK_DUNGCHUNG),2,1));
		end
	end
	CloseMission(1);	--dong mission
end;
