Include("\\script\\header\\taskid.lua");
OK_ENCHASE = "VËt phÈm ®óc/duc";
NOT_TRADE = "KÕt thóc ®èi tho¹i/no";
OK_TREMBLE = "VËt phÈm kh¶m n¹m/thuytinh";
NEED_ROOM_EMPTY = "Hµnh trang ph¶i cã ®ñ 2x4 « trèng.";
SAME_5HANH = "Trang bÞ ®· cã ngò hµnh thÝch hîp. Xin lùa chän ngò hµnh kh¸c.";
function main(NpcIndex)
	local OK_TRADE = format("Giao dÞch/giaodich(%d)",NpcIndex);
	SetTaskTemp(NPCINDEX, NpcIndex)
	local NOT_TRADE1 = "Nh©n tiÖn ghÐ qua th«i/no";
	local w,x,y = GetWorldPos();
	if (w == 53) then--ba lang
	Say(11304,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 20) then--giang tan
	if(nvgiangtan() == 1) then
	return end;
	Say(12950,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 99) then--vinh lac
	Say(12407,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 100) then--chu tien
	Say(14571,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 101) then--dao huong
	Say(14865,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 121) then--long mon
	Say(12101,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 153) then--thach co
	Say(13979,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 174) then--long tuyen thon
	Say(10944,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE1)
	return end
	if (w == 1) then--phuong tuong
	Say(12236,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 11) then--thanh do
	Say(12236,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 162) then--dai ly
	Say(13901,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 78) then--tuong duong
	Say(15275,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 37) then--bien kinh
	Say(14803,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 80) then--duong chau
	Say(15454,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	if (w == 176) then--lam an
	Say(12236,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
	return end
	Say(15454,2,
		OK_TRADE,
		--OK_TREMBLE,
		--OK_ENCHASE,
		NOT_TRADE)
end;

function giaodich(NpcIndex)
	local nParam = GetNpcValue(NpcIndex)
	if(nParam ~= nil and nParam > 0) then
	Sale(nParam)
	end
end;

function nvgiangtan()
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nTask = GetNumber(1,nTaskValue,9);
	if(nTask == 1) then
	SetTask(TASK_NVDANHVONG2, SetNumber(1,nTaskValue,9,2));
	Talk(1,"",12946)
	Msg2Player("Thî rÌn b¶o b¹n ra ngoµi th«n t×m ch¹c c©y vµ da tr©u ®Ó lµm c©y n¸.")
	return 1	end
	if(nTask == 2) then
		if(GetItemCount(0,4,176) > 0) then
		return 0 end
		if(GetItemCount(0,4,177) < 1 or GetItemCount(0,4,178) < 1) then
		Say(12949,2,
		OK_TRADE,
		--OK_ENCHASE,
		NOT_TRADE)
		else
		AddItemID(AddItem(0,4,176,0,0,5,0,0))
		DelItem(1,0,4,177)
		DelItem(1,0,4,178)
		Msg2Player("NhËn ®­îc 1 giµn n¸.")
		Talk(2,"",12947,12948)
		end
	return 1	end
	return 0
end;

function thuytinh()
	--Talk(1,"thuytinh2",10853)
	Say("LINK:<npc>",0,"Thñy tinh kh¶m n¹m liªn quan ®Õn sù c©n b»ng ngò hµnh, ph­¬ng ph¸p chuyÓn linh khÝ tuyÖt nhiªn kh«ng thÓ dïng søc ng­êi ®­îc, kh«ng h¼n nh­ ®¹i hiÖp hi väng thµnh vËt phÈm tuyÖt thÕ nh©n gian, mµ vò khÝ ®å phæ vµ vùc ngoµi kú tr©n chØ gióp chuyÓn ®æi ®¼ng cÊp cña trang bÞ. C¸c h¹ muèn kh¶m n¹m trang bÞ nµy kh«ng?",4,
	"B¾t ®Çu kh¶m n¹m/thuytinh2",
	"Liªn quan kh¶m n¹m/help",
	"§Ó ta suy nghÜ kü l¹i xem/no");
end

function thuytinh2()
	PutTremble("okkham")
end

function okkham()
	--ton ngan luong
	--if(GetCash() < xxx) then
	--Msg2Player("Ng­¬i kh«ng mang ®ñ xxx l­îng.")
	--return end;
	if(CheckRoom(2,4) == 0) then
		Msg2Player(NEED_ROOM_EMPTY)
	return end
	local i,j, nIndex,genre,detail,parti,level,series;

	local count = 0;
	nIndex,genre,detail,parti,level,series = FindItemEx(15,1);
	local nKim = nIndex;
	if(nKim > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,2);
	local nMoc = nIndex;
	if(nMoc > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,3);
	local nThuy = nIndex;
	if(nThuy > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,4);
	local nHoa = nIndex;
	if(nHoa > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,5);
	local nTho = nIndex;
	if(nTho > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 238)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,6);
	local nTu = nIndex;
	if(nTu > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 239)	then	--khong cho dat sai cho~
		return end
	end
	nIndex,genre,detail,parti,level,series = FindItemEx(15,7);
	local nLuc = nIndex;
	if(nLuc > 0) then
		count = count + 1;
		if(genre ~= 4 or detail ~= 240)	then	--khong cho dat sai cho~
		return end
	end
	
	local Rgenre,Rdetail,Rparti,Rlevel,Rseries;
	local doxanhid = 0;
	nIndex,genre,detail,parti,level,series = FindItemEx(15,0);
	if (nIndex > 0) then
		count = count + 1;
		doxanhid,Rgenre,Rdetail,Rparti,Rlevel,Rseries = nIndex,genre,detail,parti,level,series;
	end
	if(doxanhid == 0 or Rgenre ~= 0 or Rdetail > 9) then
	Msg2Player("Xin ®Æt trang bÞ xanh hoÆc tr¾ng vµo míi cã thÓ tiÕn hµnh.");
	return end
	if(count < 2) then
	Msg2Player("Xin ®Æt 1 Thñy Tinh ë vÞ trÝ cÇn kh¶m n¹m.");
	return end
	if(count > 2) then
	Msg2Player("Mçi lÇn kh¶m chØ ®­îc ®Æt vµo 1 Thñy Tinh vµ 1 trang bÞ xanh hoÆc tr¾ng!");
	return end
	if(nKim > 0) then	--doi sang he Kim
		if(Rseries == 0) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,0)
	RemoveItem(nKim,1)
	return end
	if(nMoc > 0) then	--doi sang he Moc
		if(Rseries == 1) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,1)
	RemoveItem(nMoc,1)
	return end
	if(nThuy > 0) then	--doi sang he Thuy
		if(Rseries == 2) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,2)
	RemoveItem(nThuy,1)
	return end
	if(nHoa > 0) then	--doi sang he Hoa
		if(Rseries == 3) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,3)
	RemoveItem(nHoa,1)
	return end
	if(nTho > 0) then	--doi sang he Tho
		if(Rseries == 4) then
		Msg2Player(SAME_5HANH);
		return end
	doihe(doxanhid,Rdetail,Rparti,Rlevel,4)
	RemoveItem(nTho,1)
	return end
	if(nTu > 0) then	--nang 1 cap
		if(Rlevel > 9) then
		Msg2Player("Trang bÞ ®· ®¹t ®¼ng cÊp tèi ®a, kh«ng thÓ n©ng cÊp!")
		return end
		if(random(10) == 9) then
		nangcap(doxanhid,Rdetail,Rparti,Rlevel,Rseries);
		else
		Msg2Player("N©ng cÊp trang bÞ thÊt b¹i! B¹n bÞ tæn thÊt 1 Thñy Tinh.");
		end
	RemoveItem(nTu,1)
	return end
	if(nLuc > 0) then	--doi thuoc tinh random
	AddItemID(AddItem(0,0,Rdetail,Rparti,Rlevel,Rseries,350,10,10,10,10,RANDOM(10),RANDOM(10)));
	RemoveItem(doxanhid,1);
	RemoveItem(nLuc,1);
	Msg2Player("Thay ®æi thuéc tÝnh trang bÞ thµnh c«ng!");
	return end
