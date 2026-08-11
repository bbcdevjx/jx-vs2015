Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\event_head.lua");
Include("\\script\\lib\\worldlibrary.lua");
AWARDS_ARRAY ={--møc th­ëng ®Æc biÖt
	500,
	1000,
	2000,
	3000,
	4000,
	5000,
	7000,
	9000,
	10000
};

LEVEL_UPDATE = {--lo¹i nhiÖm vô n©ng cÊp vµ møc ®é khã cho tõng level
[1]={
	--{4,	100,200,300,400,700,1000,2000,3000,4000,5000},
	{5,	100,200,300,400,500,600,700,800,900,1000},
	{6,	1,1,2,2,3,3,4,4,5,5},
	{7,	1,1,1,2,2,2,3,3,3,4}
	},
[2]={
	{1,	5,10,10,15,15,20,20,25,25,30},
	{2,	5,10,10,15,15,20,20,25,25,30},
	{4,	1000,2000,3000,4000,5000,6000,7000,8000,9000,10000},
	{5,	500,600,800,1000,1200,1500,1600,1800,1900,2000},
	{6,	2,3,4,4,5,6,7,7,8,8},
	{7,	1,1,1,2,2,2,3,3,3,4}
	},
[3]={
	{1,	5,10,10,15,15,20,20,25,25,30},
	{2,	5,10,10,15,15,20,20,25,25,30},
	{4,	5000,8000,10000,12000,15000,17000,20000,23000,25000,30000},
	{5,	1000,1500,1800,2500,2800,3000,3500,3700,3800,4000},
	{6,	4,5,5,6,7,7,7,8,9,10},
	{7,	1,1,1,2,2,2,3,3,3,4}
	},
[4]={
	{1,	5,10,10,15,15,20,20,25,25,30},
	{2,	5,10,10,15,15,20,20,25,25,30},
	{4,	7000,10000,15000,20000,25000,30000,35000,40000,45000,50000},
	{5,	1000,1500,1800,2500,2800,3000,3500,3700,3800,4000},
	{6,	4,5,5,6,7,7,7,8,9,10},
	{7,	1,1,1,2,2,2,3,3,3,4}
	},
[5]={
	{1,	5,10,15,15,18,18,20,25,30,40},
	{2,	5,10,15,15,18,18,20,25,30,40},
	{4,	40000,50000,60000,70000,90000,100000,120000,150000,170000,200000},
	{5,	2000,3000,3500,5000,5500,6000,7000,8000,9000,10000},
	{6,	5,6,7,8,9,10,11,12,14,15},
	{7,	1,1,1,2,2,2,3,3,3,4}
	},
[6]={
	{1,	5,10,15,15,18,18,20,25,30,40},
	{2,	5,10,15,15,18,18,20,25,30,40},
	{4,	50000,80000,100000,130000,150000,200000,250000,280000,300000,350000},
	{5,	2000,3000,3500,5000,5500,6000,7000,8000,9000,10000},
	{6,	5,6,7,8,9,10,11,12,14,15},
	{7,	2,2,2,3,3,3,4,4,4,5}
	},
[7]={
	{1,	5,10,15,15,18,18,20,25,30,40},
	{2,	5,10,15,15,18,18,20,25,30,40},
	{4,	100000,150000,200000,250000,300000,350000,400000,500000,800000,1000000},
	{5,	5000,8000,10000,15000,18000,20000,22000,25000,28000,40000},
	{6,	5,6,7,8,9,10,11,12,14,15},
	{7,	2,2,2,3,3,3,4,4,4,5}
	},
[8]={
	{1,	5,10,15,15,18,18,20,25,30,40},
	{2,	5,10,15,15,18,18,20,25,30,40},
	{4,	500000,600000,700000,800000,1000000,1200000,1500000,1700000,1800000,2000000},
	{5,	10000,15000,20000,30000,40000,42000,45000,50000,60000,70000},
	{6,	5,6,7,8,9,10,11,12,14,15},
	{7,	2,2,2,3,3,3,4,4,4,5}
	},
[9]={
	{1,	5,10,15,20,25,30,35,40,45,50},
	{2,	5,10,15,20,25,30,35,40,45,50},
	{3,	100,200,500,600,800,1000,1200,1500,1800,2000},
	{4,	500000,600000,700000,800000,1000000,1200000,1500000,1700000,1800000,2000000},
	{5,	10000,20000,30000,40000,50000,60000,70000,80000,90000,100000},
	{6,	5,6,7,8,9,10,11,12,14,15},
	{7,	2,2,2,3,3,3,4,4,4,5}
	--{8,	5,5,5,10,10,10,10,20,20,20}
	},
[10]={
	{1,	10,15,20,25,30,35,40,45,50,60},
	{2,	10,15,20,30,35,40,50,60,70,80},
	{3,	100,200,500,600,800,1000,1500,2000,3000,5000},
	{4,	500000,800000,1000000,1500000,1800000,2000000,2400000,2700000,3000000,5000000},
	{5,	10000,20000,30000,40000,50000,80000,100000,150000,180000,200000},
	{6,	5,6,7,8,9,10,12,14,15,18},
	{7,	2,2,3,3,4,4,5,5,6,6}
	--{8,	5,5,10,10,10,10,20,20,30,30}
	}
};

MAP_DIADOCHI={
[1]={53,20},
[2]={78,37},
[3]={21,70},
[4]={90,92},
[5]={41,122},
[6]={125,163},
[7]={9,56},
[8]={123,319,9,56},
[9]={123,319,224,320},
[10]={336,340,321,322,75,225,226,227,124,93,224,320}
};

