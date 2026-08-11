--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\event\\hoadang\\lib.lua");
STATION_ARRAY = {
{1 ,1  ,10072},
{2 ,11 ,15647},
{3 ,162,15648},
{4 ,37 ,10072},
{5 ,78 ,15646},
{6 ,80 ,15649},
{7 ,176,10072},
{8 ,20 ,10072},
{9 ,121,10072},
{10,53 ,15652},
{11,54 ,10072},
{12,174,15650},
{13,101,10072},
{14,99 ,10072},
{15,100,10072},
{16,153,15651}
};

GO_DIADOCHI={
{21, 2621, 4501},
{19, 3084, 3975},
{90, 1649, 3567},
{41, 2078, 2804},
{70, 1608, 3230},
{193, 1937, 2851},
{122, 1612, 3328},
{179, 1738, 2559},
{140, 2429, 3731},
{145,1613,3313},
{125,1809,3217},
{9, 2404, 5539},
{56, 1491, 3534},
{7, 2235, 2847},
{224,1628,3211},
{319, 1612, 3612},
{123, 1698, 3363},
{340, 1853, 3446},
{320, 1137, 3151},
{321, 966, 2296},
{322, 2048,4120},
{336, 1112, 3189},
{75, 1671, 3345},
{225,1472,3264},
{226,1557,3177},
{227,1522,3275},
{124, 1672, 3420}
};

TRAIN_ARRAY1= {
[1] = {
	"Thanh Thµnh S¬n [20]/selluyen1",
	"Vò L¨ng S¬n [20]/selluyen1",
	"Phôc Ng­u §«ng [30]/selluyen1",
	"Thôc C­¬ng S¬n [30]/selluyen1",
	"Phôc Ng­u T©y [40]/selluyen1",
	"Hoµng Hµ Nguyªn §Çu [40]/selluyen1",
	"Ta kh«ng muèn ®i/no"
	},
[2] = {
	{20,21,2621,4501},
	{20,70,1608,3230},
	{30,90, 1651,3571},
	{30,92,1632,3290},
	{40,41,2078,2805},
	{40,122,1612,3323}
	}
};

TRAIN_ARRAY2={
[1] = {
	"L­u Tiªn §éng [50]",
	"¸c b¸ ®Þa ®¹o [50]",
	"Tr­êng Giang [60]",
	"Hoµnh S¬n ph¸i [60]",
	"L©m Du Quan [70]",
	"L·o Hæ §éng [70]",
	"Sa M¹c §Þa BiÓu [80]",
	"Ch©n nói Tr­êng B¹ch [80]",
	"Tr­êng B¹ch S¬n Nam [90]",
	"Tr­êng B¹ch s¬n b¾c [90]",
	"Kháa Lang ®éng [90]",
	"Sa M¹c 1 [90]",
	"Sa M¹c 2 [90]",
	"Sa M¹c 3 [90]",
	"TiÕn cóc ®éng [90]",
	"C¸n viªn ®éng [90]",
	"Phong L¨ng ®é [100]",
	"M¹c Cao QuËt [100]",
},
[2] = {
	{50,125,1809,3208},
	{50,163,1558,3199},
	{60,9,2405,5540},
	{60,56,1493,3530},
	{70,319,1630,3592},
	{70,123,1698,3374},
	{80,224,1621,3214},
	{80,320,1146,3130},
	{90,198},
	{90,201},
	{90,74},
	{90,226},
	{90,227},
	{90,228},
	{90,147},
	{90,221},
	{100,224},
	{100,225},
}
};

