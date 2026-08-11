Include("\\script\\header\\revivepos_head.lua");
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\map_helper.lua");
Include("\\script\\header\\forbidmap.lua");
Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\npcfile.lua")
Include("\\script\\header\\loidai.lua");
Include("\\script\\header\\factionhead.lua");
SELECT_GO = "ThÇn hµnh ph? ®i ®Õn n¬i ng­¬i muèn."
SELECT_REVIVE = "ThiÕt ®Æt ®iÓm håi sinh cho lÇn sau s?dông th?®Þa ph?"
SELECT_OUT = "Rêi khái/no"
SUCCESS = "ThiÕt ®Æt ®iÓm håi sinh t¹i %s thµnh c«ng."
PLACE_TOGO = "H·y lùa chän n¬i cÇn ®Õn"

function no()
end;

function main(nIndex)
townportal_l()
end;

function townportal_l()
	if (GetTaskTemp(99) == 1 ) or ( SubWorldIdx2ID( SubWorld ) >= 387 and SubWorldIdx2ID( SubWorld ) <= 395)then
		Msg2Player("HiÖn t¹i ng­¬i kh«ng th?s?dông thÇn hµnh ph?");
		return 1
	end
	
	local nSubWorldID = GetWorldPos();
	if (nSubWorldID >= 375 and nSubWorldID <= 386) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc th? kh«ng th?s?dông thÇn hµnh ph?");
		return 1
	end
	
	if (nSubWorldID >= 416 and nSubWorldID <= 511) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc th? kh«ng th?s?dông thÇn hµnh ph?");
		return 1
	end
	
	if (nSubWorldID == 44 or nSubWorldID == 197 or nSubWorldID == 208 or nSubWorldID == 209 or nSubWorldID == 210 or nSubWorldID == 211 or nSubWorldID == 212 or (nSubWorldID >= 213 and nSubWorldID <= 223)	or nSubWorldID == 336 or nSubWorldID == 341 or nSubWorldID == 342	or nSubWorldID == 175	or nSubWorldID == 337	or nSubWorldID == 338	or nSubWorldID == 339 or ( nSubWorldID >= 387 and  nSubWorldID <= 395 ) )then 
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc th? kh«ng th?s?dông thÇn hµnh ph?");
		return 1
	end;

	if (CheckAllMaps(nSubWorldID) == 1) then
		Msg2Player("B¶n ®å hiÖn t¹i ng­¬i ®ang ®øng thuéc khu vùc ®Æc th? kh«ng th?s?dông thÇn q ph?");
		return 1
	end;
	
	if (GetLevel() < 10) then
		Say("Ng­êi ch¬i ph¶i ®¹t ®¼ng cÊp 10 tr?lªn míi c?th?s?dông thÇn hµnh ph?", 0);
		return 1
	end;
	Say(10195,10,
	"ThiÕt ®Æt ®iÓm håi sinh/diemphucsinh",
	"Chän n¬i muèn ®Õn/chondiadiem",
	"Tr?l¹i ®Þa ®iÓm c?/diadiemcu",
	SELECT_OUT)
end

function diadiemcu()
	ReturnFromPortal()
end;

function chondiadiem()
	Say(SELECT_GO,5,
	SELECT_OUT,
	"Thµnh th?/thanhthi",
	"Th«n trang/thon",
	--"M«n ph¸i/monphai",
	"ChiÕn tr­êng Tèng Kim/tongkim",
	"B¶n ®å luyÖn c«ng/bando"
	)
end;

function thanhthi()
	local count = 1;
	local CityTab = {};
	
	for i=1,getn(THANH_ARRAY) do
		CityTab[count] = THANH_ARRAY[i][2] .."/chonthanh";
		count = count + 1;
	end
	if(count == 1) then
	return end;
	CityTab[count] = SELECT_OUT;
	Say(SELECT_GO,count,CityTab)
end;

function chonthanh(nNo)
	local nSel = nNo + 1;
	local count = 1;
	local CityPosTab = {};
	SetTaskTemp(SEL_MOVEARRAY,nSel);
	for i=1,getn(THANH_ARRAY[nSel][3]) do
		CityPosTab[count] = THANH_ARRAY[nSel][3][i][2] .."/posthanh";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityPosTab[count] = SELECT_OUT;
	Say(SELECT_GO,count,CityPosTab);
end;

function posthanh(nNo)
	local nSel = nNo + 1;
	local nMoveAR = GetTaskTemp(SEL_MOVEARRAY);
	local w,x,y = Rev2Pos(THANH_ARRAY[nMoveAR][1],THANH_ARRAY[nMoveAR][3][nSel][1]);
	if(x ~= nil and x > 0) then
		if(NewWorld(w,floor(x/32),floor(y/32)) == 1) then
		SetFightState(0)
		Msg2Player("Xin h·y ngåi yªn, chóng ta ®i "..THANH_ARRAY[nMoveAR][3][nSel][2].." nµo!");
		end
	end;
end;

function thon()
local count = 1;
	local CityTab = {};
	for i=1,getn(THON_ARRAY) do
		CityTab[count] = THON_ARRAY[i][2] .."/chonthon";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityTab[count] = SELECT_OUT;
	Say(SELECT_GO,count,CityTab)
end;