end;

function doihe(doxanhid,Rdetail,Rparti,Rlevel,Rseries)
	AddItemID(AddItem(0,0,Rdetail,Rparti,Rlevel,Rseries,80,10,RANDOM(7,10),RANDOM(6,10),RANDOM(10),RANDOM(10),RANDOM(10)));
	RemoveItem(doxanhid,1);
	Msg2Player("§æi ngò hµnh trang bÞ thµnh c«ng!");
end;

function nangcap(nRealIndex,Rdetail,Rparti,Rlevel,Rseries)
	local nNewItem;
	local bLock,nMin = GetLockItem(nRealIndex);
	
	nNewItem = AddItemIdx(nRealIndex);
	SetLevelItem(nNewItem,Rlevel+1);
	if(nNewItem > 0) then
		local	type1 , value1_1, value1_3,
		type2 , value2_1, value2_3,
		type3 , value3_1, value3_3,
		type4 , value4_1, value4_3,
		type5 , value5_1, value5_3,
		type6 , value6_1, value6_3,
		type7 , value7_1, value7_3,
		type8 , value8_1, value8_3
		= GetMagicAttrib(nRealIndex);
		SetMagicAttrib(nNewItem,
						type1 , value1_1, value1_3,
						type2 , value2_1, value2_3,
						type3 , value3_1, value3_3,
						type4 , value4_1, value4_3,
						type5 , value5_1, value5_3,
						type6 , value6_1, value6_3,
						type7 , value7_1, value7_3,
						type8 , value8_1, value8_3
						);
		AddItemID(nNewItem);
		RemoveItem(nRealIndex, 1);
	Msg2Player("N©ng cÊp trang bÞ thµnh c«ng!");
	end
