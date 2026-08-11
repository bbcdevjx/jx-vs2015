Include("\\script\\header\\loidai.lua");

CAPTAINNAME = {};
function main()
	if(SERVER_MODE==1) then
		Talk(1, "", "L«i ®µi t¹m thêi ch­a më.") 
	return end;

	local w,x,y = GetWorldPos();
	SetTask(BW_SIGNPOSWORLD, w);
	SetTask(BW_SIGNPOSX, x);
	SetTask(BW_SIGNPOSY, y);
	
	CAPTAINNAME = joinname();

	local nMapIndex = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (nMapIndex == -1) then
		Talk(1,"","B¸o danh bÞ lçi, xin mêi liªn hÖ GM!");
	return end;
	
	OldSubWorld = SubWorld;
	SubWorld = nMapIndex;
	local nMemberCount =GetMissionV(MS_MAXMEMBERCOUNT)
	local nMSS = GetMissionV(MS_STATE);

	if (nMSS == 0) then 
		Say("§©y lµ ®Êu tr­êng thi ®Êu l«i ®µi, n¬i c¸c nh©n sÜ trªn giang hå ®¬n ®Êu hoÆc tæ chøc thi ®Êu ®éi. HiÖn t¹i ch­a cã ai b¸o danh thi ®Êu, c¸c h¹ cã muèn b¸o danh kh«ng? <color=yellow>HiÖn t¹i më miÔn phÝ l«i ®µi<color>", 3, "§­îc th«i/Dangky", "Quy t¾c thi ®Êu ra sao?/Hotro", "§Ó suy nghÜ c¸i ®·!/no");
	elseif (nMSS == 1) then
		Say("§©y lµ diÖn vâ tr­êng, §éi <color=yellow>"..CAPTAINNAME[1].."<color>cïng §éi <color=yellow>"..CAPTAINNAME[2].."<color> tranh tµi <color=yellow>"..nMemberCount.." vs "..nMemberCount.."<color>, Ng­¬i cã yªu cÇu g×?",4,"Ta lµ ®éi tr­ëng, muèn biÕt sè thø tù vµo ®Êu tr­êng./joinkey", "Ta lµ tuyÓn thñ, muèn th­îng l«i ®µi./gamerjoin", "Ta muèn xem thi ®Êu./audiencejoin", "Ta kh«ng cã høng thó./no")
	elseif (nMSS == 2) then 
		Say("HiÖn thêi §éi "..CAPTAINNAME[1].." vµ §éi "..CAPTAINNAME[2].." ®ang thi ®Êu", 1, "Quay l¹i sau./no");
	else
		Say("Tham gia thi ®Êu ph¶i mang ®ñ ng©n l­îng",0)
	end;
	SubWorld = OldSubWorld;
end;

function Dangky()
	if (GetTeamSize()  ~= 2) then
		Say("Muèn ghi danh ph¶i lµ <color=yellow>§éi tr­ëng<color>. §éi cña c¸c h¹ kh«ng ®ñ <color=yellow>2<color> ng­êi.", 0);
		return end;

	if (IsCaptain() ~= 1) then 
		Say("Ng­êi b¸o danh ph¶i lµ §éi tr­ëng",0);
		return end;

	Say("C¸c h¹ muèn ®Êu l«i ®µi, sè ng­êi nhiÒu nhÊt mçi bªn lµ bao nhiªu", 9, "Rêi khái!/no", "1 ®Êu 1/Hoantatdangky", "2 ®Êu 2/Hoantatdangky", "3 ®Êu 3/Hoantatdangky","4 ®Êu 4/Hoantatdangky","5 ®Êu 5/Hoantatdangky","6 ®Êu 6/Hoantatdangky","7 ®Êu 7/Hoantatdangky","8 ®Êu 8/Hoantatdangky");
end;

