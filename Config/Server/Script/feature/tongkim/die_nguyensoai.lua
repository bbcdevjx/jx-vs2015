Include("\\script\\header\\tongkim.lua");
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\event_head.lua");
--nguoi choi danh quai' cuoi cung` khi chet
function LastDamage(NpcIndex)
	if(SubWorld == SubWorldID2Idx(380)) then
		if(random(300) == 299) then
		end
		local szName = GetName();
		local nPlayerCamp = GetCurCamp();
		local nCount = GetMSPlayerCount(1);
		local i;
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
			AddAccum(nTotalAccum);
			if(nCamp == 1) then --tong
			NewWorld(325,RANDOM(1537,1548), RANDOM(3160,3195));
			SetRevPos(325,1)
			else	--kim
			NewWorld(325,RANDOM(1566,1588), RANDOM(3079,3096));
			SetRevPos(325,2)
			end
			SetDeathScript("") --set script khi chet
			SetCurCamp(GetCamp());--phuc hoi phe ban dau
			--event----------------
			addevent(6);
			--end------------------
		end
		end
		if(nPlayerCamp == 1) then
		AddNews(format("%s giÕt chÕt Nguyªn so¸i cña phe Kim. KÕt thóc trËn chiÕn, phe Tèng giµnh th¾ng lîi!",szName));
		else
		AddNews(format("%s giÕt chÕt Nguyªn so¸i cña phe Tèng. KÕt thóc trËn chiÕn, phe Kim giµnh th¾ng lîi!",szName));
		end
		--NewWorld(325,RANDOM(1537,1548), RANDOM(3160,3195));
		for i=0,21 do
			SetMission(i,0);
		end
		CloseMission(1);	--dong mission
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
