Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")
Include("\\script\\feature\\van_tieu\\lib.lua")

function main(nIndex)	
dofile("script/feature/van_tieu/tieudau.lua");
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
		Talk(1,"","Ai còng t­ëng nghÒ B¶o tiªu lµ sung s­íng! ThËt sù mçi lÇn ra ®i ®Òu kh«ng d¸m høa hÑn tr­íc ngµy vÒ!")
	return end
	Say("Thµnh §« tiªu côc cña chóng ta lu«n ®­îc sù tÝn nhiÖm cña giang hå",4,
	"VËn tiªu/vantieu",
	"§æi hé tiªu lÖnh/cuahang",
	"T×m hiÓu vËn tiªu/timhieu",
	"Ta chØ ghÐ qua/no")
end

function vantieu()
	local nTaskValue = GetTask(TASK_VANTIEU)
	local nTask = GetNumber(1,nTaskValue,1)
	if(nTask == 0) then
		Say("GÇn ®©y c«ng viÖc nhiÒu, ®¹o tÆc hoµnh hµnh kh¾p n¬i, mµ nh©n lùc l¹i thiÕu. VÞ ®©y cã muèn gióp ta mét chuyÕn kh«ng? SÏ cã lao phÝ xøng ®¸ng cho ng­¬i!",2,
		"Ta ®ång ý ¸p tiªu/batdau",
		"Ta ®ang rÊt bËn/no")
	elseif(nTask < 4) then
		if(GetItemCount(0,6,4771) > 0) then
		bicuop()
		return end
		Say("Kh«ng ph¶i ng­¬i ®ang ¸p tiªu sao? Sao l¹i ®Õn ®©y t×m ta?",3,
		"Ta bÞ thÊt l¹c, gióp ta t×m tiªu xa/timxe",
		"Ta kh«ng muèn lµm n÷a/huybo",
		"Ta chØ ghÐ qua/no")
	else
		hoanthanh()
	end
end

function batdau()
	if(GetFightState() == 1) then
		Talk(1,"","Tr¹ng th¸i chiÕn ®Êu kh«ng thÓ nhËn nhiÖm vô")
	return end
	if(GetLevel() < 120) then
		Talk(1,"","H·y cè g¾ng luyÖn tËp ®¹t cÊp 120 råi ®Õn gÆp ta")
	return end
	local nTask = GetTask(TASK_RESET5)
	local nLan = GetNumber(1,nTask, 6)
	if(nLan > 1) then
		if(GetItemCount(0,6,4772) < 1) then
		Talk(1,"","H«m nay ng­¬i ®· ¸p tiªu nhiÒu lÇn råi. H·y nghØ ng¬i mai l¹i ®Õn gÆp ta.")
		return end
	end
	if(GetCash() < 10000) then
		Talk(1,"","Ng­¬i cÇn nép 1 v¹n l­îng phÝ hao tæn tiªu xa!")
	return end
	if(nLan > 1) then
		DelItem(1,0,6,4772)
	else
	SetTask(TASK_RESET5, SetNumber(1,nTask,6,nLan+1))
	end
	local w,x,y = GetWorldPos()
--	local nCamp = GetCurCamp();
	local n = RANDOM(2)
	local nId = AddNpcNew(TIEUXA_TEMPLET[nRand][1],1,w,x*32,y*32,"\\script\\feature\\van_tieu\\tieuxa.lua",GetCurCamp(),nil,nil,5,0,500000)
	SetNpcOwner(nId,GetName(),1)
	SetNpcBoss(nId,3);
	SetNpcName(nId,nName..TIEUXA_TEMPLET[nRand][2]);
	SetNpcTimeout(nId,32400)
	SetNpcValue(nId,GetUUID());
	SetTask(TASK_NPCVANTIEU, GetNpcID(nId))
	AddNote(5,1,"H·y mau hé tèng tiªu xa ®Õn Long M«n tiªu s­ ë Thanh Thµnh S¬n <color=Red>(243/219)<color>")
	n = n+1
	SetTask(TASK_VANTIEU, SetNumber(1,GetTask(TASK_VANTIEU),1,n))
	SetTask(TASK_VANTIEU, SetNumber(1,GetTask(TASK_VANTIEU),2,RANDOM(1,3)))
	Pay(10000)
end

function cuahang()
	Say("Ng­¬i hiÖn cã: <color=red>"..GetItemCount(0,6,4774).."<color> Hé Tiªu lÖnh. H·y lùa chän vËt phÈm cÇn thiÕt cho tiªu xa:",5,
	"T¨ng tèc (4 hé tiªu lÖnh)/Input('ok_buy(4775,4)',50)",
	"Håi m¸u (3 hé tiªu lÖnh)/Input('ok_buy(4776,3)',50)",
	--"Ph¶n ®ßn (4 hé tiªu lÖnh)/Input('ok_buy(4777,4)',50)",
	"DÞch chuyÓn (3 hé tiªu lÖnh)/Input('ok_buy(4778,3)',50)",
	"Ta ch­a muèn ®æi/no")
end

function ok_buy(nRow, nItem)
	if(CheckRoom(1,1) == 0) then
	Talk(1,"","Hµnh trang cña ng­¬i kh«ng cßn chç trèng")
	return end
	local nNum = tonumber(GetInput())
	if (nNum == 0) then
	return end
	local nHave = GetItemCount(0,6,4774)
	local nNeed = nNum*nItem
	if(nNeed > nHave) then
	Talk(1,"","Ng­¬i kh«ng mang ®ñ hé tiªu lÖnh råi")
	return end
	AddItemID(AddItem(0,6,nRow,0,0,5,0,0),nNum)
	DelItem(nNeed,0,6,4774)
