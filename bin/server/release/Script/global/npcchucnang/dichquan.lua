Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\repute_head.lua");

USELESS_LETTER=242
THANH_DICHTRAM={
{1,		{176,11,162,37,78,80},	{252,254,255,256,257,258}},--pt->la/tdo/dl/bk/td/dc
{11,	{176,1,162,37,78,80},	{262,263,265,266,267,268}},--tdo->la/pt/dl/bk/td/dc
{162,	{176,1,11,37,78,80},	{272,273,274,276,277,278}},--dl->la/pt/tdo/bk/td/dc
{37,	{176,1,11,162,78,80},	{282,283,284,285,287,288}},--bk->la/pt/tdo/dl/td/dc
{78,	{176,1,37,162,37,80},	{292,293,294,295,296,298}},--td->la/pt/tdo/dl/bk/dc
{80,	{176,1,11,162,37,78},	{302,303,304,305,306,307}},--dc->la/pt/tdo/dl/bk/td
{176,	{1,11,162,37,78,80},	{243,244,245,246,247,248}}--la->pt/tdo/dl/bk/td/dc
};

THANHTHI_DICHUYEN = {
{1,"Thµnh §«","§¹i Lý",11,162,1674,3132},
{2,"§¹i Lý","Thµnh §«",162,11,3021,5090},
}

MAX_RESTTIME = 60*60	--60 phut lam 1 lan
function main(NpcIndex)
	Say("<npc>: §· l©u ta kh«ng mµng ®Õn chuyÖn trªn giang hå, thêi cuéc lóc nµy qu¸ hçn lo¹n, ¾t h¼n triÒu ®×nh sÏ cã nhiÒu viÖc ph¶i lµm",3,
	"Ta muèn gióp ngµi ®­a th­/duathu",
	"Liªn quan TÝn sø/nvtinsu",
	"Ta chØ tiÖn ®­êng ghÐ qua/no");
end;

function nvtinsu()
	local _,_,nMapIndex = GetPos()
	local MapId = SubWorldIdx2ID(nMapIndex)
	if MapId ~= 11 and MapId ~= 162 then
		Talk(1,"","Tham gia nhiÖm vô TÝn Sø h·y ®i t×m DÞch Quan <color=red>Thµnh §«<color>hoÆc <color=red>§¹i Lý<color>!")
		return
	end
	
	Say("LINK:<npc>",0,"ViÖc qu©n c¬ cña TriÒu ®×nh gÇn ®©y lu«n bÞ giÆc Kim biÕt tr­íc, ta nghi ngê cã néi gi¸n. Nh­ng tr­íc khi mÊy tªn b¹i lo¹i nµy bÞ ph¸t hiÖn, ta muèn r»ng tin nµy kh¾p n¬i ®Òu biÕt, ng­¬i cã muèn gãp mét phÇn søc cho Quèc gia kh«ng?",7,
	"Ta b»ng lßng!/nhannvtinsu",
	"Ta ®Õn ®Ó giao nhiÖm vô TÝn sø /giaonvtinsu",
	"Ta muèn xãa bá nhiÖm vô TÝn sø /huynvtinsu",
	"Ta muèn biÕt vÒ nhiÖm vô TÝn sø!/timhieunvtinsu",
	"GÇn ®©y ta cã nhiÒu chuyÖn cÇn lµm!/no")
end;

function giaonvtinsu()
	local nTaskValue = GetTask(TASK_TINHNANG);
	local nTask =GetNumber(1,nTaskValue,1);
	local nNum =GetNumber(1,nTaskValue,1);
	if (nTask == 2 or nTask == 1) then
		SetTask(TASK_TINHNANG,SetNumber(1,nTaskValue,2,nNum+1));
		Say("LINK:<npc>",0,"Chóc mõng b¹n ®· hoµn thµnh nhiÖm vô!",1,"NhËn l·nh phÇn th­ëng/messenger_treasureprize")
	elseif nTask ~= 0 then
		Say("LINK:<npc>",0,"Xin h·y l­îng thø, ng­¬i vÉn ch­a hoµn thµnh nhiÖm vô hiÖn t¹i. L·o Xa Phu bªn c¹nh ta cã thÓ ®­a ng­¬i ®Õn b¶n ®å nhiÖm vô !",1,"KÕt thóc ®èi tho¹i/no")
	else
		Say("LINK:<npc>",0,"Ch­a tiÕp nhËn nhiÖm vô nµo ng­¬i cßn l¹i tr¶ nhiÖm vô! Ng­êi ®©u? B»m c¸i tªn nµy lµm nh©n b¸nh bao cho ta!",1,"KÕt thóc ®èi tho¹i/no")
	end
