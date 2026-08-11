Include("\\script\\header\\taskid.lua");

function main()
	Say(12958,4,
	"Ta ®· cã ý trung nh©n, muèn cÇu h«n c« Êy/kethon",
	"Chóng t«i kh«ng hîp nhau, muèn ly h«n/lyhon",
	"Phu thª chóng t«i c¶i v· suèt ngµy, xin NguyÖt L·o gióp cho vµi lêi khuyªn/khuyen",
	"§ãng/no")
end

function kethon()
	if(GetTaskTemp(HAVELOVE_MALE) > 0) then
		Talk(1,"",12955)
	return end
	if(GetLoveName() ~= "") then
		if(GetSex() == 0) then
			Talk(1,"",12963)
		else
			Talk(1,"",12969)
		end
	return end
	if(GetSex() == 1) then
		Talk(1,"",12960)
	return end
	if(GetLevel() < 50) then
		Talk(1,"",12964)
		Msg2Player("B¹n ch­a ®ñ 50 cÊp!")
	return end
	local nSize = GetTeamSize()
	if(nSize < 2) then
		Talk(1,"",12970)
	return end
	if(nSize > 2) then
		Talk(1,"",10287)
	return end
	local tempid = PlayerIndex
	local nTeamId = GetTeam();
	for i=0,7 do
		local MemId = GetTeamMem(nTeamId, i)
		if(MemId > 0 and MemId ~= tempid) then
			PlayerIndex = MemId
			local nNpcIdx = GetPlayerNpcIdx()
			local sex = GetSex()
			PlayerIndex = tempid
			nNpcIdx = FindAroundNpc(GetNpcID(nNpcIdx))
			if(nNpcIdx <= 0) then
			Talk(1,"",12970)
			return end
			if(sex == 0) then
			Talk(1,"",12961)
			return end
		end
	end
	PlayerIndex = tempid
	Say(12965,2,
	"§óng, ta muèn cÇu h«n c« Êy/cauhon",
	"§Ó ta suy nghÜ l¹i/no")
end;

function cauhon()
	if(GetLoveName() ~= "") then
	return end
	if(GetCamp() ~= 4 and GetFactionNo() == 0 and GetTongName() == "") then
		Talk(1,"",12959)
	return end
	local nSize = GetTeamSize();
	if(nSize < 2) then
		Talk(1,"",12966)
	return end
	if(nSize > 2) then
		Talk(1,"",10287)
	return end
	local tempid = PlayerIndex;
	local nTeamId = GetTeam();
	local DesId = 0;
	for i=0,7 do
		local MemId = GetTeamMem(nTeamId, i);
		if(MemId > 0 and MemId ~= tempid) then
			PlayerIndex = MemId;
			local nNpcIdx = GetPlayerNpcIdx();
			local sex = GetSex();
			local love = GetLoveName();
			local level = GetLevel();
			local camp = GetCamp();
			local facno = GetFactionNo();
			local tog = GetTongName();
			PlayerIndex = tempid;
			nNpcIdx = FindAroundNpc(GetNpcID(nNpcIdx));
			if(nNpcIdx <= 0) then
			Talk(1,"",12966)
			return end
			if(sex == 0) then
			Talk(1,"",12961)
			return end
			if(love ~= "") then
			Talk(1,"",10290)
			return end
			if(level < 50) then
			Talk(1,"",10291)
			return end
			if(camp ~= 4 and facno == 4 and tog == "") then
			Talk(1,"",12962)
			return end
			DesId = MemId;
		end
	end
	PlayerIndex = tempid;
	SetTaskTemp(HAVELOVE_MALE, 1);
	Talk(1,"",10292);
	PlayerIndex = DesId;
	SetTaskTemp(HAVELOVE_FEMALE, tempid);
	SetTimer(18,4);
	
end;

function lyhon()
	if(GetLoveName() == "") then
		if(GetSex() == 0) then
			Talk(1,"",10314)
		else
			Talk(1,"",10315)
		end
	return end
	if(GetSex() == 1) then
		Talk(1,"",10316)
	return end
	local nSize = GetTeamSize()
	if(nSize < 2) then
		Talk(1,"",12979)
	return end
	Say(12977,2,"Ta muèn ly h«n ngay lËp tøc/xacnhanhuy","§Ó ta c©n nh¾c l¹i/no")
	
end;

function xacnhanhuy()
	local szLove1 = GetLoveName();
	if(szLove1 == "") then
	return end
	local nSize = GetTeamSize();
	if(nSize < 2) then
		Talk(1,"",12979)
	return end
	if(nSize > 2) then
		Talk(1,"",10317)
	return end
	local Name1 = GetName();
	local Name2;
	local tempid = PlayerIndex;
	local nTeamId = GetTeam();
	for i=0,7 do
		local MemId = GetTeamMem(nTeamId, i)
		if(MemId > 0 and MemId ~= tempid) then
			PlayerIndex = MemId
			Name2 = GetName();
			local szLove2 = GetLoveName();
			local nNpcIdx = GetPlayerNpcIdx();
			PlayerIndex = tempid;
			nNpcIdx = FindAroundNpc(GetNpcID(nNpcIdx));
			if(nNpcIdx <= 0) then
			Talk(1,"",12979)
			return end
			if(szLove1 ~= Name2 or szLove2 ~= Name1) then
			Talk(1,"",12978)
			return end
		end
	end
	PlayerIndex = tempid;
	if(GetCash() < 50000) then
		Talk(1,"",12981)
	return end
	MakeLove(Name2,1);
	Pay(50000);
end;

function khuyen()
	local nSize = GetTeamSize()
	if(nSize < 2) then
		if(GetSex() == 0) then
			Talk(1,"",12973)
		else
			Talk(1,"",12974)
		end
	return end
	if(nSize > 2) then
		if(GetSex() == 0) then
			Talk(1,"",12975)
		else
			Talk(1,"",12976)
		end
	return end
	local nTeamId = GetTeam();
	local tempid = PlayerIndex
	local desid;
	for i=0,7 do
		local nMemId = GetTeamMem(nTeamId, i)
		if(nMemId > 0 and nMemId ~= tempid) then
		desid = nMemId
		end
	end
	PlayerIndex = desid;
	local Name2 = GetName()
	local Love2 = GetLoveName()
	local nDesNpcId = GetPlayerNpcIdx()
	PlayerIndex = tempid;
	local Name1 = GetName()
	local Love1 = GetLoveName()
	if(FindAroundNpc(GetNpcID(nDesNpcId)) <= 0) then
		if(GetSex() == 0) then
			Talk(1,"",12973)
		else
			Talk(1,"",12974)
		end
	return end
	
	if(Love1 == "" or Name1 ~= Love2 or Name2 ~= Love1) then
		PlayerIndex = tempid;
		if(GetSex() == 0) then
			Talk(1,"",12975)
		else
			Talk(1,"",12976)
		end
	return end
	Talk(1,"",12972);
	PlayerIndex = desid;
	Talk(1,"",12972);
end;

function no()
end;