--muc do kho cua nhiem vu item
ITEM_QUEST_LEVEL={
[1]={
		[1]={1,11,21,31,41},
		[2]={5,6,7,8}
},
[2]={
		[1]={2,12,22,32,42},
		[2]={5,6,7,8,14,15,16,17}
},
[3]={
		[1]={3,13,23,33,43},
		[2]={5,6,7,8,14,15,16,17}
},
[4]={
		[1]={4,14,24,34,44},
		[2]={5,6,7,8,14,15,16,17,18}
},
[5]={
		[1]={5,15,25,35,45},
		[2]={5,6,7,8,14,15,16,17,18}
},
[6]={
		[1]={6,16,26,36,46},
		[2]={5,6,7,8,14,15,16,17,18}
},
[7]={
		[1]={6,16,26,36,46,7,17,27,37,47},
		[2]={5,6,7,8,14,15,16,17,18}
},
[8]={
		[1]={6,16,26,36,46,7,17,27,37,47,8,18,28,38,48},
		[2]={5,6,7,8,14,15,16,17,18}
},
[9]={
		[1]={6,16,26,36,46,7,17,27,37,47,8,18,28,38,48,9,19,29,39,49},--trang bi ko thuoc tinh
		[2]={5,6,7,14,15,16,17,18},--item mat binh thuong
		[3]={1,2,3,4,9,10,11,12,13}--item dac biet
},
[10]={
		[1]={6,16,26,36,46,7,17,27,37,47,8,18,28,38,48,9,19,29,39,49,10,20,30,40,50},--trang bi ko thuoc tinh
		[2]={5,6,7,14,15,16,17,18},--item mat binh thuong
		[3]={1,2,3,4,9,10,11,12,13}--item dac biet
		--[4] item co thuoc tinh
}
};

--gen - detail - parti
KIND_ITEM_MAT = {--lo¹i nhiÖm vô giao vËt phÈm kh¸c trang bÞ gen detail level seri
[1]={"Lam Thñy Tinh",4,238,0,0},	--Lam thuy tinh
[2]={"Tö Thñy Tinh",4,239,0,0},	--Tu thuy tinh
[3]={"Lôc Thñy Tinh",4,240,0,0},	--Luc thuy tinh
[4]={"Tinh Hång B¶o Th¹ch",4,353,0,0},	--tinh hong bao thach
[5]={"Phóc Duyªn Lé (TiÓu)",6,121,0,0},	--phuc duyen
[6]={"Phóc Duyªn Lé (Trung)",6,122,0,0},	--phuc duyen
[7]={"Phóc Duyªn Lé (§¹i)",6,123,0,0},	--phuc duyen
[8]={"Tèng Kim Chiªu th­ ",6,154,0,0},	--tong kim chieu thu
[9]={"Tiªn Th¶o Lé ",6,71,0,0},	--tien thao lo
[10]={"Thiªn s¬n B¶o Lé ",6,72,0,0},	--thien son bao lo
[11]={"B¸ch Qu¶ Lé ",6,73,0,0},	--bach qua lo
[12]={"QuÕ Hoa Töu",6,124,0,0},	--que hoa tuu
[13]={"Phi Phong",6,15,0,0},	--phi phong
[14]={"L­îng Ng©n kho¸ng",4,118,0,0},	--luong ngan
[15]={"XÝch §ång kho¸ng",4,121,0,0},	--xich dong
[16]={"Tõ ThiÕt kho¸ng",4,138,0,0},	--tu thiet
[17]={"HuyÒn Tinh kho¸ng th¹ch",6,146,1,0},	--huyen tinh
[18]={"HuyÒn Tinh kho¸ng th¹ch",6,146,2,0}	--huyen tinh
};

--gen - detail - parti - level
KIND_EQUIP_NOTMAGIC = {--lo¹i nhiÖm vô giao vËt phÈm trang bÞ ko thuéc tÝnh
[1]={"Hoµng Ngäc Giíi ChØ "	,0,	3,	0,1 },
[2]={"NhÉn Qu¶ Tr¸m"	,0,	3,	0,2 },
[3]={"Phï Dung Th¹ch Giíi ChØ "	,0,	3,	0,3 },
[4]={"PhØ Thóy Giíi ChØ "	,0,	3,	0,4 },
[5]={"Thóy Lùu Th¹ch Giíi ChØ "	,0,	3,	0,5 },
[6]={"Tæ MÉu Lôc Giíi ChØ "	,0,	3,	0,6 },
[7]={"H¶i Lam B¶o Th¹ch Giíi ChØ "	,0,	3,	0,7 },
[8]={"Hång B¶o Th¹ch Giíi ChØ "	,0,	3,	0,8 },
[9]={"Lam B¶o Th¹ch Giíi ChØ "	,0,	3,	0,9 },
[10]={"Toµn Th¹ch Giíi ChØ "	,0,	3,	0,10},
[11]={"Hu©n Y H­¬ng Nang"	,0,	9,	0,1 },
[12]={"M¹t LÞ H­¬ng Nang"	,0,	9,	0,2 },
[13]={"Nhò H­¬ng H­¬ng Nang"	,0,	9,	0,3 },
[14]={"Lan Hoa H­¬ng Nang"	,0,	9,	0,4 },
[15]={"Hîp Hoan H­¬ng Nang"	,0,	9,	0,5 },
[16]={"Tö Ph­¬ng H­¬ng Nang"	,0,	9,	0,6 },
[17]={"TrÇm §µn H­¬ng Nang"	,0,	9,	0,7 },
[18]={"Tiªn X¹ H­¬ng Nang"	,0,	9,	0,8 },
[19]={"Giµ Nam H­¬ng Nang"	,0,	9,	0,9 },
[20]={"Long Tiªn H­¬ng Nang"	,0,	9,	0,10},
[21]={"Lôc Du Ngäc Béi"	,0,	9,	1,1 },
[22]={"Kinh B¹ch Ngäc Béi"	,0,	9,	1,2 },
[23]={"§µo Hoa Ngäc Béi"	,0,	9,	1,3 },
[24]={"Mai Hoa Ngäc Béi"	,0,	9,	1,4 },
[25]={"Ngò S¾c Ngäc Béi"	,0,	9,	1,5 },
[26]={"Thanh Ngäc Ngäc Béi"	,0,	9,	1,6 },
[27]={"BÝch Ngäc Ngäc Béi"	,0,	9,	1,7 },
[28]={"MÆc Ngäc Ngäc Béi"	,0,	9,	1,8 },
[29]={"Hoµng Ngäc Ngäc Béi"	,0,	9,	1,9 },
[30]={"D­¬ng ChØ B¹ch Ngäc "	,0,	9,	1,10},
[31]={"D©y chuyÒn §ång"	,0,	4,	0,1 },
[32]={"Ng©n H¹ng LiÖm"	,0,	4,	0,2 },
[33]={"Kim H¹ng LiÖm"	,0,	4,	0,3 },
[34]={"B¹ch Kim H¹ng LiÖm"	,0,	4,	0,4 },
[35]={"Ngäc Ch©u H¹ng LiÖm"	,0,	4,	0,5 },
[36]={"Lôc Tïng Th¹ch H¹ng LiÖm"	,0,	4,	0,6 },
[37]={"Thñy Tinh H¹ng LiÖm"	,0,	4,	0,7 },
[38]={"Khæng T­íc Th¹ch H¹ng LiÖm"	,0,	4,	0,8 },
[39]={"Tr©n Ch©u H¹ng LiÖm"	,0,	4,	0,9 },
[40]={"Toµn Th¹ch H¹ng LiÖm"	,0,	4,	0,10},
[41]={"Lôc Tïng Th¹ch Hé Th©n Phï "	,0,	4,	1,1 },
[42]={"San H« Hé Th©n Phï "	,0,	4,	1,2 },
[43]={"Miªu Nh·n Hé Th©n Phï "	,0,	4,	1,3 },
[44]={"Hæ T×nh Hé Th©n Phï "	,0,	4,	1,4 },
[45]={"Thñy Tinh Hé Th©n Phï "	,0,	4,	1,5 },
[46]={"Hæ Ph¸ch Hé Th©n Phï "	,0,	4,	1,6 },
[47]={"B¹ch PhØ Thóy Hé Th©n Phï "	,0,	4,	1,7 },
[48]={"Hång PhØ Thóy Hé Th©n Phï "	,0,	4,	1,8 },
[49]={"Tö PhØ Thóy Hé Th©n Phï "	,0,	4,	1,9 },
[50]={"Lôc PhØ Thóy Hé Th©n Phï "	,0,	4,	1,10}
};