end

function huynvtinsu()
	SetTask(TASK_TINHNANG,0)
	Msg2Player("Ng­¬i ®· hñy bá thµnh c«ng nhiÖm vô TÝn Sø.")
end

function nhannvtinsu()
	local _,_,nMapIndex = GetPos()
	local nTaskValue = GetTask(TASK_TINHNANG);
	local nIsDoing = GetNumber(1,nTaskValue,1)
	local MapId = SubWorldIdx2ID(nMapIndex)
	if (GetLevel() < 120) then
		Say("LINK:<npc>",0,"Xin l­îng thø, ®¼ng cÊp cña ng­¬i hiÖn t¹i ch­a ®ñ 120. h·y tiÕp tôc t«i luyÖn råi ®Õn gÆp ta.",1,"KÕt thóc ®èi tho¹i/no")	
	elseif (nIsDoing ~= 0)  then
		Say("LINK:<npc>",0,"Xin lçi! NhiÖm vô TÝn sø cña b¹n ch­a hoµn thµnh, kh«ng thÓ tiÕp nhËn nhiÖm vô gièng nhau, xin hoµn thµnh nhiÖm vô nµy tr­íc, c¸m ¬n!",1,"KÕt thóc ®èi tho¹i/no")
	else
    	local nTaskFlag = nvtrangthai()
    	if nTaskFlag == 0 then
    		Say("LINK:<npc>",0,"Xin l­îng thø, H«m nay ng­¬i ®· vÊt v¶ råi. Ngµy mai h·y quay l¹i nhÐ.",1,"KÕt thóc ®èi tho¹i/no")
    		return
    	elseif nTaskFlag == -1 then
    		Say("LINK:<npc>",0,"H«m nay ng­¬i ®· mÖt mái råi. NÕu ng­¬i cã <color=yellow>Thiªn Khè B¶o LÖnh<color>, ta sÏ ph¸ lÖ cho ng­¬i tham gia thªm mét lÇn n÷a.",1,"KÕt thóc ®èi tho¹i/no")
    		return
    	elseif nTaskFlag == 2 then
    		Msg2Player("Ng­¬i cø cÇm Thiªn Khè B¶o LÖnh tham gia nhiÖm vô, <color=yellow>nhiÖm vô hoµn thµnh<color> ta sÏ thu håi LÖnh Bµi")
    	end
		if (MapId == 11) then
			if (luachonnv(1,1) ~= 10) then
					print("messenger_choice error:1")
			end
		elseif (MapId == 162) then
			if (luachonnv(2,2) ~= 10) then
					print("messenger_choice error:2")
			end
		else
			Msg2Player("Xin lçi! Kh«ng biÕt t¹i sao b¹n l¹i kh«ng thÓ nhËn nhiÖm vô TÝn sø? Xin liªn hÖ víi GM!")
		end
	end
end

function nvtrangthai()
	local nNormalTaskLimit = 2
	local nIBTaskLimit = 1
	local nTaskValue = GetTask(TASK_TINHNANG);
	local nTodayCnt = GetNumber(1,nTaskValue,2)
	if nTodayCnt < nNormalTaskLimit then
		return 1
	elseif  nTodayCnt < (nNormalTaskLimit + nIBTaskLimit) then
		local nCountIb = GetItemCount(0,6,2813)
		if nCountIb >= 1 then
			return 2
		else
			return -1
		end
	end
	return 0
end

function luachonnv(i,j)
	if (i == THANHTHI_DICHUYEN[j][2]) then	
		SetTask(TASK_TINHNANG,SetNumber(2,GetTask(TASK_TINHNANG),2,THANHTHI_DICHUYEN[j][2]));
		SetTask(TASK_TINHNANG,SetNumber(2,GetTask(TASK_TINHNANG),3,10));
		local name = GetName()
		Talk(1,"","B¹n nhËn ®­îc tõ "..THANHTHI_DICHUYEN[j][3].."®Õn"..THANHTHI_DICHUYEN[j][4].."cña nhiÖm vô TÝn sø ®Æc biÖt,"..THANHTHI_DICHUYEN[j][3].."DÞch tr¹m DÞch quan cung tèng"..name.."§¹i nh©n!")
		return 10
	end