NO_PLACE = "Ng­¬i hiÖn kh«ng cã nhiÖm vô nµo cÇn ph¶i ®i!"
function main(nNpcIdx)
	if(GetLevel() < 10) then
	Talk("",1,10083);
	return end;
	local curstationid = 0; --id Ba Lang Huyen = 10
	SetTaskTemp(SEL_MOVEARRAY, 0);
	local w,x,y = GetWorldPos();
	for i=1,getn(STATION_ARRAY) do
		if(w == STATION_ARRAY[i][2]) then
		curstationid = i;
		SetTaskTemp(SEL_MOVEARRAY, i);
		end
	end
	
	if(curstationid == 0) then
	return end
	
	if(curstationid < 8) then
	if(hoadang_open() == 1 and (GetWorldKind(w) == 1 or GetWorldKind(w) == 2)) then
		Say("LINK:<npc>",0,STATION_ARRAY[curstationid][3],9,
		"Nh÷ng n¬i ®· ®i qua/noidiqua",
		"Nh÷ng thµnh thÞ ®· ®i qua/thanhthidiqua",
		"Trë l¹i ®Þa ®iÓm cò /diadiemcu",
		"Khu vùc luyÖn c«ng/luyencong2",
		"§i Hoa S¬n c¶nh kü tr­êng/hoason",
		"§i TÈy Tñy ®¶o/taytuydao",
		"§i ®Õn n¬i lµm nhiÖm vô d· tÈu/datau",
		"§i b¶n ®å Hoa ®¨ng/dikhuvuchoadang",
		"Ta kh«ng muèn ®i/out")
	else
		Say("LINK:<npc>",0,STATION_ARRAY[curstationid][3],8,
		"Nh÷ng n¬i ®· ®i qua/noidiqua",
		"Nh÷ng thµnh thÞ ®· ®i qua/thanhthidiqua",
		"Trë l¹i ®Þa ®iÓm cò /diadiemcu",
		"Khu vùc luyÖn c«ng/luyencong2(1)",
		"§i Hoa S¬n c¶nh kü tr­êng/hoason",
		"§i TÈy Tñy ®¶o/taytuydao",
		"§i ®Õn n¬i lµm nhiÖm vô d· tÈu/datau",
		"Ta kh«ng muèn ®i/out")
	end
	else
		Say(STATION_ARRAY[curstationid][3],6,
		"Nh÷ng n¬i ®· ®i qua/noidiqua",
		"Nh÷ng thµnh thÞ ®· ®i qua/thanhthidiqua",
		"Trë l¹i ®Þa ®iÓm cò /diadiemcu",
		"Khu vùc luyÖn c«ng/luyencong1",
		"§i ®Õn n¬i lµm nhiÖm vô d· tÈu/datau",
		"Ta kh«ng muèn ®i/out")
	end
end;

function luyencong1()
	Say(10072,getn(TRAIN_ARRAY1[1]),
	TRAIN_ARRAY1[1])
end;

function luyencong2(nMapBegin)
	local nTrainCount=getn(TRAIN_ARRAY2[1]);
	if(nTrainCount <= 0) then
	return end;
	local nMapPPage=4;
	local TRAIN_ARRAY = {};
	local nMapEnd=nMapBegin+nMapPPage;
	if(nMapEnd >nTrainCount) then
		nMapEnd = nTrainCount;
	end
	for i=nMapBegin,nMapEnd do
	tinsert(TRAIN_ARRAY,TRAIN_ARRAY2[1][i].."/selluyen2("..i..")");
	end;
	if(nMapBegin >nMapPPage) then
		tinsert(TRAIN_ARRAY,"Trang tr­íc/luyencong2("..nMapBegin-nMapPPage.."");
	end;
	if(nMapEnd <nTrainCount) then
		tinsert(TRAIN_ARRAY,"Trang kÕ/luyencong2("..(nMapEnd+1).."");
	end;
	tinsert(TRAIN_ARRAY,"Ta kh«ng muèn ®i/no");
	Say(10072,getn(TRAIN_ARRAY),TRAIN_ARRAY);
end;

function selluyen1(sel)
	local nSel = sel + 1;
	if(GetLevel() < TRAIN_ARRAY1[2][nSel][1]) then
	Talk(1,"",15645)--phia truoc nguy hiem
	return end
	if(NewWorld(TRAIN_ARRAY1[2][nSel][2],TRAIN_ARRAY1[2][nSel][3],
	TRAIN_ARRAY1[2][nSel][4]) == 1) then
		SetFightState(1)
	end
end;

function selluyen2(nSel)
	if(GetLevel() < TRAIN_ARRAY2[2][nSel][1]) then
	Talk(1,"",15645)--phia truoc nguy hiem
	return end
	if(getn(TRAIN_ARRAY2[2][nSel]) == 2) then
		local nW, nX, nY = GetWayPointPos(TRAIN_ARRAY2[2][nSel][2])
		nFightState = GetWayPointFight(TRAIN_ARRAY2[2][nSel][2])
		nResult = NewWorld(nW, nX, nY)
		if (nResult == 1) then
		SetFightState(nFightState)
		end
	elseif (getn(TRAIN_ARRAY2[2][nSel]) == 4) then
		if(NewWorld(TRAIN_ARRAY2[2][nSel][2],TRAIN_ARRAY2[2][nSel][3],
		TRAIN_ARRAY2[2][nSel][4]) == 1) then
			SetFightState(1)
		end
	else
		return end;
end;