--type - name - ch½n
KIND_EQUIP_HAVEMAGIC = {--lo¹i nhiÖm vô giao vËt phÈm cã ma thuËt
[1]={85,"t¨ng sinh lùc",0},
[2]={89,"t¨ng néi lùc",0},
[3]={96,"Phôc håi thÓ lùc",2},
[4]={97,"t¨ng søc m¹nh",3},
[5]={98,"t¨ng th©n ph¸p",3},
[6]={99,"t¨ng sinh khÝ ",3},
[7]={93,"t¨ng thÓ lùc",0},
[8]={101,"kh¸ng ®éc",4},
[9]={102,"kh¸ng háa",4},
[10]={103,"kh¸ng l«i",4},
[11]={105,"kh¸ng b¨ng",4},
[12]={106,"gi¶m thêi gian ®ãng b¨ng",1},
[13]={108,"gi¶m thêi gian tróng ®éc",1},
[14]={110,"gi¶m thêi gian cho¸ng",1}
};

--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\jinqian_icon_017ex.spr --ngan luong
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\jingyan_icon_018ex.spr --kinh nghiem
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\kuangshi_icon_020ex.spr --khoang thach
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\wenhao_icon_022ex.spr --ngau nhien
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\quxiao_icon_026ex.spr --co hoi
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\hungjin_icon_019ex.spr --trang bi hk 1
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\teshu_icon_021ex.spr --duoc pham
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\lanse_icon_0191ex.spr --trang bi hk2
--\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\zise_icon_0192ex.spr --trang bi tim 6 dong

GET_REWARDS ={
	{"NgÉu nhiªnLINK:\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\wenhao_icon_022ex.spr","ngaunhien"},
	{"Kho¸ng th¹chLINK:\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\kuangshi_icon_020ex.spr","daquy"},
	{"D­îc phÈmLINK:\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\teshu_icon_021ex.spr","duocpham"}
};

EXP_REWARDS={--kinh nghiem th­ëng
	{1000,2000},
	{3000,6000},
	{5000,8000},
	{8000,12000},
	{12000,15000},
	{20000,40000},
	{50000,70000},
	{90000,120000},
	{300000,500000},
	{500000,1000000}
};
QUESTKIND_UPDATE = {--c¸c lo¹i nhiÖm vô n©ng cÊp
	{	1	,"®iÓm danh väng"},
	{	2	,"®iÓm phóc duyªn"},
	{	3	,"®iÓm tÝch lòy"},
	{	4	,"®iÓm kinh nghiÖm"},
	{	5	,"ng©n l­îng"},
	{	6	,"®Þa ®å chÝ"},
	{	7	,"mËt chÝ"}
	--{	8	,"§iÓm vinh dù "}
};

NO_MONEY = "B¹n trÎ vÉn ch­a mang ®ñ ng©n l­îng cho ta"
FIND_ITEM = "H·y t×m cho ta 1 c¸i %s"
FIND_MAGIC = "H·y t×m cho ta %s %s %d-%d"
LETS_FIND = "H·y t×m cho ta 1 c¸i %s"
MAX_QUEST_PERDAY = 30	--max nhiem vô mçi ngµy
--CÊu tróc cña  TASK_DATAU_ACCEPT ---
	--[1]NhËn nhiÖm vô
	--[2]Lo¹i nhiÖm vô : 0: kh«ng giao, 1: cã giao vËt phÈm
	--[3]®é khã
	--[4][5][6]Sè nhiÖm vô ®· hoµn thµnh mçi ngµy
	--[7][8] loai update
	--tim item [7][8]num [9] loai giao item gi
--CÊu tróc cña TASK_DIADOCHI ---
	--[1][2][3]b¶n ®å
	--[4][5][6]con trong'
	--[7][8][9]level cua update kinh nghiem
	--timitem co thuoc tinh
	--[1][2][3] nho nhat
	--[4][5][6] lon nhat
	--[7][8][9] loai ma thuat
function main()
	if(SERVER_MODE == 1) then
	Talk(1,"",SERVER_NOTICE)
	return end
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local bAccept = GetNumber(1,nTaskValue, 1);--[1]
	local nTaskKind = GetNumber(1,nTaskValue, 2);--[2]
	local nDone = GetNumber(3,GetTask(TASK_RESET2), 1);--[1][2][3]
	if(nDone >= MAX_QUEST_PERDAY) then
	Talk(1,"",10192)
	return end
