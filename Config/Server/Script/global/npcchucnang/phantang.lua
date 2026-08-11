Include("\\script\\header\\taskid.lua");
ALL_POINT_NO_LONGER = "Ng­¬i ®· céng hÕt ®iÓm tiÒm n¨ng råi!"
COMMON_SAY = "ThÝch Minh: Ng­¬i cã muèn tÈy tñy kh«ng?"
STATION_OLD = {
{1 ,1},
{2 ,11 },
{3 ,162},
{4 ,37 },
{5 ,78 },
{6 ,80 },
{7 ,176}
};

TIEMNAMG_ARRAY ={
10,
20,
50,
100,
150,
200,
300,
500
};

function main()
	local nValue = GetNumber(1,GetTask(TASK_DAOTAYTUY),7);
	if(nValue == 1) then
	Say(COMMON_SAY,5,
	"TÈy ®iÓm kü n¨ng/taykynang",
	"Céng ®iÓm tiÒm n¨ng/cong",
	"Kh«ng tÈy/no",
	"VÒ viÖc tÈy tñy/timhieu",
	"Rêi khái ®¶o tÈy tñy/roikhoi")
	elseif (nValue == 2) then
	Say(COMMON_SAY,5,
	"TÈy ®iÓm tiÒm n¨ng/taytiemnang",
	"Céng ®iÓm tiÒm n¨ng/cong",
	"Kh«ng tÈy/no",
	"VÒ viÖc tÈy tñy/timhieu",
	"Rêi khái ®¶o tÈy tñy/roikhoi")
	else
	Say(COMMON_SAY,6,
	"TÈy ®iÓm kü n¨ng/taykynang",
	"TÈy ®iÓm tiÒm n¨ng/taytiemnang",
	"Céng ®iÓm tiÒm n¨ng/cong",
	"Kh«ng tÈy/no",
	"VÒ viÖc tÈy tñy/timhieu",
	"Rêi khái ®¶o tÈy tñy/roikhoi")
	end
	
end

function taykynang()
	local nPnt = RollbackSkill();
	AddMagicPoint(nPnt);
	Talk(1,"",format("TÈy tñy thµnh c«ng ng­¬i cã thÓ ph©n phèi l¹i <color=Yellow>%d<color> ®iÓm kü n¨ng",nPnt))
end

function taytiemnang()
	local nPnt = ResetProp();
	AddPropPoint(nPnt);
	Talk(1,"",format("TÈy tñy thµnh c«ng ng­¬i cã thÓ ph©n phèi l¹i <color=Yellow>%d<color> ®iÓm tiÒm n¨ng",nPnt))
end

function timhieu()
	Talk(3,"",13021,10511,10512)
end

function roikhoi()
	Say("ThÝch Minh: Ng­¬i thËt sù muèn rêi khái ®©y?",2,
		"§óng ta muèn rêi khái ®¶o tÈy tñy/venha",
		"§Ó ta suy nghÜ l¹i xem/no")
end

function venha()
	local nCityIndex = GetNumber(1,GetTask(TASK_DAOTAYTUY),8);
	local nWorld = GetNumber(3,GetTask(TASK_DAOTAYTUY),1);
	local nRevID = GetNumber(2,GetTask(TASK_DAOTAYTUY),3);
	if (nCityIndex == 1) then
		NewWorld(1, 1557, 3112) -- ·ïÏè		
	elseif (nCityIndex == 2) then
		NewWorld(11, 3193, 5192) -- ³É¶¼	
	elseif (nCityIndex == 3) then
		NewWorld(162, 1669, 3129) -- ´óÀí	
	elseif (nCityIndex == 4) then
		NewWorld(37, 1598, 3000) -- ãê¾©
	elseif (nCityIndex == 5) then
		NewWorld(78, 1592, 3377) -- ÏåÑô
	elseif (nCityIndex == 6) then
		NewWorld(80, 1670, 2996) -- ÑïÖÝ		
	elseif (nCityIndex == 7) then
		NewWorld(176, 1603, 2917) -- ÁÙ°²
	else
		Msg2Player("HÖ thèng xuÊt hiÖn sù cè! Vui lßng t×m nh©n viªn phôc vô x¸c nhËn gi¶i quyÕt vÊn ®Ò. ");
		return
	end
	SetFightState(0)
	SetRevPos(nWorld,nRevID)
	ForbidUseTownP(0);
	SetPunish(1);
