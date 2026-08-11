--hoangnhk
Include("\\script\\lib\\serverscript.lua");
Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\npcfile.lua");
Include("\\script\\header\\bosstieuhk.lua");
Include("\\script\\header\\vuotai.lua");
Include("\\script\\header\\tongkim.lua");
Include("\\script\\event\\demhuyhoang\\event.lua");
Include("\\script\\event\\hoadang\\lib.lua");
Include("\\script\\player\\playerlogin.lua");
MSG_LIENDAU = "Vâ l©m kiÖt xuÊt %d ®· ®Õn giai ®o¹n b¸o danh. C¸c cao thñ mau nhanh ch©n ®¨ng kı thi ®Êu!"
Yr,Mth,Dy,Hr,Mn,Se = 0,0,0,0,0,0;

function main()
	Yr,Mth,Dy,Hr,Mn,Se = GetTime();
	if ((Hr == 0) and (Mn == 0)) then
		RLSvTask()
	end
	--boss tieu hoang kim
	if (SERVER_MODE == 1) then
		local nCurTime = tonumber(GetLocalDate("%y%m%d%H%M"))
		if(nCurTime == SERVER_OPEN) then
			addfullnpc();
		end;
	else
		addbosstieuhk()
		--huy hoang
		addhuyhoang()
		--thach thuc thoi gian
		active_vuotai()
		--lien dau
		active_liendau()
		--phonglangdo
		active_phonglangdo()
		--hoa dang
		active_hoadang()
		--xo so'
		active_somayman()
		--tongkim nªn ®Æt ë dßng cuèi cïng
		active_tongkim()
	end;
end;

function RLSvTask()
	if(Hr ~= 0 or Mn ~= 0) then
	return end
	SetData(DATA_DCHAVERES,0);
	SaveDataFile();
	for i=1,1199 do
		PlayerIndex = i;
		if(GetPlayerNpcIdx() > 0) then
		RLTask();
		end
	end
end

function addbosstieuhk() 
    if (Hr == 18 and Mn == 10 )then
	releasebosstieu()
	return end
    if (Hr == 22 and Mn == 10) then
	releasebosstieu()
	return end
end;

function addhuyhoang()
--qua huy hoang
	if(Hr == 12 and Mn == 0) then
	addhhh()
	return end
	if(Hr == 12 and Mn == 10) then
	addhhh()
	return end
	if(Hr == 12 and Mn == 20) then
	addhhh()
	return end
end;

function active_vuotai()
	--Check thoi gian
	if(Mn == 0) then
		AddCountNews(10221,3)
		local nSubWorldId;
		for i=1,getn(MAP_VUOTAI) do
			nSubWorldId = SubWorldID2Idx(MAP_VUOTAI[i])
			if (nSubWorldId >= 0) then
			SubWorld = nSubWorldId;
			OpenMission(1)
			StartMissionTimer(1,1, 5400)--so phut de chinh thuc bat dau
			end
		end
	end
	--thong bao bat dau
	if(Mn == 5) then
		AddCountNews(10247,3)
	end
end;

function active_liendau()
	if (Hr == 18)	then
		if(Mn == 0 or Mn == 15 or Mn == 30 or Mn == 45) then
			Msg2SubWorld(format(MSG_LIENDAU,floor(Mn/15)+1))
			local nSubWorldId = SubWorldID2Idx(396)
			if (nSubWorldId >= 0) then
			SubWorld = nSubWorldId;
			OpenMission(1)
			StartMissionTimer(1,1, 5400)--so phut de chinh thuc bat dau
			end
		end
	elseif(Hr == 19 and Mn == 0) then
		SaveDataFile();
	end
end;

function active_phonglangdo()
	--Check thoi gian
	if(Mn == 1) then
		AddCountNews(10137,3)
		local nSubWorldId;
			nSubWorldId = SubWorldID2Idx(337)
			if (nSubWorldId >= 0) then
			SubWorld = nSubWorldId;
			OpenMission(1)
			StartMissionTimer(1,1, 9720)--so phut de chinh thuc bat dau
			end
	end