--Chua nhan nhiem vu gi--
	if (bAccept == 0) then
	Say(format("<npc>: VÞ hiÖp kh¸ch h«m nay ®· hoµn thµnh <color=yellow>%d<color> nhiÖm vô, cã thÓ thùc hiÖn l¹i <color=yellow>%d<color>, ng­¬i muèn lµm n÷a kh«ng?",nDone,MAX_QUEST_PERDAY-nDone),2,
			"Mau cho ta biÕt nhiÖm vô tiÕp theo lµ g×?/nhannv",
			"§Ó ta nghØ ng¬i mét l¸t ®·, ta bËn råi./no")
	return end
--Da nhan nhiem vu roi--
	local strMain,strPrivate;
	if(nTaskKind == 0) then	--loai update
	local nKind = GetNumber(2,nTaskValue, 4); --« [7][8] lo¹i update
	local strName = "<color=red>"..QUESTKIND_UPDATE[nKind][2].."<color>";
	if(nKind ==6 or nKind == 7) then
		strPrivate = format("H·y ®Õn %s t×m gióp ta <color=yellow>%d<color> quyÓn %s", GetWorldName(GetNumber(3,GetTask(TASK_DIADOCHI),1)), GetTask(TASK_DATAU_NEED), strName)
	elseif(nKind == 5) then
		strPrivate = format("H·y mang ®ñ cho ta %s <color=yellow>%d<color>",strName,GetTask(TASK_DATAU_NEED));
	else
		strPrivate = format("H·y ®i n©ng cÊp %s <color=yellow>%d<color>",strName,GetTask(TASK_DATAU_NEED));
	end
	
		strMain = format("§©y lµ nhiÖm vô thø <color=green>%d<color>, ®· liªn tiÕp hoµn thµnh <color=green>%d<color> nhiÖm vô. %s",nDone+1,GetTask(TASK_DATAU_NUM),strPrivate);
	else	--loai giao item
		local x = GetNumber(1,nTaskValue, 9); --loai item thu' may
		local nNum;
		if(x == 1) then
			nNum = GetNumber(2,nTaskValue,4);
			strPrivate = format(LETS_FIND, KIND_EQUIP_NOTMAGIC[nNum][1]);
		elseif(x == 2 or x == 3) then
			nNum = GetNumber(2,nTaskValue,4);
			strPrivate = format(LETS_FIND, KIND_ITEM_MAT[nNum][1]);
			if(KIND_ITEM_MAT[nNum][4] > 0) then
			strPrivate = strPrivate.."(cÊp "..KIND_ITEM_MAT[nNum][4]..")";
			end
		else
			nNum = GetNumber(3,GetTask(TASK_DIADOCHI),3)
			local nDetail = GetNumber(2,nTaskValue,4);--nhan day chuyen ngoc boi
			local strDetail;
			if(nDetail == 0) then
				strDetail = "NhÉn"
			elseif(nDetail == 1) then
				strDetail = "D©y chuyÒn"
			else
				strDetail = "Ngäc béi"
			end
			strPrivate = format("H·y t×m cho ta mãn nµy: <color=yellow>%s<color> %s Nhá nhÊt:%d Lín nhÊt:%d",strDetail, KIND_EQUIP_HAVEMAGIC[nNum][2],GetNumber(3,GetTask(TASK_DIADOCHI),1),GetNumber(3,GetTask(TASK_DIADOCHI),2));
		end
		strMain = format("§©y lµ nhiÖm vô thø <color=green>%d<color>, ®· liªn tiÕp hoµn thµnh <color=green>%d<color> nhiÖm vô. %s",nDone+1,GetTask(TASK_DATAU_NUM),strPrivate);
	end
		Say(strMain,5,
			"BiÕt råi ®Ó ta hoµn thµnh nhiÖm vô xong míi t×m ng­¬i/no",
			"Ta ®· hoµn thµnh nhiÖm vô lÇn nµy, h·y kiÓm tra l¹i/check",
			--"LËp tøc hoµn thµnh nhiÖm vô /shortway",
			"NhiÖm vô lÇn nµy khã qu¸ ta muèn hñy bá./huybo",
			"Ta muèn biÕt kh¶o nghiÖm cña ng­¬i cã néi dung ra sao/timhieu",
			"PhÇn th­ëng tÝch lòy nhiÖm vô /phanthuong"
			)
end;

function huybo()
	Say(12242,3,
	"§óng, ta kh«ng muèn lµm nhiÖm vô quû qu¸i nµy ®©u/xacnhanhuy1",
	"Ta muèn sö dông 100 m¶nh S¬n Hµ x· t¾c ®Ó hñy bá nhiÖm vô lÇn nµy/shxt",
	"§Ó ta suy nghÜ l¹i ®·./no"
	)
end

function xacnhanhuy1()
	Say("Ng­¬i  suy nghÜ kü ch­a, muèn bá thËt sao?",2,
	"§õng l«i th«i n÷a! Ta kh«ng muèn lµm!/xacnhanhuy2",
	"Th«i ®Ó ta suy nghÜ l¹i ®·./no"
	)
end

function xacnhanhuy2()
	SetTask(TASK_DATAU_NUM, 0)
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	SetTask(TASK_DATAU_ACCEPT,SetNumber(3,nTaskValue,1,0))
	SetTask(TASK_DATAU_ACCEPT,SetNumber(3,GetTask(TASK_DATAU_ACCEPT),3,0))
	Msg2Player("<color=yellow>Chuçi nhiÖm vô d· tÈu ®· xãa bá hoµn toµn. B©y giê sÏ ph¶i lµm l¹i tõ nhiÖm vô ®Çu tiªn!<color>")
end

function shxt()
	local nSHXT = GetTask(TASK_SHXT)
	if(nSHXT < 100) then
		Talk(1,"",12244)
	return end
	nSHXT = nSHXT - 100;
	SetTask(TASK_SHXT, nSHXT);
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	SetTask(TASK_DATAU_ACCEPT,SetNumber(3,nTaskValue,1,0));
	SetTask(TASK_DATAU_ACCEPT,SetNumber(3,GetTask(TASK_DATAU_ACCEPT),3,0));
	Msg2Player("B¹n ®· dïng 100 m¶nh SHXT ®Ó hñy nhiÖm vô, hiÖn t¹i cßn "..nSHXT.." m¶nh")
end

