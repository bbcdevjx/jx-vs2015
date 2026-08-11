--hoangnhk
Include("\\script\\header\\tongkim.lua");
Include("\\script\\header\\taskid.lua")

END_TALK="KÕt thóc ®èi tho¹i/no"
NEEDMONEY = 3000
NEEDLEVEL = 60
function main(NpcIndex)
	local nSubWorldId = SubWorldID2Idx(380)
	if nSubWorldId < 0 then	--chua mo map, ngung ham`
	return end
	SubWorld = nSubWorldId;--thang nay dang dung o map 325 (khac 380), nen phai dat bien toan` cau` SubWorld khac cho no' de su dung mission cua 380

	if(IsMission(1) == 0) then
		Say(10635,1,	--dai chien chua bat dau, ngung ham`
			END_TALK)
		return
	end
	local bTong = GetNpcValue(NpcIndex)
	if(bTong == nil) then
	return end
	
	local nPlayerDataIdx, nGroup, nTongMem, nKimMem = 0,0,0,0;
	if(bTong > 0) then	--------------------------------------------------ben Tong
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		nGroup = GetMSIdxGroup(1, nPlayerDataIdx)
		if(nGroup == 1) then	--nhom 1 da gia nhap phe Kim roi, ngung ham`
			Talk(1,"",10645)
		return end
		----da gia nhap phe tong, cho vao` trong
		Say("Quèc gia h­ng vong, thÊt phu h÷u tr¸ch! B©y giê lµ lóc ta vµ c¸c ng­¬i b¸o ¬n ®Êt n­íc!\n\n"..
		"HiÖn t¹i qu©n sè 2 bªn lµ: "..nTongMem.." --- "..nKimMem.."",2,
		"Gia nhËp Tèng qu©n/gianhaptong",
		"Rêi khái/out")
	return end
	if (GetMSRestTime(1,1) <= 0) then
		Say(10641,1,	--ngung gia nhap
			END_TALK)
		return
	end
	nTongMem = GetMSPlayerCount(1,0);
	nKimMem  = GetMSPlayerCount(1,1);
	if((nTongMem > nKimMem + 5) or nTongMem > 100) then --so luong da du~
		Talk(1,"",10648)
	return end
		local nTaskValue=GetTask(TASK_DUNGCHUNG3);
		local nCamp=GetNumber(1,nTaskValue,5);
		Say("Quèc gia h­ng vong, thÊt phu h÷u tr¸ch! B©y giê lµ lóc ta vµ c¸c ng­¬i b¸o ¬n ®Êt n­íc!\n\n"..
		"HiÖn t¹i qu©n sè 2 bªn lµ: "..nTongMem.." --- "..nKimMem.."",2,
		format("Gia nhËp Tèng qu©n%s/gianhaptong",nCamp==1 and "" or "(§iÓm c«ng tr¹ng trë vÒ 0)"),
		"Rêi khái/out")
	return end-------------------------------------------------

	
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		nGroup = GetMSIdxGroup(1, nPlayerDataIdx)
		if(nGroup == 0) then	--nhom 0 da gia nhap phe Tong roi
			Talk(1,"",10636)
		return end
		----da gia nhap phe kim, cho vao` trong
		Say("ThÒ chÕt còng trung thµnh víi §¹i Kim! §i nµo! Hìi c¸c dòng sÜ Kim quèc!\n\n"..
		"HiÖn t¹i qu©n sè 2 bªn lµ: "..nTongMem.." --- "..nKimMem.."",2,
		"Gia nhËp Kim qu©n/gianhapkim",
		"Rêi khái/out")
	return end
	if (GetMSRestTime(1,1) <= 0) then
		Say(10641,1,	--ngung gia nhap
			END_TALK)
		return
	end
	nTongMem = GetMSPlayerCount(1,0);
	nKimMem  = GetMSPlayerCount(1,1);
	if((nKimMem > nTongMem + 5) or nKimMem > 100) then --so luong da du~
		Talk(1,"",10639)
	return end
		local nTaskValue=GetTask(TASK_DUNGCHUNG3);
		local nCamp=GetNumber(1,nTaskValue,5);
		Say("ThÒ chÕt còng trung thµnh víi §¹i Kim! §i nµo! Hìi c¸c dòng sÜ Kim quèc!\n\n"..
		"HiÖn t¹i qu©n sè 2 bªn lµ: "..nTongMem.." --- "..nKimMem.."",2,
		format("Gia nhËp Kim qu©n%s/gianhapkim",nCamp==2 and "" or "(§iÓm c«ng tr¹ng trë vÒ 0)"),
		"Rêi khái/out")
		-------------------------------------------------
end;

function gianhaptong()
	local nSubWorldId = SubWorldID2Idx(380)
	if nSubWorldId < 0 then
	return end
	SubWorld = nSubWorldId;
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		SetPMParam(1,nPlayerDataIdx,0,1) --set online
		tongcommon(nPlayerDataIdx) --xu ly chi tiet
		return
	end
	
	--du cap, du tien moi duoc vao
	if(GetCash() < NEEDMONEY or GetLevel() < NEEDLEVEL) then
		Talk(1,"",format("B¹n kh«ng ®ñ <color=yellow>%d<color> cÊp hoÆc kh«ng ®ñ <color=yellow>%d<color> l­îng.", NEEDLEVEL, NEEDMONEY))
	return end
	
	nPlayerDataIdx = AddMSPlayer(1,0); --chua gia nhap, add vao` nhom' 0
	if( nPlayerDataIdx > 0) then
		Pay(NEEDMONEY)
		--Talk(1,"",10655) --hoan nghenh
		tongcommon(nPlayerDataIdx) --xu ly chi tiet
		AddMissionNote("D¹ng thøc: B¶o vÖ Nguyªn So¸i","Bèi c¶nh: N¨m 1160 C«ng nguyªn, Kim chñ Hoµn Nhan L­îng tËp hîp qu©n lùc, quyÕt ®Þnh Nam h¹, tiªu diÖt Tèng triÒu. T­¬ng D­¬ng lµ trë ng¹i ®Çu tiªn cña qu©n Kim, T­¬ng D­¬ng chuÈn bÞ ngËp ch×m trong khãi löa binh ®ao. <enter><enter><color=yellow>B¶o vÖ Nguyªn so¸i: sau khi khai chiÕn 30 phót, nguyªn so¸i 2 bªn sÏ lÇn luît xuÊt hiÖn.<enter> Môc tiªu: b¶o vÖ Nguyªn So¸i phe m×nh, tiªu diÖt Nguyªn So¸i phe ®Þch")
	end