end

function timhieunvtinsu()
	Say("LINK:<npc>",0,"NhiÖm vô TÝn Sø lµ nhiÖm vô gióp TriÒu §×nh ®­a th­ cho c¸c DÞch Quan ë c¸c Thµnh ThÞ, v× gÇn ®©y néi c¸c trong TriÒu §×nh xuÊt hiÖn ph¶n tÆc, cho nªn trong lóc ®­a th­ ng­¬i sÏ gÆp kh«ng Ýt nguy hiÓm. Kh«ng cã nh÷ng ng­êi dòng c¶m trÝ tuÖ siªu phµm nhÊt ®¼ng vµ tinh thÇn hîp t¸c ®oµn kÕt th× sÏ rÊt khã hoµn thµnh nhiÖm vô. ChØ cã ®¹t ®Õn <color=red> cÊp 120 trë lªn<color> míi cã thÓ tham gia. Tr­íc m¾t ng­¬i sÏ gÆp nh÷ng trë ng¹i cöa ¶i sau ®©y: <color=red> Thiªn B¶o khè<color>. Trong nh÷ng cöa ¶i nµy cã v« sè kÎ thï kh«ng gièng nhau vµ nh÷ng c¬ quan kú qu¸i,  ng­¬i ph¶i dùa vµo trÝ tuÖ cña m×nh ®Ó cã lùa chän cùc kú chÝn x¸c. Ta chØ cã ®«i lêi nh­ vËy choc ng­¬i thµnh c«ng, cè lªn chiÕn h÷u!",4,
	"Giíi thiÖu ®¼ng cÊp ®Þa ®å/dangcapdiado",
	"Giíi thiÖu Thiªn B¶o khè/gtthienbaokho",
	"KÕt thóc ®èi tho¹i/no")
end

function dangcapdiado()
	Say("LINK:<npc>",0,"Tr­íc m¾t chØ cã <color=red> cÊp 120 trë lªn<color> mét møc ®é nhiÖm vô",2,"Quay l¹i/timhieunvtinsu","KÕt thóc ®èi tho¹i/no")
end

function gtthienbaokho()
	Say("LINK:<npc>",0,"Ng­¬i hoÆc ®éi tr­ëng cña ng­¬i khi tiÕp nhËn nhiÖm vô v­ît ¶i Thiªn B¶o Khè, hÖ thèng sÏ ph©n phèi cho ng­¬i ngÉu nhiªn  nhËn ®­îc 5 ch÷ sè, c¨n cø vµo <color=red> dùa theo thø tù<color> cña ch÷ sè më ra <color=red> B¶o R­¬ng<color> cña sè thø tù ®èi øng trong cöa ¶i Thiªn B¶o Khè, th× cã thÓ qua ¶i. §­¬ng nhiªn, ph¶i më B¶o R­¬ng, ng­¬i ph¶i ®¸nh b¹i <color=red> boss B¶o Khè Thñ Hé Gi¶<color> bªn c¹nh B¶o R­¬ng. <color=red> Ngò Hµnh Phï<color> cã b¸n trong Kú Tr©n C¸c më ra cã thÓ nhËn ®­îc TriÖt Kim Phï, TriÖt Méc Phï, TriÖt Thñy Phï, TriÖt Háa Phï, TriÖt Thæ Phï, sau khi sö dông cã thÓ gióp ng­¬i dÔ dµng ®¸nh b¹i boss B¶o Khè Thñ Hé Gi¶.",2,"Quay l¹i/timhieunvtinsu","KÕt thóc ®èi tho¹i/no")
end