function shortway()
	local nHaveDoneAward = GetNumber(1,GetTask(TASK_DUNGCHUNG),1);
	if(nHaveDoneAward > 0) then
		thuongnhucu(nHaveDoneAward);
	return end;
	Say(10193,3,
	"Sö dông 5 Tinh Hång b¶o th¹ch/huythbt",
	"Sö dông 500 v¹n ng©n l­îng/huytien",
	"§ãng/no"
	)
end

function huythbt()
	if(GetItemCount(0,4,353) < 5) then
		Talk(1,"",13011)
	return end
	DelItem(5,0,4,353)
	thuong()
end

function huytien()
	if(GetCash() < 5000000) then
		Talk(1,"",NO_MONEY)
	return end
	Pay(5000000)
	thuong()
end

function timhieu()
Talk(4,"",10649,10650,10652,11239)
end

function phanthuong()
	local StrTab = {};
	local count = 1;
	for i=1,getn(AWARDS_ARRAY) do
		StrTab[count] = "NhËn phÇn th­ëng nhiÖm vô "..AWARDS_ARRAY[i].." lÇn".."/SelANum";
		count = count + 1;
	end
	if(count == 1) then
	return end
	StrTab[count] = "§ãng/no"
	local strMain = format("Khi tæng sè nhiÖm vô hoµn thµnh ®¹t ®Õn møc chØ ®Þnh cã thÓ nhËn phÇn th­ëng ­u ®·i. HiÖn t¹i hoµn thµnh tÝch lòy lµ <color=green>%d<color> nhiÖm vô.",GetTask(TASK_DATAU_NUM));
	Say(strMain, count,StrTab)
end

function SelANum(sel)
	local nSel = sel+1;
	local nValue = GetTask(TASK_MOC_DATAU);
	if(GetNumber(1,nValue,nSel) > 0) then
		Talk(1,"","PhÇn th­ëng nµy ng­¬i ®· nhËn råi")
	return end
	if(GetTask(TASK_DATAU_NUM) < AWARDS_ARRAY[nSel]) then
		Talk(1,"","Ng­¬i vÉn ch­a lµm ®ñ "..AWARDS_ARRAY[nSel].." nhiÖm vô, lµm ®ñ råi quay l¹i sau");
	return end
	if(CheckRoom(2,3) == 0) then
	Talk(1,"",12265)
	return end
	SetTask(TASK_MOC_DATAU,SetNumber(1,nValue,nSel,1));
	if(nSel == 1) then
		AddItemID(AddItem(2,0,RANDOM(163,164),0,0,0,7));
	elseif(nSel == 2) then
		if(GetSex() == 0) then
		AddItemID(AddItem(2,0,190,0,0,0,5));
		else
		AddItemID(AddItem(2,0,194,0,0,0,5));
		end
	elseif(nSel == 3) then
		AddItemID(AddItem(2,0,162,0,0,0,7));
	elseif(nSel == 4) then
		AddItemID(AddItem(2,0,161,0,0,0,7));
	elseif(nSel == 5) then
		AddItemID(AddItem(2,0,167,0,0,0,3));
	elseif(nSel == 6) then
		AddItemID(AddItem(2,0,166,0,0,0,3));
	elseif(nSel == 7) then
		AddItemID(AddItem(2,0,168,0,0,0,3));
	elseif(nSel == 8) then
		AddItemID(AddItem(2,0,165,0,0,0,3));
	elseif(nSel == 9) then
		AddItemID(AddItem(0,0,10,6,10,0,0,0))
	end
end;

