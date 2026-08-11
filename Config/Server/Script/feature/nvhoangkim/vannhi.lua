--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,4);
	if(nValue == 1 and GetItemCount(0,4,506)>0) then
		if(GetSex() == 0) then
		Say(10672,1,
		END_TALK.."/no");
		else
		Say(10673,1,
		END_TALK.."/no");
		end
		DelItem(1,0,4,506);
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,4,2));
		Msg2Player("V©n Nhi b¶o b¹n ®i L©m An t×m Th¸i C«ng C«ng (203,200)");
		AddNote(3,1,"V©n Nhi b¶o b¹n ®i L©m An t×m Th¸i C«ng C«ng (203,200)");
	return end
	if(nValue == 5) then
		Say(10705,1,
		END_TALK.."/done20");
	return end
	if(nValue == 9) then
		Say(10841,1,
		END_TALK.."/nv_302");
	return end
	Talk(1,"",14591);
end

function nv_302()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,10));
	Msg2Player("B¹n lËp tøc ®Õn Giang T©n th«n t×m Phã L«i Th­.");
	AddNote(3,1,"§Õn Giang T©n Th«n t×m Phã L«i Th­ (445,387)");
end;

function done20()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),4,6));
	AddOwnExp(30000);
	AddSkillState(509,1,0,180);
	AddItemID(AddItem(2,0,180,0,0,0,5));
	Msg2Player("B¹n nhËn ®­îc 1 yªu ®¸i.")
	Msg2Player("B¹n nhËn ®­îc 30.000 ®iÓm kinh nghiÖm");
	Talk(1,"","ThÊy ng­¬i cùc khæ v× ta, ta tÆng ng­¬i vËt nµy!");
	AddNote(3,1,"V©n Nhi b¶o b¹n ®i D­¬ng Ch©u t×m Tiªu S­ (199,194)");
end;

function no()
end;