function Hoantatdangky(MemberCount)
	if (GetTeamSize()  ~= 2) then
		Say("Muèn ghi danh ph¶i lµ <color=yellow>§éi tr­ëng<color> §éi cña c¸c h¹ kh«ng ®ñ<color=yellow>2<color> ng­êi.", 0);
		return end;
	
	if (MemberCount <= 0 or MemberCount > 8) then
		return end
	
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	nMSS = GetMissionV(MS_STATE);

	if (nMSS ~= 0) then 
		Say("²Kh«ng ®­îc, ®· cã ng­êi ghi danh thi ®Êu!",0);
		return
	end
	OpenMission(BW_MISSIONID);
	StartMissionTimer(BW_MISSIONID, BW_SMALLTIME_ID, TIMER_1);

	SetMission(MS_STATE, 1);
	local x = GetTask(BW_SIGNPOSWORLD);
	SetMission(CITYID,GetWorldName(x))

	local key = {};
	key = Randkey();
	SetMission(MS_TEAMKEY[1], key[1]);
	SetMission(MS_TEAMKEY[2], key[2]);
	
	OldPlayerIndex = PlayerIndex;
	for i = 0,1 do 
		PlayerIndex = GetTeamMem(i);
		SetMission(MSS_CAPTAIN[i+1], GetName());
		CAPTAINNAME = joinname();
		if (MemberCount > 1) then
			Msg2Team("Sè thø tù vµo ®Êu tr­ëng cña ®éi bµn lµ: <color=Yellow>"..key[i+1]);
		end;
	end;
	
	PlayerIndex = OldPlayerIndex;
	SetMission(MS_MAXMEMBERCOUNT, MemberCount)
	str = "B©y giê "..GetMissionS(CITYID).." §éi <color=yellow>"..CAPTAINNAME[1].."<color> tranh tµi cïng §éi <color=yellow>"..CAPTAINNAME[2].."<color>. L«i ®µi chuÈn bÞ b¾t ®Çu, hai ®éi tr­ëng lµ "..CAPTAINNAME[1].." cïng "..CAPTAINNAME[2]..". L«i ®µi më cöa miÔn phÝ, xin mêi c¸c vÞ h¶o h÷u ®Õn xem.";
	Msg2SubWorld(str);
	local szMsg = format("C¸c thµnh viªn ®· ghi danh ë %d cïng %d tranh tµi, nhanh chãng vµo l«i ®µi, %d phót sau tranh tµi chÝnh thøc b¾t ®Çu.",MemberCount, MemberCount, floor(GO_TIME/3))
	Msg2Team(szMsg);
end;

function Randkey()
	local key = {};
	key[1] = random(1, 9999)
	key[2] = random(1, 9999)
	
	if (key[2] == key[1]) then
		if (key[1] < 9996) then
			key[2] = key[1] + 3
		else
			key[2] = key[1] - 3;
		end
	end
	return key;
end;



function Hotro()
	Talk(5, "",	"L«i ®µi lµ n¬i ®Ó häc hái kinh nghiÖm lÉn nhau.","Muèn tham gia l«i ®µi, tr­íc hÕt ph¶i ®Õn chç ta ghi danh.","Ghi danh tham gia l«i ®µi tranh tµi liÒn hoµn thµnh, bëi v× cuéc so tµi cã giíi h¹n, ®ang cã ng­êi thi ®Êu, c¸c h¹ kh«ng thÓ ghi danh!",format("Ghi danh sau thµnh c«ng, cã thÓ ®Õn chuÈn bÞ khu , chuÈn bÞ thêi gian lµ <color=yellow>%d<color> phót. NÕu kh«ng vµo ®ñ thµnh viªn trËn ®Êu sÏ bÞ hñy bá!", floor(GO_TIME/3)), format("Thêi gian thi ®Êu lµ <color=yellow>%d<color> phót, cã thÓ kÕt thóc tr­íc thêi gian khi thµnh viªn 1 bªn ng· xuèng hÕt.", floor(TIMER_SEC*(END_TIME-GO_TIME)/60)));
end;