end

function hoanthanh()
	local nTaskValue = GetTask(TASK_VANTIEU)
	local nTask = GetNumber(1,nTaskValue,1)
	SetTask(TASK_VANTIEU, 0)
	SetTask(TASK_NPCVANTIEU, 0)
	phanthuong(nTask)
	Talk(1,"","Lµm tèt l¾m! §©y lµ phÝ lao vô cña ng­¬i!")
end

function bicuop()
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
	return end
	local nNpcIdx = FindNearNpc(GetTask(TASK_NPCVANTIEU))
	if(nNpcIdx > 0) then
		DelNpc(nNpcIdx)
	end
	local nKind = GetNumber(1,GetTask(TASK_VANTIEU),1)
	phanthuong(nKind)
	SetTask(TASK_VANTIEU, 0)
	SetTask(TASK_NPCVANTIEU, 0)
	DelItem(1,0,6,4771)
	Talk(1,"","Ng­¬i bÞ c­íp tiªu råi sao? Còng may ng­¬i ®· ®o¹t l¹i Tiªu Kú danh dù cña Thµnh §« tiªu côc. VÊt v¶ cho ng­¬i råi! §©y lµ mét nöa phÝ lao vô")
end

function huybo()
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
	return end
	local nNpcIdx = FindNearNpc(GetTask(TASK_NPCVANTIEU))
	if(nNpcIdx > 0) then
		DelNpc(nNpcIdx)
	end
	SetTask(TASK_VANTIEU, 0)
	SetTask(TASK_NPCVANTIEU, 0)
	Talk(1,"","C«ng viÖc ¸p tiªu kh«ng ph¶i lµ ®¬n gi¶n. Ng­¬i ch©n ­ít ch©n r¸o b­íc vµo nªn còng khã tr¸ch! Sau nµy h·y cè g¾ng lªn!")
	AddNote(5,2,"Kh«ng hoµn thµnh nhiÖm vô")
end

function timxe()
	if(GetCash() < 100000) then
	Talk(1,"","Ng­¬i cÇn nép phÝ 10 v¹n l­îng ®Ó ta cho ng­êi ®i t×m tiªu xa!")
	return end
	local nTask = GetTask(TASK_NPCVANTIEU)
	local nNpcIdx = FindAroundNpc(nTask)
	if (nNpcIdx > 0) then
		Talk(1,"","Kh«ng ph¶i tiªu xa cña ng­¬i ®ang ë ngay ®©y sao!")
	return end
	nNpcIdx = FindNearNpc(nTask)
	if(nNpcIdx > 0) then
		local w,x,y = GetNpcPos(nNpcIdx)
		NewWorld(w,x,y)
		SetTimer(54,3)
		Pay(100000)
		Talk(1,"","§· cã tin tøc tiªu xa! Ta sÏ cho ng­êi ®­a ng­¬i ®Õn ®ã!")
	else
		Talk(1,"","Kh«ng thÊy tin tøc! Tiªu xa cña ng­¬i cã lÏ ®· mÊt!")
	end
end

function timhieu()
	Talk(2,"","Con ®­êng hiÓm trë nhÊt lµ b¨ng qua Thanh Thµnh S¬n. N¬i ®ã ®Çy rÉy thó d÷ vµ ®¹o tÆc hoµnh hµnh. Ng­¬i ph¶i hé tiªu an toµn ®Õn n¬i giao cho tiªu s­ trung chuyÓn ®óng thêi gian!","Hµng hãa cÇn vËn chuyÓn cã 3 chñng lo¹i: vµng, b¹c, ®ång. Tiªu cµng gi¸ trÞ th× bän ®¹o tÆc cµng ®Ó m¾t tíi nªn cµng khã kh¨n nh­ng lao phÝ ng­¬i nhËn ®­îc còng t­¬ng xøng!")
end

KINH_NGHIEM = 1000000
function phanthuong(nFinish)
	if(nFinish == 4) then	--hoan thanh dong tieu xa
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),2)
		AddOwnExp(3*KINH_NGHIEM)
		AddNote(5,0,"Hoµn thµnh b¶o kª §ång Tiªu Xa, ngµi nhËn ®­îc phÇn th­ëng xøng ®¸ng")
	elseif(nFinish == 5) then	--hoan thanh bac tieu xa
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),4)
		AddOwnExp(6*KINH_NGHIEM)
		AddNote(5,0,"Hoµn thµnh b¶o kª B¹c Tiªu Xa, ngµi nhËn ®­îc phÇn th­ëng xøng ®¸ng")
	elseif(nFinish == 6) then	--hoan thanh vang tieu xa
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),6)
		AddOwnExp(9*KINH_NGHIEM)
		AddNote(5,0,"Hoµn thµnh b¶o kª Vµng Tiªu Xa, ngµi nhËn ®­îc phÇn th­ëng xøng ®¸ng")
	else	--bi cuop, chi nhan 1/2 thuong
		AddItemID(AddItem(0,6,4774,0,0,5,0,0),1)
		AddOwnExp(KINH_NGHIEM)
		AddNote(5,2,"Kh«ng hoµn thµnh nhiÖm vô")
	end
end

function no()
end