function datau()
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local bAccept = GetNumber(1,nTaskValue, 1);--[1]
	local nKind = GetNumber(2,nTaskValue, 4);
	if(bAccept == 0) then
		Talk(1,"",NO_PLACE);
	return end
	
	if(nKind ~= 6 and nKind ~= 7) then
		Talk(1,"",NO_PLACE);
	return end
	
	local nMap = GetNumber(3,GetTask(TASK_DIADOCHI),1);
	for i=1,getn(GO_DIADOCHI) do
		if(GO_DIADOCHI[i][1] == nMap) then
			if(NewWorld(nMap, GO_DIADOCHI[i][2], GO_DIADOCHI[i][3])) then
				SetFightState(1)
			end
		return end
	end
	
end;

function hoason()
	if(NewWorld(2,2609,3590)) then
		Msg2Player("B¹n ®ang ®Õn Hoa S¬n c¶nh kü tr­êng!");
	end;
end

function thanhthidiqua()
	local count = 0;
	local StationTab = {};
	
	local nMoveAR = GetTaskTemp(SEL_MOVEARRAY)
	if(nMoveAR == 0) then
	return end
	
	local price = -1;
	for i=1,getn(STATION_ARRAY) do
		price = GetPrice2Station(nMoveAR, i);
		if(price > 0) then
		StationTab[count+1] = GetStationName(i) .. " [" .. price .. " l­îng]" .. "/SelStation";
		SetTaskTemp(SEL_MOVEBEGIN+count,i);
		count = count + 1;
		end
	end
	
	if(count == 0) then
	return end
	
	StationTab[count+1] = "Kh«ng ®i ®©u c¶ /out";
	Say("§¹i hiÖp muèn ®i ®©u:",count+1,StationTab)
end;

function noidiqua()
	p1 = GetWayPoint(1);
	p2 = GetWayPoint(2);
	p3 = GetWayPoint(3);
	WAYPOINT={};
	local i = 1;
	if (p1 ~= 0)  then
	name = GetWayPointName(p1);
	name = name .."/SelWayPoint";
	WAYPOINT[i]= name;
	i = i + 1;
	end;
	
	if (p2 ~= 0)  then
	name = GetWayPointName(p2);
	name = name .."/SelWayPoint";
	WAYPOINT[i]= name;
	i = i + 1;
	end;
	
	if (p3 ~= 0)  then
	name = GetWayPointName(p3);
	name = name .."/SelWayPoint";
	WAYPOINT[i]= name;
	i = i + 1;
	end;
	
	WAYPOINT[i] = "Kh«ng ®i ®©u c¶ /no";
	if (i == 1) then 
	Talk(1,"",10071);
	else
	Say("H·y lùa chän:", i, WAYPOINT);
	end;
end;

function SelWayPoint(nSel)
	local nWayPoint = GetWayPoint(nSel + 1);
	if (nWayPoint ~= 0) then
	local nW, nX, nY = GetWayPointPos(nWayPoint)
	nFightState = GetWayPointFight(nWayPoint)
	nResult = NewWorld(nW, nX, nY)
	if (nResult == 1) then
	SetFightState(nFightState)
	end
	end
end;

function SelStation(nSel)
	local nMoveAR = GetTaskTemp(SEL_MOVEARRAY);
	local nMoveSel = GetTaskTemp(SEL_MOVEBEGIN+nSel);
	local nPrice = GetPrice2Station(nMoveAR, nMoveSel);
	local nMoney = GetCash();
	if(nMoney < nPrice) then
	Talk(1,"",10076);
	else
	local nW , nX, nY = GetStationPos(nMoveSel);
		if(NewWorld(nW, nX , nY ) == 1) then
			Pay(nPrice);
			Msg2Player("Ngåi yªn! Chóng ta ®i "..GetStationName(nMoveSel).."!");
		end
	end
end;

function diadiemcu()
	if (ReturnFromPortal() <= 0) then
		Talk(1,"","B¹n kh«ng cã ®iÓm l­u täa ®é ®Ó quay l¹i");
	end
end;

function taytuydao()
	if(GetLevel() < 50) then
		Talk(1,"","§¼ng cÊp 50 trë lªn míi ®­îc ®Õn TÈy Tñy ®¶o!")
	return end
	local nValue = GetNumber(1,GetTask(TASK_DAOTAYTUY),4);
	if(nValue == 0) then
		Say(12243,2,
		"§­a ta ®Õn TÈy Tñy ®¶o/taymienphi",
		"Tho¸t/no")
	return end
	
	Say(12917,4,
	"TÈy ®iÓm kü n¨ng/taykynang",
	"TÈy ®iÓm tiÒm n¨ng/taytiemnang",
	"TÈy ®iÓm kü n¨ng lÉn tiÒm n¨ng/tayall",
	"Tho¸t/no")
	
