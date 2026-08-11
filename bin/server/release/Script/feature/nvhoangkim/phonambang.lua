--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,3);
	if(nValue == 1 and GetItemCount(0,4,456)>0) then
		Say(10455,1,
		END_TALK.."/no");
		DelItem(1,0,4,456);
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,3,2));
		Msg2Player("Phã Nam B¨ng b¶o b¹n ®Õn tr­íc La Tiªu S¬n ®¸nh b¹i Ninh T­íng Qu©n (219,214)")
		AddNote(2,1,"Phã Nam B¨ng b¶o b¹n ®Õn tr­íc La Tiªu S¬n ®¸nh b¹i Ninh T­íng Qu©n (219,214)");
	return end
	if(nValue == 3) then
		Say(10457,1,
		END_TALK.."/done20");
	return end
	if(nValue == 4 and GetLevel() >= 30) then
		Say(10458,1,
		END_TALK.."/nv_30");
	return end
	if(nValue == 6) then
		Say(10459,1,
		END_TALK.."/done30");
	return end
	if(nValue == 7 and GetLevel() >= 40) then
		Say(10461,1,
		END_TALK.."/nv_40");
	return end
	if(nValue == 11) then
		Say("Phã Nam B¨ng: Thµnh c«ng råi? Ta còng biÕt ng­¬i sÏ thµnh c«ng.",1,
		END_TALK.."/done40");
	return end
	if(nValue == 12 and GetLevel() >= 50) then
		Say(14715,1,
		END_TALK.."/nv_50");
	return end
	if(nValue == 15 and GetItemCount(0,4,459)>0) then
		Say("Phã Nam B¨ng: Thµnh c«ng råi? Ta còng biÕt ng­¬i sÏ thµnh c«ng.",1,
		END_TALK.."/done50");
	return end
	if(nValue == 16 and GetLevel() >= 60) then
		Say(14743,1,
		END_TALK.."/nv_60");
	return end
	if(nValue == 19) then
		Say(14745,1,
		END_TALK.."/done60");
	return end
	Talk(1,"","Giang hå hiÓm ¸c, m­êi ba huynh ®Ö giê chØ cßn m×nh ta.");
end

function nv_30()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,5));
	AddOwnExp(10000);
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i Thôc C­¬ng S¬n ®¸nh b¹i L­ ThiÖn T­îng");
	AddNote(2,1,"Phã Nam B¨ng b¶o b¹n ®i Thôc C­¬ng S¬n ®¸nh b¹i L­ ThiÖn T­îng (231,199)");
end;

function nv_40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,8));
	AddOwnExp(15000);
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i t×m LÖ Thu Thñy (229/210) ë §¹i Lý")
	AddNote(2,1,"Phã Nam B¨ng b¶o b¹n ®i t×m LÖ Thu Thñy ë §¹i Lý (229/210)");
end;

function nv_50()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,13));
	AddOwnExp(30000);
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i Thiªn V­¬ng Bang t×m Hµn Giang §éc §iÕu TÈu.")
	Msg2Player("Thùc chÊt b¹n chØ cÇn ®Õn bÕn tµu Ba L¨ng HuyÖn lµ gÆp «ng ta.")
	AddNote(2,1,"§Õn bÕn tµu Ba L¨ng HuyÖn (n¬i ®i Thiªn V­¬ng §¶o) t×m Hµn Ng­ ¤ng");
end

function nv_60()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,17));
	AddOwnExp(50000);
	Msg2Player("Phã Nam B¨ng b¶o b¹n ®i t×m Kh«ng TÞch §¹i S­")
	AddNote(2,1,"Phã Nam B¨ng b¶o b¹n ®i t×m Kh«ng TÞch §¹i S­ ë BiÖn Kinh (208,183)");
end

function done20()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,4));
	AddOwnExp(5000);
	AddSkillState( 509, 1, 0,180);
	AddItemID(AddItem(2,0,181,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 hé uyÓn.")
	Msg2Player("Phã Nam B¨ng nãi sau nµy sÏ t×m b¹n.");
	Talk(1,"","Cè g¾ng lªn");
end;

function done30()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,7));
	AddOwnExp(10000);
	AddSkillState( 509, 1, 0, 180);
	AddItemID(AddItem(2,0,177,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 chiÕn gi¸p.")
	Msg2Player("Phã Nam B¨ng nãi L©m Uyªn Nhai cã mét kÕ ho¹ch lín, sau nµy sÏ t×m b¹n!")
	Talk(1,"","Cè g¾ng lªn");
end;

function done40()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,12));
	AddOwnExp(20000);
	AddSkillState(509,1,0,180);
	AddItemID(AddItem(2,0,179,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 chiÕc nhÉn.")
	Msg2Player("Phã Nam B¨ng nãi sau nµy sÏ t×m b¹n.");
end;

function done50()
	if (DelItem(1,0,4,459)==1)then
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,16));
	AddOwnExp(40000);
	AddSkillState(509,1,0,180);
	AddItemID(AddItem(0,0,10,2,7,0,0,0));
	Msg2Player("B¹n nhËn ®­îc mét con tuÊn m·.");
	Msg2Player("Phã Nam B¨ng nãi sau nµy sÏ t×m b¹n.");
	end
end;

function done60()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),3,20));
	AddOwnExp(40000);
	AddSkillState(509,1,0,180);
	Msg2Player("Phã Nam B¨ng nãi sÏ ®i Hoa S¬n lµm chót chuyÖn, sau nµy cã dÞp gÆp l¹i. B¹n quay vÒ t×m Long Ngò.")	
end;

function no()
end;