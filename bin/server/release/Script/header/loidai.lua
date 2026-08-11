BW_COMPETEMAP = {209, 210, 211};
JOIN_REVID = 80;
JOIN_REVDATA = 36;
NPC_CAMPPOS = {
	{209, 1620, 3202},
	{209, 1612, 3187},
	{209, 1598, 3216}
}; 
NPC_CAMPSCRIPT = "\\script\\feature\\loidaicbt\\xaphu.lua"
FRAME2TIME = 18;
MAX_MEMBER_COUNT = 100;
BW_SIGNPOSWORLD = 60;
BW_SIGNPOSX = 61;
BW_SIGNPOSY = 62;
MS_STATE = 3;
MS_MAXMEMBERCOUNT = 4;
CITYID = 6;
BW_KEY = 7;
MS_NEWSVALUE = 9;
MS_TEAMKEY = {10, 11};
MSS_CAPTAIN = {1, 2};
BW_SMALLTIME_ID = 4;
TIMER_SEC = 20
TIMER_1 = TIMER_SEC * FRAME2TIME;
GO_TIME = 6;
END_TIME = GO_TIME+30;
BW_MISSIONID = 1;


function LeaveGame()
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then
	SetPMParam(1,nPlayerDataIdx,0,0)--setoffline
	end
	SetPKMode(0,0);
	SetFightState(0)
	SetPunish(0)
	ForbidChangePK(0);
	ForbidTrade(0);
	SetCurCamp(GetCamp());
	ForbidUseTownP(0)
	ForbidEnmity(0);
	SetLogoutRV(0);
	SetCreateTeam(1);	
end;

function GameOver()
	local nCount = GetMSPlayerCount(BW_MISSIONID);
	for i=1,nCount do
		if(GetPMParam(BW_MISSIONID, i, 0) == 1) then 
		PlayerIndex = MSDIdx2PIdx(1, i);
		LeaveGame();
		NewWorld(GetTask(BW_SIGNPOSWORLD), GetTask(BW_SIGNPOSX), GetTask(BW_SIGNPOSY));
		end;
	end;
end;

function commonjoin(Camp)
	LeaveTeam()
	local Camp1;
	if (Camp == 3) then
		Camp1 = 7;
	else
		Camp1 = Camp + 2;
	end
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then
	SetPMParam(1,nPlayerDataIdx,0,1)
	else	
	AddMSPlayer(BW_MISSIONID, Camp);
	end;
	SetCurCamp(Camp1)
	joined(Camp1);

	if (Camp == 0) then
		NewWorld(NPC_CAMPPOS[1][1], NPC_CAMPPOS[1][2], NPC_CAMPPOS[1][3])
	elseif (Camp == 1) then
		NewWorld(NPC_CAMPPOS[2][1], NPC_CAMPPOS[2][2], NPC_CAMPPOS[2][3])
	else 
		NewWorld(NPC_CAMPPOS[3][1], NPC_CAMPPOS[3][2], NPC_CAMPPOS[3][3])
	end;

	str = GetName().." ®· tiÕn vµo ®Êu tr­êng."
	Msg2MSAll(BW_MISSIONID, str);
end;

function SetRev()
	if (GetTask(BW_SIGNPOSWORLD) == 80) then
		SetRevPos(JOIN_REVID, JOIN_REVDATA)
	elseif (GetTask(BW_SIGNPOSWORLD) == 78) then 
		SetRevPos(29);--xy
	else
		SetRevPos(6);--cd
	end;
end;

function joined(Camp)
	SetFightState(0);
	SetLogoutRV(1);
	SetPunish(1);
	ForbidEnmity(1);
	ForbidTrade(1);
	SetCreateTeam(0);
	SetPKMode(2,1);
	if (Camp == 7) then
		Msg2Player("Träng tµi: Tr¹ng th¸i ®· ®­îc Èn");
	end;
	ForbidChangePK(1);
	ForbidUseTownP(1);
	SetRev();
	SetDeathScript("\\script\\player\\death_loidai.lua");

	local w = GetTask(BW_SIGNPOSWORLD);
	x = GetTask(BW_SIGNPOSX);
	y = GetTask(BW_SIGNPOSY);
	SetTempRevPos(w,x*32,y *32);
end;


function joinname()
	local OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(209);
	local CAPTAINNAME = {};
	if (idx == -1) then
		return CAPTAINNAME;
	end;
	SubWorld = idx;
	CAPTAINNAME[1] = GetMissionS(MSS_CAPTAIN[1]);
	CAPTAINNAME[2] = GetMissionS(MSS_CAPTAIN[2]);
	SubWorld = OldSubWorld;
	return CAPTAINNAME;
end;

function joinkey()
	OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(209);
	if (SubWorld < 0) then
		return
	end;
	local CAPTAINNAME = {};
	local CAPTAINNAME = joinname();
	if (GetMissionV(MS_MAXMEMBERCOUNT) <= 1) then
		Say("Ng­êi ®· ghi danh tham gia l«i ®µi, kh«ng cÇn biÕt sè lÇn tham gia, vÉn cã thÓ trùc tiÕp thi ®Êu.",0);
		SubWorld = OldSubWorld;
		return
	end
	local key = 0
	if (GetName() == CAPTAINNAME[1]) then
		key = GetMissionV(MS_TEAMKEY[1]);
	end
	
	if (GetName() == CAPTAINNAME[2]) then 
		key = GetMissionV(MS_TEAMKEY[2]);
	end
	if (key == 0) then
		Say("C¸c h¹ kh«ng ë s©n thi ®Êu trung, ta kh«ng thÓ nãi ra sè thø tù thi ®Êu.",0)
	else
		Say("Sè thø tù lµ <color=yellow>["..key.."]<color>. Nhanh lªn, h·y nãi cho c¸c thµnh viªn trong ®éi, thµnh viªn cã sè thø tù chÝnh x¸c míi cã thÓ vµo thi ®Êu", 0);
	end
	SubWorld = OldSubWorld;
end