function nhannv()
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local nSetNum = SetNumber(1,nTaskValue, 1, 1)--set « [1]=1
	SetTask(TASK_DATAU_ACCEPT,  nSetNum)--set nhan nhiem vu
	local kindrand = RANDOM(1);
	nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 2,kindrand))--loai nv giao hay ko? --set « [2]
	nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local nLevel = floor(GetLevel()/10) + 1;
	if(nLevel > 10) then
		nLevel = 10;
	end
	if( kindrand == 0) then --loai ko giao
		local j = RANDOM(1,getn(LEVEL_UPDATE[nLevel]));
		local i = LEVEL_UPDATE[nLevel][j][1];
		SetTask(TASK_DATAU_ACCEPT,SetNumber(2,nTaskValue, 4,i))--set « [7][8]--loai update
		nTaskValue = GetTask(TASK_DATAU_ACCEPT);
		local nNeedNum = RANDOM(1,10);--møc ®é khã
		SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,nNeedNum-1))--set « [3] ®é khã
		if (i == 1) then	--danh väng
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum]
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can update
			SetTask(TASK_DATAU_OLD,GetRepute());--so luong cò
		elseif(i == 2) then --phóc duyªn
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum]
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can update
			SetTask(TASK_DATAU_OLD,GetFuYuan());--so luong cò
		elseif(i == 3) then --tÝch lòy
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum]
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can update
			SetTask(TASK_DATAU_OLD,GetAccum());--so luong cò
		elseif(i == 4) then --kinh nghiem
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum];
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can update
			local nCurExp = GetExp();--kn hien tai
			local nNext = GetNextExp();--so diem kn de len cap
			local nLv = GetLevel();
			if(nCurExp == nil) then
				nCurExp = 100
			end
			nCurExp = nNeedNum + nCurExp; --diem update + kn hien tai
			if(nCurExp >= nNext) then
				nLv = nLv + 1;
				nNext = nCurExp - nNext;
				SetTask(TASK_DIADOCHI, SetNumber(3,GetTask(TASK_DIADOCHI),3,nLv))
				SetTask(TASK_DATAU_OLD, nNext)
			else
				SetTask(TASK_DIADOCHI, SetNumber(3,GetTask(TASK_DIADOCHI),3,nLv))
				SetTask(TASK_DATAU_OLD, nCurExp)
			end
		elseif(i == 5) then --ng©n l­îng
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum]
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can nép
		elseif(i == 6) then --dia do chi'
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum];
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can update
			local nMapNo = RANDOM(1,getn(MAP_DIADOCHI[nLevel]));
			SetTask(TASK_DIADOCHI, SetNumber(3,0,1,MAP_DIADOCHI[nLevel][nMapNo]));
			SetTask(TASK_DATAU_OLD,0);--so luong cò
		elseif(i == 7) then --mat chi'
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum];
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can update
			local nMapNo = RANDOM(1,getn(MAP_DIADOCHI[nLevel]));
			SetTask(TASK_DIADOCHI, SetNumber(3,0,1,MAP_DIADOCHI[nLevel][nMapNo]));
			SetTask(TASK_DATAU_OLD,0);--so luong cò
		elseif(i == 8) then --vinh dù
			nNeedNum = LEVEL_UPDATE[nLevel][j][1+nNeedNum]
			SetTask(TASK_DATAU_NEED,nNeedNum);--so luong can update
			SetTask(TASK_DATAU_OLD,GetHonor());--so luong cò
		end
		local str = format("H·y ®i n©ng cÊp %d %s", nNeedNum, QUESTKIND_UPDATE[i][2])
		AddNote(12,1,str);
		main();
	return end
	
	--loai co giao tra vat pham
	local x = 1;
	if(nLevel < 9) then
		x = random(2);
	else
		x = random(4);
		if(random(100) < 80) then
			if(x == 3) then
				x = 4;
			end
		end
	end
	SetTask(TASK_DATAU_NEED,0);
	SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 9,x))--set « [9] loai item
	nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local str;
	if(x == 1) then	--trang bi ko thuoc tinh
		SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,4))--set « [3] ®é khã
		nTaskValue = GetTask(TASK_DATAU_ACCEPT);
		local nItemNum = RANDOM(1,getn(ITEM_QUEST_LEVEL[nLevel][x]));
		SetTask(TASK_DATAU_ACCEPT, SetNumber(2,nTaskValue,4,ITEM_QUEST_LEVEL[nLevel][x][nItemNum]));	--so thu tu array
		str = format(FIND_ITEM, KIND_EQUIP_NOTMAGIC[ITEM_QUEST_LEVEL[nLevel][x][nItemNum]][1]);
	elseif(x == 2) then	--item mat binh thuong
		SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,5))--set « [3] ®é khã
		nTaskValue = GetTask(TASK_DATAU_ACCEPT);
		local nItemNum = RANDOM(1,getn(ITEM_QUEST_LEVEL[nLevel][x]));
		SetTask(TASK_DATAU_ACCEPT, SetNumber(2,nTaskValue,4,ITEM_QUEST_LEVEL[nLevel][x][nItemNum]));	--so thu tu array
		str = format(FIND_ITEM, KIND_ITEM_MAT[ITEM_QUEST_LEVEL[nLevel][x][nItemNum]][1]);
		if(KIND_ITEM_MAT[ITEM_QUEST_LEVEL[nLevel][x][nItemNum]][4] > 0) then
		str = str.."(cÊp "..KIND_ITEM_MAT[ITEM_QUEST_LEVEL[nLevel][x][nItemNum]][4]..")";
		end
	elseif(x == 3) then	--item mat dac biet
		SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,9))--set « [3] ®é khã
		nTaskValue = GetTask(TASK_DATAU_ACCEPT);
		local nItemNum = RANDOM(1,getn(ITEM_QUEST_LEVEL[nLevel][x]));
		SetTask(TASK_DATAU_ACCEPT, SetNumber(2,nTaskValue,4,ITEM_QUEST_LEVEL[nLevel][x][nItemNum]));	--so thu tu array
		str = format(FIND_ITEM, KIND_ITEM_MAT[ITEM_QUEST_LEVEL[nLevel][x][nItemNum]][1]);
		if(KIND_ITEM_MAT[ITEM_QUEST_LEVEL[nLevel][x][nItemNum]][4] > 0) then
		str = str.."(cÊp "..KIND_ITEM_MAT[ITEM_QUEST_LEVEL[nLevel][x][nItemNum]][4]..")";
		end
	else	--loai item co thuoc tinh
		local ItemKind = RANDOM(2);
		local nMagic = RANDOM(1,getn(KIND_EQUIP_HAVEMAGIC));
		if(nMagic == 3 and ItemKind == 2) then
			ItemKind = 0;
		end
		SetTask(TASK_DATAU_ACCEPT, SetNumber(2,nTaskValue,4,ItemKind));
		local nChoose = RANDOM(1);
		local nMin,nMax = 0,0;
		nTaskValue = GetTask(TASK_DATAU_ACCEPT);
		if(KIND_EQUIP_HAVEMAGIC[nMagic][3] == 0) then --max 200
			if(nChoose == 0) then	--level thap
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,6))
				nMin = 80;
				nMax = 100;
			else
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,7))
				nMin = 100;
				nMax = 120;
			end
		elseif(KIND_EQUIP_HAVEMAGIC[nMagic][3] == 1) then --max 40
			if(nChoose == 0) then	--level thap
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,3))
				nMin = 10;
				nMax = 20;
			else
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,6))
				nMin = 30;
				nMax = 40;
			end
		elseif(KIND_EQUIP_HAVEMAGIC[nMagic][3] == 2) then --max 10
			if(nChoose == 0) then	--level thap
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,3))
				nMin = 1;
				nMax = 4;
			else
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,5))
				nMin = 5;
				nMax = 8;
			end
		elseif(KIND_EQUIP_HAVEMAGIC[nMagic][3] == 3) then --max 20
			if(nChoose == 0) then	--level thap
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,5))
				nMin = 5;
				nMax = 8;
			else
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,8))
				nMin = 12;
				nMax = 18;
			end
		else	--max 25
			if(nChoose == 0) then	--level thap
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,6))
				nMin = 7;
				nMax = 10;
			else
				SetTask(TASK_DATAU_ACCEPT,SetNumber(1,nTaskValue, 3,8))
				nMin = 10;
				nMax = 15;
			end
		end
		if(ItemKind == 0) then
		str=format(FIND_MAGIC,"NhÉn",KIND_EQUIP_HAVEMAGIC[nMagic][2],nMin,nMax);
		elseif (ItemKind == 1) then
		str=format(FIND_MAGIC,"H¹ng liªn",KIND_EQUIP_HAVEMAGIC[nMagic][2],nMin,nMax);
		else
		str=format(FIND_MAGIC,"Ngäc béi",KIND_EQUIP_HAVEMAGIC[nMagic][2],nMin,nMax);
		end
		nTaskValue = SetNumber(3,0,1,nMin);
		nTaskValue = SetNumber(3,nTaskValue,2,nMax);
		nTaskValue = SetNumber(3,nTaskValue,3,nMagic);
		SetTask(TASK_DIADOCHI, nTaskValue);
	end
	AddNote(12,1,str);
	main();