end;

function help()
	str = 
	{
		"Qu¸ tr×nh kh¶m n¹m: ®Æt trang bÞ vµo giao diÖn chÝnh gi÷a, sau ®ã ®em vËt phÈm kh¶m n¹m ®Æt vµo chç t­¬ng øng. VËt phÈm kh¶m n¹m t¨ng vµ gi¶m ®¼ng cÊp ®Æt vµo thanh ®¼ng cÊp; thay ®æi thuéc tÝnh ma ph¸p ®Æt vµo thanh linh lùc; thay ®æi thuéc tÝnh ngò hµnh ®Æt vµo thanh ngò hµnh. NhÊn 'Kh¶m n¹m' ®Ó hoµn thµnh. MÆt n¹ kh«ng thÓ kh¶m n¹m.",
		"Liªn quan kh¶m n¹m thñy tinh/crystalhelp",
		"Liªn quan kh¶m n¹m vò khÝ /weaponhelp",
		"Liªn quan kh¶m n¹m y phôc/armorhelp",
		"Liªn quan kh¶m n¹m nãn/helmhelp",
		"Ta ®· biÕt råi /no",
	};
	Say(str[1], 5, str[2], str[3], str[4], str[5],str[6])
end

function crystalhelp()
	Talk(1,"","Muèn kh¶m nh÷ng vËt nµy kh«ng ®¬n gi¶n chót nµo, tiÒn c«ng rÊt cao, lµm xong còng ch­a ch¾c lµ ®· võa ý, thÕ nµo cã nuèn kh¶m kh«ng? §ång ý? VËy kh¶m nh÷ng thø g×? ")
end