end;

function gianhapkim()
	local nSubWorldId = SubWorldID2Idx(380)
		if nSubWorldId < 0 then
		return end
		SubWorld = nSubWorldId;
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--neu da gia nhap roi
		SetPMParam(1,nPlayerDataIdx,0,1) --set online
		kimcommon(nPlayerDataIdx)
		return
	end
	--du cap, du tien moi duoc vao
	if(GetCash() < NEEDMONEY or GetLevel() < NEEDLEVEL) then
		Talk(1,"",format("B¹n kh«ng ®ñ <color=yellow>%d<color> cÊp hoÆc kh«ng ®ñ <color=yellow>%d<color> l­îng.", NEEDLEVEL, NEEDMONEY))
	return end
	
	nPlayerDataIdx = AddMSPlayer(1,1); --chua gia nhap, add vao` nhom' 1
	if( nPlayerDataIdx > 0) then
		Pay(NEEDMONEY)
		--Talk(1,"",10655)
		kimcommon(nPlayerDataIdx)
		AddMissionNote("D¹ng thøc: B¶o vÖ Nguyªn So¸i","Bèi c¶nh: N¨m 1160 C«ng nguyªn, Kim chñ Hoµn Nhan L­îng tËp hîp qu©n lùc, quyÕt ®Þnh Nam h¹, tiªu diÖt Tèng triÒu. T­¬ng D­¬ng lµ trë ng¹i ®Çu tiªn cña qu©n Kim, T­¬ng D­¬ng chuÈn bÞ ngËp ch×m trong khãi löa binh ®ao. <enter><enter><color=yellow>B¶o vÖ Nguyªn so¸i: sau khi khai chiÕn 30 phót, nguyªn so¸i 2 bªn sÏ lÇn luît xuÊt hiÖn.<enter> Môc tiªu: b¶o vÖ Nguyªn So¸i phe m×nh, tiªu diÖt Nguyªn So¸i phe ®Þch")
	end
end;

function tongcommon(nPlayerDataIdx)
	local nTaskValue=GetTask(TASK_DUNGCHUNG3);
	local nCamp=GetNumber(1,nTaskValue,5);
	if(nCamp ~= 1) then
		SetValue(4,0);
		SetTask(TASK_DUNGCHUNG3, SetNumber(1,nTaskValue,5,1));
	end;
	StopTimer()	--ngung hen gio dang chay bat ky
	LeaveTeam()	--roi nhom, giai tan nhom
	SetRevPos(325,1) -- set phuc sinh ngay diem bao danh
	SetTempRevPos(380,1242*32,3549*32) --set ve thanh duong suc ngay doanh trai.
	SetLogoutRV(1)--dung diem phuc sinh dang nhap
	NewWorld(380,1242,3549) --di chuyen vao doanh trai
	SetCurCamp(1) --set phe phai'
	SetDeathScript("\\script\\player\\death_tongkim.lua") --set script khi chet
	SetReviveNow(1)
	local nTotalAccum = GetPMParam(1,nPlayerDataIdx,2);--tong so tich luy
	SetPMParam(1,nPlayerDataIdx,2,nTotalAccum);
	local nGroup = GetMSIdxGroup(1, nPlayerDataIdx);
	local i;
	for i=1,getn(EXPAND_RANK) do
		if(nTotalAccum >= EXPAND_RANK[i][1]) then
		SetPMParam(1,nPlayerDataIdx,15,EXPAND_RANK[i][2])
		SetRankEx(EXPAND_RANK[i][nGroup+3],"255,0,255")
		end
	end

	SetPunish(1)	--bat tinh nang chet khong mat' gi`
	local RestTK = GetMSRestTime(1,1);
	if (RestTK > 0) then
	SetPKMode(0,1)--ep kieu luyen cong
	else
	SetTimer(180*18,2)
	SetPKMode(1,1)--ep kieu chien dau
	SetPMParam(1,nPlayerDataIdx,1,1) --set param 1 (dang trong giai doan chien dau)
	end
	Msg2MSAll(1, GetName().." gia nhËp phe Tèng!"); --thong bao gia nhap
	PutMessage(format("B¹n gia nhËp tÇn sè %s[%d]",GetMissionName(1),nGroup));