end

function check()
	local nHaveDoneAward = GetNumber(1,GetTask(TASK_DUNGCHUNG),1);
	if(nHaveDoneAward > 0) then
		thuongnhucu(nHaveDoneAward);
	return end;
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local nKind = GetNumber(1,nTaskValue, 2);--loai giao item hay ko
	local nOld = GetTask(TASK_DATAU_OLD);
	local nNeed = GetTask(TASK_DATAU_NEED);
	if(nKind == 0) then
		local i = GetNumber(2,nTaskValue, 4); --« [7][8] lo¹i update
		if (i == 1) then	--danh väng
			nNeed = nNeed + nOld;
			if(GetRepute() < nNeed ) then
				Talk(1,"",12239)
			return end
			thuong()
			return
		elseif(i == 2) then --phóc duyªn
			nNeed = nNeed + nOld;
			if(GetFuYuan() < nNeed ) then
				Talk(1,"",12239)
			return end
			thuong()
			return
		elseif(i == 3) then --tÝch lòy
			nNeed = nNeed + nOld;
			if(GetAccum() < nNeed ) then
				Talk(1,"",12239)
			return end
			thuong()
			return
		elseif(i == 4) then --kinh nghiem
			local nNeedLv = GetNumber(3,GetTask(TASK_DIADOCHI),3)
			local nCurLv = GetLevel()
			local nCurExp = GetExp()
			if(nCurLv < nNeedLv) then
				Talk(1,"",12239)
			return end
			if(nNeedLv == nCurLv and nOld > nCurExp) then
				Talk(1,"",12239)
			return end
			thuong()
		elseif(i == 5) then --ng©n l­îng
			if(GetCash() < nNeed ) then
				Talk(1,"",NO_MONEY)
			return end
			Pay(nNeed)
			thuong()
			return
		elseif(i == 6) then --dia do chi'
			local nGotNum = GetNumber(3,GetTask(TASK_DIADOCHI),2);
			if(nGotNum < nNeed) then
				Talk(1,"",12239)
			return end
			SetTask(TASK_DIADOCHI,0)
			thuong()
		elseif(i == 7) then --mat chi'
			local nGotNum = GetNumber(3,GetTask(TASK_DIADOCHI),2);
			if(nGotNum < nNeed) then
				Talk(1,"",12239)
			return end
			SetTask(TASK_DIADOCHI,0)
			thuong()
		elseif(i == 8) then --vinh dù
			nNeed = nNeed + nOld;
			if(GetHonor() < nNeed ) then
				Talk(1,"",12239)
			return end
			thuong()
			return
		end
	return end
	--loai giao item, mo khung giao item
	GiveItemUI("Giao vËt phÈm nhiÖm vu", "VÞ hiÖp kh¸ch ®· cã vËt phÈm ta cÇn råi chø?","giao","no")
end;

function giao()
	local nTempIndex,Tgenre,Tdetail,Tparti,Tlevel,Tseries
	local count = 0;
	local nIndex = 0;
	local genre,detail,parti,level,series
	local i,j;
	for i=0,5 do
		for j=0,3 do
			nTempIndex,Tgenre,Tdetail,Tparti,Tlevel,Tseries = FindItemEx(14,i,j);
			if (nTempIndex > 0) then
				count = count + 1;
				nIndex,genre,detail,parti,level,series = nTempIndex,Tgenre,Tdetail,Tparti,Tlevel,Tseries;
			end
		end
	end
	if(count == 0) then
		Talk(1,"","Ng­¬i kh«ng ®em g× cho ta c¶ µ? Ta kh«ng hoa m¾t chø?")
	return end
	if(count > 1) then
		Talk(1,"","NhiÒu thø qu¸ l·o xem kh«ng ®­îc! Ng­¬i ®Æt vµo tõng mãn th«i!")
	return end
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local x = GetNumber(1,nTaskValue, 9); --loai item thu' may
	local  nNum = GetNumber(2,nTaskValue,4);--so thu tu
	if(x == 1) then
		if(	genre == KIND_EQUIP_NOTMAGIC[nNum][2]	--genre
		and	detail == KIND_EQUIP_NOTMAGIC[nNum][3]	--detail
		and	parti == KIND_EQUIP_NOTMAGIC[nNum][4]	--parti
		and	level == KIND_EQUIP_NOTMAGIC[nNum][5]) then	--level
			RemoveItem(nIndex, 1);
			thuong()
			return 1;
		else
			Talk(1,"",12239)
		end
	elseif(x == 2 or x == 3) then
		if(		genre == KIND_ITEM_MAT[nNum][2]	--genre
		and	detail == KIND_ITEM_MAT[nNum][3]	--detail
		and	level  == KIND_ITEM_MAT[nNum][4]) then	--level
			RemoveItem(nIndex, 1);
			thuong()
			return 1;
		else
			Talk(1,"",12239)
		end
	else		--item co thuoc tinh
		local nTask = GetTask(TASK_DIADOCHI);
		local nMin = GetNumber(3,nTask,1);
		local nMax = GetNumber(3,nTask,2);
		local nMagic = GetNumber(3,nTask,3);
		local nDetail;
		if(nNum == 0) then
			nDetail = 3;
		elseif(nNum == 1) then
			nDetail = 4;
		else
			nDetail = 9;
		end
		local MA = {};
		local VA = {};
		local value1_3,
		         value2_3,
		         value3_3,
		         value4_3,
		         value5_3,
		         value6_3,
		         value7_3,
		         value8_3;
		MA[1] , VA[1], value1_3,
		MA[2] , VA[2], value2_3,
		MA[3] , VA[3], value3_3,
		MA[4] , VA[4], value4_3,
		MA[5] , VA[5], value5_3,
		MA[6] , VA[6], value6_3,
		MA[7] , VA[7], value7_3,
		MA[8] , VA[8], value8_3
		= GetMagicAttrib(nIndex);
		local bTrue = 0;
		for i=1,6 do
			if(MA[i] == KIND_EQUIP_HAVEMAGIC[nMagic][1]) then
				if(VA[i] >= nMin and VA[i] <= nMax) then
					bTrue = 1;
				end
			end
		end
		if(bTrue == 1) then
			RemoveItem(nIndex, 1);
			thuong()
			return 1;
		else
			Talk(1,"",12239)
		end
	end
	return 0;