function gamerjoin()
	local nIdx,nGr = FindItemEx(1,0,0);
	if(nIdx >0 and nGr ~= 1) then
		Talk(1,"","B¹n mang vËt phÈm kh«ng hîp lÖ, lÇn thi ®Êu l«i ®µi nµy chØ cã thÓ mang theo <color=Yellow>d­îc phÈm håi phôc vµ gi¶i ®éc");
	return end;
	for i=0,5 do
		for j=0,8 do
			nIdx,nGr = FindItemEx(3,i,j);
			if(nIdx >0 and nGr ~= 1) then
				Talk(1,"","B¹n mang vËt phÈm kh«ng hîp lÖ, lÇn thi ®Êu l«i ®µi nµy chØ cã thÓ mang theo <color=Yellow>d­îc phÈm håi phôc vµ gi¶i ®éc");
			return end;
			nIdx,nGr = FindItemEx(10,i,j);
			if(nIdx >0 and nGr ~= 1) then
				Talk(1,"","B¹n mang vËt phÈm kh«ng hîp lÖ, lÇn thi ®Êu l«i ®µi nµy chØ cã thÓ mang theo <color=Yellow>d­îc phÈm håi phôc vµ gi¶i ®éc");
			return end;
		end
	end;
	for i=0,2 do
		nIdx,nGr = FindItemEx(13,i);
		if(nIdx >0 and nGr ~= 1) then
			Talk(1,"","B¹n mang vËt phÈm kh«ng hîp lÖ, lÇn thi ®Êu l«i ®µi nµy chØ cã thÓ mang theo <color=Yellow>d­îc phÈm håi phôc vµ gi¶i ®éc");
		return end;
	end;
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		return
	end;
	
	if ((GetName() == CAPTAINNAME[1]) or (GetName() == CAPTAINNAME[2])) then 
		joinmap(0)
	else
		Say("Xin mêi nhËp sè lÇn thi ®Êu",2, "H·y khoan, cho ta lªn/Nhapkey", "Ta kh«ng nhí, chê mét chót ®Ó ta hái §éi tr­ëng/no")
	end;
	SubWorld = OldSubWorld;
end

function Nhapkey()
	Input("commomkey",9999);
end

function commomkey(Key)
	local OldSubWorld = SubWorld;
	SubWorld = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (SubWorld < 0) then
		SubWorld = OldSubWorld;
		return
	end;
	if (Key == GetMissionV(MS_TEAMKEY[1])) then
		joinmap(0)
	elseif (Key == GetMissionV(MS_TEAMKEY[2])) then
		joinmap(1)
	else
		Say("C¸c h¹ ®· nhËp sai, hoÆc hái §éi tr­ëng ®Ó x¸c ®Þnh l¹i, xin c¸m ¬n!",0)
	end
	SubWorld = OldSubWorld;
end

function audiencejoin()
	if(GetName() == CAPTAINNAME[1] or GetName() == CAPTAINNAME[2]) then
	Talk(1,"","§éi tr­ëng kh«ng thÓ trùc tiÕp quan chiÕn");
	return end;
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	OldSubWorld = SubWorld;
	SubWorld = idx;
	Say("§éi "..CAPTAINNAME[1].." vµ §éi "..CAPTAINNAME[2].." ®· s½n sµng thi ®Êu, biÕt ®éi nµo sÏ chiÕn th¾ng cuèi cïng kh«ng?", 2,
	"Ta muèn vµo l«i ®µi xem/commonaudience",
	"Kh«ng ph¶i l­ît cña ta,ta kh«ng vµo/no");
	SubWorld = OldSubWorld;
end;

function commonaudience()
	OldSubWorld = SubWorld;
	local idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx == -1) then
		return
	end;
	SubWorld = idx;
	if (GetName() == CAPTAINNAME[1]) then
		joinmap(0)
	elseif(GetName() == CAPTAINNAME[2]) then 
		joinmap(1)
	else
		joinmap(2);
	end;
	SubWorld = OldSubWorld
end

function joinmap(group)
	idx = SubWorldID2Idx(BW_COMPETEMAP[1]);
	if (idx < 0) then
		return
	end;
	OldSubWorld = SubWorld;
	SubWorld = idx;
	if (GetName() == CAPTAINNAME[1]) then 
		commonjoin(0)
	elseif (GetName() == CAPTAINNAME[2]) then 
		commonjoin(1)
	elseif (group == 0 or group == 1) then
		local masteridx = FindPlayer(GetMissionS(group))
		local masternum = 0
		if (masteridx > 0) then
			if (PIdx2MSDIdx(BW_MISSIONID, masteridx) > 0) then
				masternum = 1
			end
		end
		if (GetMSPlayerCount(BW_MISSIONID, group) - masternum < GetMissionV(MS_MAXMEMBERCOUNT) - 1) then
			commonjoin(group)
		else
			Say("Sè ng­êi thi ®Êu ®· ®ñ!",0);
		end;
	elseif (group == 2) then
		commonjoin(2);
	else
		Say("C¸c h¹ kh«ng ph¶i lµ tuyÓn thñ ®· b¸o danh v× vËy kh«ng thÓ vµo l«i ®µi, xin h·y ®øng ngoµi xem", 0);
	end;
	SubWorld=OldSubWorld;
end;

function no()
end;