end;

function taykynang()
	local nTT1 = GetItemCount(0,4,238)
	local nTT2 = GetItemCount(0,4,239)
	local nTT3 = GetItemCount(0,4,240)
	local nTotal = nTT1 + nTT2 + nTT3
	if(nTotal < 3) then
		Talk(1,"","CÇn 3 viªn Thñy Tinh. Ng­¬i kh«ng mang ®ñ råi!")
	return end
	nTotal = 3;
	local nCityIndex = -1;
	local nCurSW = GetWorldPos();
	if (nCurSW == 1) then
		nCityIndex = 1;
	elseif (nCurSW == 11) then
		nCityIndex = 2;
	elseif (nCurSW == 162) then
		nCityIndex = 3;
	elseif (nCurSW == 137) then
		nCityIndex = 4;
	elseif (nCurSW == 78) then
		nCityIndex = 5;
	elseif (nCurSW == 80) then
		nCityIndex = 6;
	elseif (nCurSW == 176) then
		nCityIndex = 7;
	else
		Msg2Player("HÖ thèng xuÊt hiÖn sù cè! Vui lßng t×m nh©n viªn phôc vô x¸c nhËn gi¶i quyÕt vÊn ®Ò. ");
		return
	end	
	if(NewWorld(242,1613,3197) == 1) then
		for i=1,3 do
			if(nTotal > 0 and nTT1 > 0) then
			DelItem(1,0,4,238)
			nTotal = nTotal - 1
			nTT1 = nTT1 - 1
			end
		end
		for i=1,3 do
			if(nTotal > 0 and nTT2 > 0) then
			DelItem(1,0,4,239)
			nTotal = nTotal - 1
			nTT2 = nTT2 - 1
			end
		end
		for i=1,3 do
			if(nTotal > 0 and nTT3 > 0) then
			DelItem(1,0,4,240)
			nTotal = nTotal - 1
			nTT3 = nTT3 - 1
			end
		end
		local nValue = SetNumber(1,GetTask(TASK_DAOTAYTUY),7,1);
		local w,rv = GetCurRev();
		nValue = SetNumber(3,nValue,1,w);
		nValue = SetNumber(2,nValue,3,rv);
		nValue = SetNumber(1,nValue,8,nCityIndex);
		SetTask(TASK_DAOTAYTUY, nValue);
		SetRevPos(242,1) --diem phuc sinh tren dao tay tuy
		ForbidUseTownP(1);
		SetPunish(0);
		Msg2Player("Ngåi yªn. Chóng ta ®i TÈy Tñy ®¶o!");
	end
end

function taytiemnang()
	if(GetItemCount(0,4,353) < 6) then
		Talk(1,"","CÇn 6 viªn Tinh Hång b¶o th¹ch. Ng­¬i kh«ng mang ®ñ råi!")
	return end
	local nCityIndex = -1;
	local nCurSW = GetWorldPos();
	if (nCurSW == 1) then
		nCityIndex = 1;
	elseif (nCurSW == 11) then
		nCityIndex = 2;
	elseif (nCurSW == 162) then
		nCityIndex = 3;
	elseif (nCurSW == 137) then
		nCityIndex = 4;
	elseif (nCurSW == 78) then
		nCityIndex = 5;
	elseif (nCurSW == 80) then
		nCityIndex = 6;
	elseif (nCurSW == 176) then
		nCityIndex = 7;
	else
		Msg2Player("HÖ thèng xuÊt hiÖn sù cè! Vui lßng t×m nh©n viªn phôc vô x¸c nhËn gi¶i quyÕt vÊn ®Ò. ");
		return
	end
	if(NewWorld(242,1613,3197) == 1) then
		DelItem(1,0,4,353)
		local nValue = SetNumber(1,GetTask(TASK_DAOTAYTUY),7,2);
		local w,rv = GetCurRev();
		nValue = SetNumber(3,nValue,1,w);
		nValue = SetNumber(2,nValue,3,rv);
		nValue = SetNumber(1,nValue,8,nCityIndex);
		SetTask(TASK_DAOTAYTUY, nValue);
		SetRevPos(242,1) --diem phuc sinh tren dao tay tuy
		ForbidUseTownP(1);
		SetPunish(0);
		Msg2Player("Ngåi yªn. Chóng ta ®i TÈy Tñy ®¶o!");
	end