end;

function kimcommon(nPlayerDataIdx)
	local nTaskValue=GetTask(TASK_DUNGCHUNG3);
	local nCamp=GetNumber(1,nTaskValue,5);
	if(nCamp ~= 2) then
		SetValue(5,0);
		SetTask(TASK_DUNGCHUNG3, SetNumber(1,nTaskValue,5,2));
	end;
	StopTimer()
	LeaveTeam()
	SetRevPos(325,2)
	SetTempRevPos(380,1688*32,3072*32)
	SetLogoutRV(1)
	NewWorld(380,1688,3072)
	SetCurCamp(2)
	SetDeathScript("\\script\\player\\death_tongkim.lua")
	SetReviveNow(1)
	local nTotalAccum = GetPMParam(1,nPlayerDataIdx,2);--tong so tich luy
	SetPMParam(1,nPlayerDataIdx,2,nTotalAccum);
	local nGroup = GetMSIdxGroup(1, nPlayerDataIdx);
	local i;
	for i=1,getn(EXPAND_RANK) do
		if(nTotalAccum >= EXPAND_RANK[i][1]) then
		SetPMParam(1,nPlayerDataIdx,15,EXPAND_RANK[i][2])
		SetRankEx(EXPAND_RANK[i][nGroup+3],"255,0,255")
		end
	end
	SetPunish(1)
	local RestTK = GetMSRestTime(1,1);
	if (RestTK > 0) then
	SetPKMode(0,1)
	else
	SetTimer(180*18,2)
	SetPKMode(1,1)
	SetPMParam(1,nPlayerDataIdx,1,1) --set param 1 dang chien dau
	end
	Msg2MSAll(1, GetName().." gia nhËp phe Kim!"); --thong bao gia nhap
	PutMessage(format("B¹n gia nhËp tÇn sè %s[%d]",GetMissionName(1),nGroup));
end;

function out()
	Talk(1,"",10643)
end;

function no()
end;