end

function cong()
	Say("Ng­¬i muèn t¨ng ®iÓm lo¹i nµo?",5,"Søc m¹nh/sucmanh","Th©n ph¸p/thanphap","Sinh khÝ /sinhkhi","Néi c«ng/noicong","Tho¸t/no")
end;

function sucmanh()
	local count = 1;
	local StrTab = {};
	
	for i=1,getn(TIEMNAMG_ARRAY) do
		StrTab[count] = TIEMNAMG_ARRAY[i].." ®iÓm".. "/selsucmanh";
		count = count + 1;
	end
	
	if(count == 1) then
	return end
	
	StrTab[count] = "Quay l¹i/cong";
	Say("Ng­¬i muèn céng thªm søc m¹nh bao nhiªu?",count,StrTab)
end;

function selsucmanh(sel)
	local nSel = sel +1;
	local n = GetRestAP()
	if n == 0 then Talk(1,"",ALL_POINT_NO_LONGER); return end
	if n < TIEMNAMG_ARRAY[nSel] then
	AddStrg(n); cong();
	return end
	AddStrg(TIEMNAMG_ARRAY[nSel]); cong();
end;

function thanphap()
local count = 1;
	local StrTab = {};
	
	for i=1,getn(TIEMNAMG_ARRAY) do
		StrTab[count] = TIEMNAMG_ARRAY[i].." ®iÓm".. "/selthanphap";
		count = count + 1;
	end
	
	if(count == 1) then
	return end
	
	StrTab[count] = "Quay l¹i/cong";
	Say("Ng­¬i muèn céng thªm th©n ph¸p bao nhiªu?",count,StrTab)
end;

function selthanphap(sel)
	local nSel = sel +1;
	local n = GetRestAP()
	if n == 0 then Talk(1,"",ALL_POINT_NO_LONGER); return end
	if n < TIEMNAMG_ARRAY[nSel] then
	AddDex(n); cong();
	return end
	AddDex(TIEMNAMG_ARRAY[nSel]); cong();
end;

function sinhkhi()
local count = 1;
	local StrTab = {};
	
	for i=1,getn(TIEMNAMG_ARRAY) do
		StrTab[count] = TIEMNAMG_ARRAY[i].." ®iÓm".. "/selsinhkhi";
		count = count + 1;
	end
	
	if(count == 1) then
	return end
	
	StrTab[count] = "Quay l¹i/cong";
	Say("Ng­¬i muèn céng thªm sinh khÝ bao nhiªu?",count,StrTab)
end;

function selsinhkhi(sel)
	local nSel = sel +1;
	local n = GetRestAP()
	if n == 0 then Talk(1,"",ALL_POINT_NO_LONGER); return end
	if n < TIEMNAMG_ARRAY[nSel] then
	AddVit(n); cong();
	return end
	AddVit(TIEMNAMG_ARRAY[nSel]); cong();
end;

function noicong()
local count = 1;
	local StrTab = {};
	
	for i=1,getn(TIEMNAMG_ARRAY) do
		StrTab[count] = TIEMNAMG_ARRAY[i].." ®iÓm".. "/selnoicong";
		count = count + 1;
	end
	
	if(count == 1) then
	return end
	
	StrTab[count] = "Quay l¹i/cong";
	Say("Ng­¬i muèn céng thªm néi c«ng bao nhiªu?",count,StrTab)
end;

function selnoicong(sel)
	local nSel = sel +1;
	local n = GetRestAP()
	if n == 0 then Talk(1,"",ALL_POINT_NO_LONGER); return end
	if n < TIEMNAMG_ARRAY[nSel] then
	AddEng(n); cong();
	return end
	AddEng(TIEMNAMG_ARRAY[nSel]); cong();
end;

function no()
end;