function duathu()
	local nValue = GetTask(TASK_NVDANHVONG);
	local nEnd = GetNumber(1,nValue, 4);
	local nBegin = GetNumber(1,nValue, 5);
	local w,x,y = GetWorldPos();
	if(nEnd == 0) then --chua co nhan
		local nTaskTime = GetTask(TASK_THOIGIAN2);
		if(GetCurServerSec() - nTaskTime < MAX_RESTTIME) then
		Talk(1,"",10092)
		return end
		Say(10094,2,
		"NhËn giao c«ng v¨n/nhannv",
		"HiÖn ta ®ang bËn/no")
	return end
	if(w == THANH_DICHTRAM[nBegin][1]) then
		local nItemIdx,Pos,X,Y=FindItem(4,THANH_DICHTRAM[nBegin][3][nEnd]);
		if(nItemIdx) then
			Talk(1,"",10097);
		else
			nItemIdx,Pos,X,Y=FindItem(4,USELESS_LETTER);
			if(nItemIdx) then
				if(Pos==3) then
				Say(10096,2,
				"Nép tiÒn/noptienvahuy",
				"Ta kh«ng cã tiÒn/kotien")
				else
					Talk(1,"","Ng­¬i ph¶i mang theo hµm th­ ta míi cã thÓ gióp ng­¬i hñy ®­îc");
				end
			else
				Say(10096,2,
				"Nép tiÒn/noptien",
				"Ta kh«ng cã tiÒn/kotien")
			end;
		end;
	elseif(w == THANH_DICHTRAM[nBegin][2][nEnd]) then
		if(GetItemCount(0,4,THANH_DICHTRAM[nBegin][3][nEnd]) > 0) then
		DelItem(1,0,4,THANH_DICHTRAM[nBegin][3][nEnd]);
		SetTask(TASK_THOIGIAN2,GetCurServerSec());
		SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),4,0));
		AddRepute(5);
		Earn(500);
		Msg2Player("Giao c«ng v¨n hoµn thµnh, b¹n nhËn ®­îc 5 ®iÓm danh väng");
		Talk(1,"",10318);
		else
		Talk(1,"",10319);
		end
	else
		Talk(1,"",10092);
	end
end

function nhannv()
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local w,x,y = GetWorldPos();
	for i=1,getn(THANH_DICHTRAM) do
		if(THANH_DICHTRAM[i][1] == w) then
			local nRand = RANDOM(1,getn(THANH_DICHTRAM[i][2]));
			AddItemID(AddItem(0,4,THANH_DICHTRAM[i][3][nRand],0,0,5,0,0));
			nTaskValue = SetNumber(1,nTaskValue,4,nRand);
			nTaskValue = SetNumber(1,nTaskValue,5,i);
			SetTask(TASK_NVDANHVONG,nTaskValue);
			Msg2Player("NhËn nhiÖm vô giao hµm th­ tõ "..GetWorldName(w).." ®Õn "..GetWorldName(THANH_DICHTRAM[i][2][nRand])..".");
			AddNote(13,1,"NhËn nhiÖm vô giao hµm th­ tõ "..GetWorldName(w).." ®Õn "..GetWorldName(THANH_DICHTRAM[i][2][nRand])..".");
			Talk(1,"",10097);			
		end
	end
end;

function noptien()
	if(GetCash() >= 2000) then
	Pay(2000);
	Repute_Reduce(1);
	SetTask(TASK_THOIGIAN2,GetCurServerSec());
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),4,0));
	Talk(1,"",10098);
	return end
	kotien();
end;

function noptienvahuy()
	if(DelItem(1,0,4,USELESS_LETTER)==1) then
	if(GetCash() >= 2000) then
	Pay(2000);
	Repute_Reduce(1);
	SetTask(TASK_THOIGIAN2,GetCurServerSec());
	SetTask(TASK_NVDANHVONG, SetNumber(1,GetTask(TASK_NVDANHVONG),4,0));
	Talk(1,"",10098);
	return end
	kotien();
	else
	Msg2Player("KhÊu trõ ®¹o cô thÊt b¹i");
	end;
end;

function kotien()
	Talk(1,"",10099);
end;

function huyhamthu()
	local nValue = GetTask(TASK_NVDANHVONG);
	local nEnd = GetNumber(1,nValue, 4);
	local nBegin = GetNumber(1,nValue, 5);
	if(nEnd~= 0) then
	local nTaskValue = GetTask(TASK_NVDANHVONG);
	local nItemIdx,Pos,X,Y=FindItem(4,THANH_DICHTRAM[nBegin][3][nEnd]);
	if(nItemIdx)then
		RemoveItem(nItemIdx,1);
		AddItemID(AddItem(0,4,USELESS_LETTER,0,0,5,0,0),Pos,X,Y);
	end;
	end;
end;

function no()
end;