end;

function thuong()
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local nDiff = (GetNumber(1,nTaskValue, 3) + 1)*10;--muc do kho'
	local nAwardKind = 1;--ngaunhien
	if(RANDOM(300) < nDiff and random(1,2) == 1 and GetLevel() > 70) then
		nAwardKind = 2;--da
	else
		if(RANDOM(3) == 2) then
			nAwardKind = 3;--duoc
		end
	end
	SetTask(TASK_DUNGCHUNG, SetNumber(1,0,1,nAwardKind));--set o[1] da nhan thuong~, du mat ket noi
	local strRand = format("%s/%s",GET_REWARDS[nAwardKind][1],GET_REWARDS[nAwardKind][2]);
	Say("LINK:<npc>",0,"Ng­¬i lµm tèt l¾m! H·y nhËn lÊy phÇn th­êng cña ng­¬i!",3,
	"Kinh nghiÖmLINK:\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\jingyan_icon_018ex.spr/kinhnghiem",
	"Ng©n l­îngLINK:\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\jinqian_icon_017ex.spr/tien",
	strRand)
	
end;

function thuongnhucu(nAwardKind)
	local strRand = format("%s/%s",GET_REWARDS[nAwardKind][1],GET_REWARDS[nAwardKind][2]);
	Say("LINK:<npc>",0,"Ng­¬i lµm tèt l¾m! H·y nhËn lÊy phÇn th­ëng cña ng­¬i!",3,
	"Kinh nghiÖmLINK:\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\jingyan_icon_018ex.spr/kinhnghiem",
	"Ng©n l­îngLINK:\\spr\\ui3\\ÐÂÈÎÎñÏµÍ³\\½±ÀøÍ¼±ê\\jinqian_icon_017ex.spr/tien",
	strRand)
end;

function kinhnghiem()
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local nDiff = GetNumber(1,nTaskValue, 3) + 1;--muc do kho'
	local nLevel = floor(GetLevel()/10) + 1;
	if(nLevel > 10) then
		nLevel = 10;
	end
	local nCurExp = GetExp();
	if(nCurExp ~= nil) then
		local nNextExp = GetNextExp();
		if(nNextExp > 0) then
			local nGap = nNextExp - nCurExp;
			local nAddExp = RANDOM(EXP_REWARDS[nLevel][1]*nDiff,EXP_REWARDS[nLevel][2]*nDiff);
			if(nAddExp > 0) then
			ClearTask()
			addevent(2)
			end
			AddStackExp(nAddExp);
		end
	end
end

function tien()
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	local nDiff = GetNumber(1,nTaskValue, 3) + 1;--muc do kho'
	local nLevel = floor(GetLevel()/10) + 1;
	if(nLevel > 10) then
		nLevel = 10;
	end
	local nTotalMoney = RANDOM(nLevel*(2000+nDiff),nLevel*(2000+nDiff)*nDiff*2);
	Earn(nTotalMoney);
	if(nTotalMoney > 0) then
	ClearTask()
	addevent(2)
	end
end


AWARD_ITEM = {--phÇn th­ëng nhiÖm vô
[1]={6,18},	--Tam tam tuong anh phu
[2]={6,20},	--Hoa hong
[3]={6,11},	--Phao hoa
[4]={6,23},	--Thiet la han
[5]={6,12},	--Ban nhuoc tam kinh
[6]={6,121},	--phuc duyen
[7]={6,122},	--phuc duyen
[8]={6,123},	--phuc duyen
[9]={6,71},	--tien thao lo
[10]={6,72},	--thien son bao lo
[11]={6,73},	--bach qua lo
};

function ngaunhien()
	local nRand = RANDOM(1000);
	if(nRand == 999) then
		daquy()
	elseif(nRand < 500) then
		if(random(1,2) == 1) then
			kinhnghiem()
		else
			tien()
		end
	elseif(nRand < 880) then
		local i = RANDOM(1,3);
		AddItemID(AddItem(0,AWARD_ITEM[i][1],AWARD_ITEM[i][2],0,0,5,0,0));
		ClearTask()
		addevent(2)
	elseif(nRand < 900) then
		local i = RANDOM(4,5);
		AddItemID(AddItem(0,AWARD_ITEM[i][1],AWARD_ITEM[i][2],0,0,5,0,0));
		ClearTask()
		addevent(2)
	else
		duocpham()
	end
end

function daquy()
	local nRand = random(3)
	if(nRand == 1) then
	AddItemID(AddItem(0,4,RANDOM(238,240),0,0,5,0,0));
	elseif(nRand == 2) then
	AddItemID(AddItem(0,4,353,0,0,5,0,0));
	end
	ClearTask()
	addevent(2)
end

function duocpham()
	local nSel = RANDOM(100);
	if(nSel == 99) then
	local i = RANDOM(9,11);
	AddItemID(AddItem(0,AWARD_ITEM[i][1],AWARD_ITEM[i][2],0,0,5,0,0));
	elseif(nSel == 89) then
	for i=1,3 do
	AddItemID(AddItem(0,1,2,0,5,0,0,0));
	end
	elseif(nSel < 30) then
	AddItemID(AddItem(0,1,RANDOM(5,6),0,RANDOM(1,5),5,0,0));--thuoc
	else
	local i = RANDOM(4,5);
	AddItemID(AddItem(0,AWARD_ITEM[i][1],AWARD_ITEM[i][2],0,0,5,0,0));
	end
	ClearTask()
	addevent(2)
end

function ClearTask()
	local nTaskDone = GetTask(TASK_RESET2);
	local nDone = GetNumber(3,nTaskDone, 1);--so nv hoan thanh moi ngay
	SetTask(TASK_RESET2,SetNumber(3,nTaskDone,1,nDone+1));
	
	local nTaskValue = GetTask(TASK_DATAU_ACCEPT);
	nTaskValue = SetNumber(3,nTaskValue,1,0);
	SetTask(TASK_DATAU_ACCEPT,SetNumber(3,nTaskValue,3,0));
	
	SetTask(TASK_DATAU_NUM,GetTask(TASK_DATAU_NUM)+1);
	SetTask(TASK_DUNGCHUNG, SetNumber(1,GetTask(TASK_DUNGCHUNG),1,0));
end

function no()
end