function weaponhelp()
	str = {
		"GÇn ®©y giang hå xuÊt hiÖn ®å phæ cã thÓ t¨ng ®¼ng cÊp vò khÝ. Ng­¬i cã muèn nghe kh«ng?",
		"Qu¸ tr×nh th¨ng cÊp ®å phæ vò khÝ /onweaponhelp",
		"L¨ng V­¬ng Th­îng §o¹n T¹o Tµn Biªn/onweaponhelp",
		"HuyÒn Vò Chïy Chi §óc T¹o ThuËt/onweaponhelp",
		"Long Ng©m KiÕm §o¹n T¹o §å/onweaponhelp",
		"Gia C¸t C¬ Qu¸t MËt YÕu/onweaponhelp",
		"LiÔu DiÖp To¸i Phong §ao. Tôy Thó Biªn/onweaponhelp",
		"HuyÒn NguyÖt ®ao Tö Kinh b¶o lôc/onweaponhelp",
		"Thiªn C¬ C«n ®å phæ /onweaponhelp",
		"¸m KhÝ Tæng phæ. QuyÓn 1/onweaponhelp",
		"Uyªn ¦¬ng ®ao. Khai Quang biªn/onweaponhelp",
		"Kh«ng quan t©m!/no",
	};
    Say(str[1],11,str[2], str[3], str[4], str[5],str[6], str[7], str[8], str[9],str[10], str[11], str[12])
end

function onweaponhelp(nSel)
	strHelp = 
	{
		"§Æt vò khÝ cÇn th¨ng cÊp gi÷a giao diÖn kh¶m n¹m, ®å phæ ®Æt vµo thanh ®¼ng cÊp. NÕu phï hîp ®iÒu kiÖn sÏ th¨ng ®¼ng cÊp",
		"L¨ng V­¬ng Th­îng §o¹n T¹o Tµn Biªn lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp th­¬ng. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"HuyÒn Vâ Chïy Chi §óc T¹o ThuËt lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp chïy. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"Long Ng©m KiÕm §o¹n T¹o §å lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp kiÕm. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"Gia C¸t C¬ Qu¸t MËt YÕu lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp ná. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"LiÔu DiÖp To¸i Phong §ao. Tôy Thó Biªn lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp phi ®ao. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"HuyÒn NguyÖt §ao Tö Kinh B¶o Lôc lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp ®ao. Nghe nãi ®ang ë trong tay ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"Thiªn C¬ C«n ®å phæ lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp c«n. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"¸m KhÝ Tæng phæ. QuyÓn 1 lµ ®å phæ dïng ®Ó t¨ng ®¼ng cÊp phi tiªu. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
		"Uyªn ¦¬ng ®ao. Khai Quang biªn lµ ®å phæ vò khÝ lo¹i song ®ao, sö dông cã thÓ t¨ng cÊp song ®ao. Nghe nãi ®ang trong tay cña ThÇn BÝ Th­¬ng Nh©n ë D­¬ng Ch©u vµ L©m An.",
	};
	Talk(1,"",strHelp[nSel + 1]);   
end

function armorhelp()
	Talk(1,"","Ta gi¶i thÝch ph­¬ng ph¸p kh¶m n¹m y phôc. Dùa vµo B¨ng Tµm V« Cùc T¬ cña Thiªn s¬n TuyÕt Linh phèi hîp víi ph­¬ng ph¸p bÝ truyÒn cña ta qua bao lÇn ®óc luyÖn sÏ thµnh c«ng th¨ng cÊp ®­îc ®¼ng cÊp y phôc. Dùa vµo Nam Minh Chi Tinh cña Tam Miªu Hoang Nguyªn kÕt hîp víi ph­¬ng ph¸p bÝ truyÒn cña ta qua c¸c giai ®o¹n ®óc luyÖn sÏ thµnh c«ng gi¶m ®­îc ®¼ng cÊp y phôc.")
end

function helmhelp()
	Talk(1,"","Nh÷ng thø cßn l¹i nµy sÏ gióp ng­¬i t¨ng ®­îc ®¼ng cÊp mò, nh­ng ng­¬i ph¶i thùc hiÖn ®óng theo c¸c b­íc tr×nh tù cña nã, nÕu kh«ng th× sè ®iÓm cña ng­¬i sÏ l¹i bÞ gi¶m xuèng ")
end

function no()
end;