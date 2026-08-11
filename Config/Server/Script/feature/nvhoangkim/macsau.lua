--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,2);
	local nNumItem = GetItemCount(0,4,455);
	if(nValue == 1 and nNumItem > 0) then
		Say(10374,1,
		END_TALK.."/no");
		DelItem(nNumItem, 4, 455);
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,2,2));
		Msg2Player("M¹c SÇu b¶o b¹n ra bÕn tµu ngoµi thµnh gÆp c« Êy")
		AddNote(1,2,"M¹c SÇu ph¸t hiÖn trong th­ cã ®éc! B¹n kh«ng muèn lé danh tÝnh cña Long Ngò, xem ra bªn trong cã uÈn khóc. M¹c SÇu hÑn b¹n ë ngoµi thµnh §¹i Lý. ¸c chiÕn xem ra khã tr¸nh khái.");
		AddNote(1,1,"M¹c SÇu hÑn b¹n t¹i bÕn tµu ngoµi thµnh §¹i Lý <color=Red>(204,186)<color>");
	return end
	if(nValue == 3) then
		Say(10398,1,
		"§èi tho¹i víi M¹c X¶o Nhi/macxaonhi");
	return end
	if(nValue == 4 and GetLevel() >= 30) then
		Say(10400,1,
		END_TALK.."/nv_30");
	return end
	if(nValue == 7 and GetItemCount(0,4,461) > 0) then
		DelItem(1,0,4,461);
		Talk(1, "done30", format("§©y kh«ng ph¶i lµ Hoµng Kim L©n sao? %s B¶n lÜnh cña ng­¬i còng kh«ng tÖ.",GetName()))
	return end
	if(nValue == 8 and GetLevel() >= 40) then
		Say(10428,1,
		END_TALK.."/nv_40");
	return end
	if(nValue == 11 and GetItemCount(0,4,460) > 0) then
		DelItem(1,0,4,460);
		Talk(1, "done40", format("Cöu HiÖn Chi ChØ! %s, ta qu¶ nhiªn kh«ng nh×n lÇm ng­êi.",GetName()))
	return end
	if(nValue == 18) then
		Say(10216,1,
		"§èi tho¹i víi M¹c SÇu/forward601");
	return end
	Talk(1,"",10373);
end;

function nv_30()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,5));
	AddOwnExp(10000);
	Msg2Player("M¹c SÇu b¶o b¹n ®i Thµnh §« TÝn T­íng Tù t×m C«ng Tö TiÕu ®iÒu tra tung tÝch cña Hoµng Kim L©n.")
	AddNote(1,2,"M¹c SÇu rÊt ng­ìng mé b¹n vµ hÐ lé tin tøc cña Thiªn Hoµng Long KhÝ. Bé gi¸p nµy TÇn Thñy Hoµng triÖu tËp thî rÌn 7 n­íc chÕ t¹o ra. Xung quanh bé gi¸p thÇn bÝ nµy cßn bao nhiªu ©m m­u?");
	AddNote(1,2,"M¹c SÇu b¶o b¹n ®i <color=red>Ph­îng T­êng<color> t×m Ng¹o V©n T«ng<color=red> (198,206)<color>, «ng ta sÏ cho b¹n biÕt nhiÒu bÝ mËt!");
	AddNote(1,0,"C«ng Tö TiÕu<enter>C«ng Tö TiÕu cña c¶i nh­ nói, m«n h¹ cã h¬n 3 ngµn sÜ tö. Nh­ng chØ v× 1 ch÷ T×nh mµ bÊt chÊp tÊt c¶.");
	AddNote(1,1,"M¹c SÇu b¶o b¹n ®i Thµnh §« TÝn T­íng Tù t×m C«ng Tö TiÕu ®iÒu tra tung tÝch cña Hoµng Kim L©n (403,319)");
end;

function nv_40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,9));
	AddOwnExp(15000);
	Msg2Player("M¹c SÇu b¶o b¹n ®i D­¬ng Ch©u t×m  H¹ V« Th¶ ®iÒu tra tung tÝch cña Cöu HiÖn Chi ChØ.")
	AddNote(1,1,"M¹c SÇu b¶o b¹n ®i D­¬ng Ch©u t×m  H¹ V« Th¶ ®iÒu tra tung tÝch cña Cöu HiÖn Chi ChØ (212,194)");
end;

function macxaonhi()
	Say(10399,1,
	END_TALK.."/done20");
	Msg2Player("M¹c SÇu b¶o sau nµy sÏ t×m b¹n.")
end;

function forward601()
	Say(10242,1,
		"§èi tho¹i víi Nam Cung Phi V©n/forward602");
end;

function forward602()
	Say(10286,1,
		"L¹i ®èi tho¹i víi M¹c SÇu/forward603");
end;

function forward603()
	Say(10313,1,
		END_TALK.."/done60");
end;

function done20()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,4));
	AddOwnExp(5000);
	AddSkillState(509,1,0,180);
	AddItemID(AddItem(0,0,10,2,1,0,0,0));
	AddItemID(AddItem(2,0,183,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 con tuÊn m· vµ 1 ®«i giÇy.")
end;

function done30()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,8));
	AddOwnExp(10000);
	AddSkillState(509,1,0,180);
	Msg2Player("M¹c SÇu nãi sau nµy sÏ t×m b¹n");
	AddItemID(AddItem(2,0,176,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 kh«i m·o.")
	Talk(1,"","Cè g¾ng lªn");
end;

function done40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,12));
	AddOwnExp(20000);
	AddSkillState(509,1,0,180);
	AddItemID(AddItem(2,0,178,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 h¹ng liªn.")
	Msg2Player("M¹c SÇu nãi sau nµy sÏ t×m b¹n. C« ta sÏ gióp b¹n tiÕn hµnh tÈy tñy, b¹n ®· cã c¬ héi söa ®iÓm kü n¨ng. NÕu b¹n kh«ng thuéc phe chÝnh ph¸i sÏ kh«ng ®­îc c¬ héi nµy.")
	if(GetFactionCamp() == 1) then
	Say("B¹n nhËn ®­îc 1 c¬ héi tÈy ®iÓm kü n¨ng miÔn phÝ.",1,"B¾t ®Çu tÈy/taykynang");
	end
end;

function done60()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,19));
	AddOwnExp(90000);
	AddSkillState(509,1,0,180);
	Msg2Player("M¹c SÇu sÏ cïng Nam Cung Phi V©n ®Õn Thiªn Long tù gi¶i quyÕt mét sè chuyÖn, b¹n h·y vÒ gÆp Long Ngò.")
end;

function no()
end;