end

function tayall()
	local nTT1 = GetItemCount(0,4,238)
	local nTT2 = GetItemCount(0,4,239)
	local nTT3 = GetItemCount(0,4,240)
	local nTotal = nTT1 + nTT2 + nTT3
	local nTHBT = GetItemCount(0,4,353)
	if(nTotal < 3 or nTHBT < 6) then
		Talk(1,"","CÇn 3 Thñy tinh vµ 6 Tinh Hång b¶o th¹ch. Ng­¬i kh«ng mang ®ñ råi!")
	return end
	nTotal = 3
	local nCityIndex = -1;
	local nCurSW = GetWorldPos();
	if (nCurSW == 1) then
		nCityIndex = 1;
	elseif (nCurSW == 11) then
		nCityIndex = 2;
	elseif (nCurSW == 162) then
		nCityIndex = 3;
	elseif (nCurSW == 137) then
		nCityIndex = 4;
	elseif (nCurSW == 78) then
		nCityIndex = 5;
	elseif (nCurSW == 80) then
		nCityIndex = 6;
	elseif (nCurSW == 176) then
		nCityIndex = 7;
	else
		Msg2Player("HÖ thèng xuÊt hiÖn sù cè! Vui lßng t×m nh©n viªn phôc vô x¸c nhËn gi¶i quyÕt vÊn ®Ò. ");
		return
	end
	if(NewWorld(242,1613,3197) == 1) then
		DelItem(6,0,4,353)
		for i=1,3 do
			if(nTotal > 0 and nTT1 > 0) then
			DelItem(1,0,4,238)
			nTotal = nTotal - 1
			nTT1 = nTT1 - 1
			end
		end
		for i=1,3 do
			if(nTotal > 0 and nTT2 > 0) then
			DelItem(1,0,4,239)
			nTotal = nTotal - 1
			nTT2 = nTT2 - 1
			end
		end
		for i=1,3 do
			if(nTotal > 0 and nTT3 > 0) then
			DelItem(1,0,4,240)
			nTotal = nTotal - 1
			nTT3 = nTT3 - 1
			end
		end
		local nValue = SetNumber(1,GetTask(TASK_DAOTAYTUY),7,0);
		local w,rv = GetCurRev();
		nValue = SetNumber(3,nValue,1,w);
		nValue = SetNumber(2,nValue,3,rv);
		nValue = SetNumber(1,nValue,8,nCityIndex);
		SetTask(TASK_DAOTAYTUY, nValue);
		SetRevPos(242,1) --diem phuc sinh tren dao tay tuy
		ForbidUseTownP(1);
		SetPunish(0);
		Msg2Player("Ngåi yªn. Chóng ta ®i TÈy Tñy ®¶o!");
	end
end

function taymienphi()
	local nCityIndex = -1;
	local nCurSW = GetWorldPos();
	if (nCurSW == 1) then
		nCityIndex = 1;
	elseif (nCurSW == 11) then
		nCityIndex = 2;
	elseif (nCurSW == 162) then
		nCityIndex = 3;
	elseif (nCurSW == 137) then
		nCityIndex = 4;
	elseif (nCurSW == 78) then
		nCityIndex = 5;
	elseif (nCurSW == 80) then
		nCityIndex = 6;
	elseif (nCurSW == 176) then
		nCityIndex = 7;
	else
		Msg2Player("HÖ thèng xuÊt hiÖn sù cè! Vui lßng t×m nh©n viªn phôc vô x¸c nhËn gi¶i quyÕt vÊn ®Ò. ");
		return
	end
	if(NewWorld(242,1613,3197) == 1) then
		local nValue = SetNumber(1,GetTask(TASK_DAOTAYTUY),4,1);
		nValue = SetNumber(1,nValue,7,0);
		local w,rv = GetCurRev();
		nValue = SetNumber(3,nValue,1,w);
		nValue = SetNumber(2,nValue,3,rv);
		nValue = SetNumber(1,nValue,8,nCityIndex);
		SetTask(TASK_DAOTAYTUY, nValue);
		SetRevPos(242,1) --diem phuc sinh tren dao tay tuy
		ForbidUseTownP(1);
		SetPunish(0);
		Msg2Player("Ngåi yªn. Chóng ta ®i TÈy Tñy ®¶o!");
	end
end

function out()
	if(GetCash() <=0) then
	Talk(1,"",10084)
	end;
end;

function no()
end;