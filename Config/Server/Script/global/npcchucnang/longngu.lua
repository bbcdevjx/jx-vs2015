Include("\\script\\header\\taskid.lua");
Include("\\script\\lib\\worldlibrary.lua");

function main()
	if(SERVER_MODE == 1) then
	Talk(1,"",SERVER_NOTICE)
	return end
	Say("LINK:<npc>",0,10194,3,"Ta ®Õn lµm nhiÖm vô ChÝnh tuyÕn cÊp 20 trë lªn/nhiemvuchinh","Ta ®Õn xem giíi thiÖu vÒ nhiÖm vô /xemgioithieu","Sau nµy h·y nãi/no")
end;

function xemgioithieu()
	Say("LINK:<npc>",0,10243,1,"KÕt thóc ®èi tho¹i/no")
end;

function nhiemvuchinh()
	local nTaskValue = GetTask(TASK_NVST);
	local nChinh = GetNumber(2,nTaskValue,2);
	local nTrung = GetNumber(2,nTaskValue,3);
	local nTa = GetNumber(2,nTaskValue,4);
	if(nChinh > 19 and nTrung > 20 and nTa > 29) then
	Talk(1,"","Sau nµy ng­¬i ph¶i tù b¶o träng!");
	return end;
	if(nChinh == 19) then
	Talk(1,"donechinh",10340);
	return end
	if(nTrung == 20) then
	Talk(1,"donetrung",14746);
	return end
	if(nTa == 29 and GetItemCount(0,4,463)>0) then
	Talk(1,"doneta","Cã chót quµ tÆng cho ng­¬i!");
	return end
	if(GetLevel() < 20) then
	Talk(1,"",10344);
	return end;
	if(GetFactionNo() < 0) then
	Talk(1,"",12636);
	return end;
	Say(10345,2,"Ta muèn nhËn nhiÖm vô cÊp 20 trë lªn/selnv","Ta chØ ®Õn ch¬i/no")
end;

function selnv()
	Say(10346,4,"ChÝnh ph¸i/nhannv","Trung lËp/nhannv","Tµ ph¸i/nhannv","§Ó ta suy nghÜ l¹i/no")
end;

function nhannv(sel)
	local nSel = sel + 2;
	local nTaskValue = GetTask(TASK_NVST);
	if(GetNumber(2,nTaskValue,nSel) > 0) then
		Talk(1,"",10369);
	return end;
	if(CheckRoom(1,1) == 0) then
		Talk(1,"",12265);
	return end;
	SetTask(TASK_NVST, SetNumber(2,nTaskValue,nSel,1));
	local nNewItem = AddItemID(AddItem(0,6,130,0,0,5,0));
	SetParamItem(nNewItem,sel);
	Msg2Player("NhËn ®­îc mét tói th­ cña Long Ngò.")
end;

function donechinh()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,20));
	AddOwnExp(300000);
	AddItemID(AddItem(0,4,random(490,501),0,0,5,0,0));
	if(random(1,2) == 1) then
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,10));
	else
		if(GetSex() == 0) then
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,5));
		else
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,5));
		end
	end
	Msg2Player("B¹n B¹n nhËn ®­îc mét mãn b¶o khÝ.")
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô M¹c SÇu giao. Long Ngò v« cïng hµi lßng, nh­ng b­íc ®­êng giang hå chØ míi b¾t ®Çu.")
end;

function donetrung()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,21));
	AddOwnExp(300000);
	AddItemID(AddItem(0,4,random(490,501),0,0,5,0,0));
	if(random(1,2) == 1) then
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,10));
	else
		if(GetSex() == 0) then
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,5));
		else
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,5));
		end
	end
	Msg2Player("B¹n B¹n nhËn ®­îc mét mãn b¶o khÝ.")
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô s¸t thñ Phã Nam B¨ng giao. Trªn giang hå b¹n ®· cã chót danh tiÕng, ®©y còng kh«ng ph¶i lµ chuyÖn tèt, trong thµnh cã nhiÒu tai m¾t theo dâi.")
end;

function doneta()
	if(DelItem(1,0,4,463)==1) then
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,30));
	AddOwnExp(300000);
	AddItemID(AddItem(0,4,random(490,501),0,0,5,0,0));
	if(random(1,2) == 1) then
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,10));
	else
		if(GetSex() == 0) then
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,5));
		else
		AddItemID(AddItem(2,0,RANDOM(167,175),0,0,0,5));
		end
	end
	Msg2Player("B¹n B¹n nhËn ®­îc mét mãn b¶o khÝ.")
	Msg2Player("B¹n ®· hoµn thµnh nhiÖm vô chñ tuyÕn Tµ ph¸i. Sau nµy cã lÏ cã nhiÒu trËn chiÕn ®ang chê b¹n, mét kÎ m¸u l¹nh.")
	end
end;

function no()
end;