end

function active_somayman()
	if(Hr == 16 and Mn == 45) then
		SetData(DATA_DCHAVERES,1);
		SetData(DATA_DATCUOC,GetDataInt(DATA_DATCUOC)+1);
		
		local nDataID=DATA_DCBEGIN;
		if(nDataID > 1) then
		repeat
			local nRandNum = random(99);
			local nReplace=1;
			for i =DATA_DCBEGIN,(DATA_DCBEGIN+nDataID) do
				if(GetDataInt(i) == nRandNum) then
					nReplace=0;
					i=DATA_DCBEGIN+nDataID;
				end;
			end;
			if(nReplace==1) then
			SetData(nDataID,nRandNum);
			nDataID=nDataID+1;
			end;
		until (nDataID >=DATA_DCEND)
		end;
		for i=DATA_DCBEGIN,DATA_DCEND do
		SetData(i,random(99));
		end
		Msg2SubWorld("HiÖn t¹i ®· cã kÕt qu¶ 'con sè may m¾n'. Quı ®ång ®¹o xem t¹i <color=yellow>ThÇn Tµi<color> (BiÖn Kinh 220/190).");
	end;
end;

function active_tongkim()
	--Check thoi gian
	local nSubWorldId = SubWorldID2Idx(380)
	if (nSubWorldId >= 0) then
	
	for i=1,getn(TONGKIM_TIMER) do
		if(Hr == TONGKIM_TIMER[i][1] and Mn == 0) then
			SubWorld = nSubWorldId;
			OpenMission(1,TONGKIM_KIND[TONGKIM_TIMER[i][2]],2,0,1,3)
			SetMission(0,TONGKIM_TIMER[i][2])
			AddCountNews("TrËn ®¸nh Tèng Kim h×nh thøc "..GetMissionName(1).." ®ang hÕt søc c¨ng th¼ng, tr­íc m¾t ®ang ë giai ®o¹n b¸o danh, nh÷ng ai muèn tham chiÕn xin h·y nhanh chãng ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®¨ng kı b¸o danh; HoÆc sö dông Tèng Kim chiªu th­ ®Ó nhanh chãng ®Õn ®iÓm b¸o danh. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40. phİ b¸o danh 3000 l­îng",3);
			AddCountNews2(10222,3)
			StartMissionTimer(1,1, 10*1080)--so phut de chinh thuc bat dau
			if(GetMissionV(0) == 1) then
				StartMissionTimer(1,2, 40*1080)--thoi gian nguyen soai ra
			end;
			StartMissionTimer(1,3, 60*1080)--tong thoi gian ca tran
		end
	end
	--thoi gian bao danh con lai
	SubWorld = nSubWorldId;
	local RestTK = GetMSRestTime(1,1);
	local Minute;
	if (RestTK > 0) then
		Minute = floor(RestTK/1080);
		if(Minute == 7 or Minute == 3) then
		AddCountNews(format("Tèng Kim ®¹i chiÕn ph­¬ng thøc %s ®ang trong thêi gian b¸o danh, mäi ng­êi h·y mau ®Õn T­¬ng D­¬ng hoÆc Chu Tiªn trÊn ®Ó b¸o danh, hoÆc cã thÓ dïng Tèng Kim chiªu th­ ®Ó trùc tiÕp ®Õn ®iÓm b¸o danh. §iÒu kiÖn tham gia: ®¼ng cÊp tõ 40, phİ b¸o danh 3000 l­îng. Sau khi khai chiÕn, nÕu tæng sè ng­êi ch­a ®ñ vÉn cã thÓ tiÕp tôc b¸o danh!",GetMissionName(1)));
		AddCountNews2(format("Thêi gian b¸o danh Tèng Kim cßn l¹i lµ %d phót.",Minute),3)
		end
	end
	end
end;