function chonthon(nNo)
	local nSel = nNo + 1
	local w,x,y = Rev2Pos(THON_ARRAY[nSel][1],THON_ARRAY[nSel][3]);
	if(x ~= nil and x > 0) then
		if(NewWorld(w,floor(x/32),floor(y/32)) == 1) then
		SetFightState(0)
		Msg2Player("Xin h·y ngåi yªn, chóng ta ®i "..THON_ARRAY[nSel][2].." nµo!");
		end
	end;
end;

function monphai()
	if(1 == 1) then
	Talk(1,"","Chøc n¨ng t¹m thêi ch­a m?");
	return end
	local count = 1;
	local CityTab = {};
	
	for i=1,getn(MONPHAI_ARRAY) do
		CityTab[count] = MONPHAI_ARRAY[i][2] .."/chonmonphai";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityTab[count] = SELECT_OUT;
	Say(SELECT_GO,count,CityTab)
end;

function chonmonphai(nNo)
	local nSel = nNo +1;
	local w,x,y = Rev2Pos(MONPHAI_ARRAY[nSel][1],MONPHAI_ARRAY[nSel][3]);
	if(x ~= nil and x > 0) then
		if(NewWorld(w,floor(x/32),floor(y/32))==1) then
		SetFightState(0)
		end
	end;
end;

function tongkim()
	Say(PLACE_TOGO,3,
	SELECT_OUT,
	"§iÓm b¸o danh bªn Tèng/ditong",
	"§iÓm b¸o danh bªn Kim/dikim"
	)
end;

function ditong()
	if(NewWorld(325,1539,3186) == 1) then
		SetFightState(0)
	end
end;

function dikim()
	if(NewWorld(325,1581,3093) == 1) then
		SetFightState(0)
	end
end;

function bando()
	if (GetLevel() < 90) then
          Msg2Player("B¹n ch­a ®ñ ®¼ng cÊp ®i ®Õn n¬i luyÖn c«ng cÊp cao");
	return end;  
	local count = 1;
	local CityTab = {};
	
	for i=1,getn(PLACES_ARRAY) do
		CityTab[count] = GetWayPointName(PLACES_ARRAY[i]).."/chonbando";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityTab[count] = SELECT_OUT;
	Say(PLACE_TOGO,count,CityTab)
end;

function chonbando(nNo)
	local nSel = nNo + 1;
	local w,x,y = GetWayPointPos(PLACES_ARRAY[nSel]);
	if(NewWorld(w,x,y) == 1) then
		SetFightState(1)
	end;
end;

function diemphucsinh()
	Say(SELECT_REVIVE,3,
	SELECT_OUT,
	"Thµnh th?/psthanhthi",
	"Th«n trang/psthon"
	--"M«n ph¸i/psmonphai"
	)
end;

function psthanhthi()
	local count = 1;
	local CityTab = {};
	
	for i=1,getn(THANH_ARRAY) do
		CityTab[count] = THANH_ARRAY[i][2] .."/pschonthanh";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityTab[count] = SELECT_OUT;
	Say(SELECT_REVIVE,count,CityTab)
end;

function pschonthanh(nNo)
	local nSel = nNo + 1;
	local count = 1;
	local CityPosTab = {};
	SetTaskTemp(SEL_MOVEARRAY,nSel);
	for i=1,getn(THANH_ARRAY[nSel][3]) do
		CityPosTab[count] = THANH_ARRAY[nSel][3][i][2] .."/psposthanh";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityPosTab[count] = SELECT_OUT;
	Say(SELECT_REVIVE,count,CityPosTab)
end;

function psposthanh(nNo)
	local nSel = nNo + 1;
	local nMoveAR = GetTaskTemp(SEL_MOVEARRAY);
	SetRevPos(THANH_ARRAY[nMoveAR][1],THANH_ARRAY[nMoveAR][3][nSel][1]);
	Msg2Player(format(SUCCESS,THANH_ARRAY[nMoveAR][3][nSel][2]))
end;

function psthon()
local count = 1;
	local CityTab = {};
	for i=1,getn(THON_ARRAY) do
		CityTab[count] = THON_ARRAY[i][2] .."/pschonthon";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityTab[count] = SELECT_OUT;
	Say(SELECT_REVIVE,count,CityTab)
end;

function pschonthon(nNo)
	local nSel = nNo + 1;
	SetRevPos(THON_ARRAY[nSel][1],THON_ARRAY[nSel][3]);
	Msg2Player(format(SUCCESS,THON_ARRAY[nSel][2]))
end;

function psmonphai()
	if(1 == 1) then
	Talk(1,"","Chøc n¨ng t¹m thêi ch­a m?");
	return end
	local count = 1;
	local CityTab = {};
	
	for i=1,getn(MONPHAI_ARRAY) do
		CityTab[count] = MONPHAI_ARRAY[i][2] .."/pschonmonphai";
		count = count + 1;
	end
	if(count == 1) then
	return end
	CityTab[count] = SELECT_OUT;
	Say(SELECT_REVIVE,count,CityTab)
end;

function pschonmonphai(nNo)
	local nSel = nNo + 1;
	SetRevPos(MONPHAI_ARRAY[nSel][1],MONPHAI_ARRAY[nSel][3]);
	Talk(1,"", format(SUCCESS,MONPHAI_ARRAY[nSel][2]))
end;