--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nValue = GetNumber(2,nTaskValue,2);
	if(nValue == 5) then
	Say(10402,1,
		END_TALK.."/nv_301");
	return end
	Talk(1,"",10401);
end;

function nv_301()
	SetTask(TASK_NVST, SetNumber(2,GetTask(TASK_NVST),2,6));
	AddOwnExp(10000)
	Msg2Player("C«ng Tö TiÕu b¶o b¹n ®i D­îc V­¬ng cèc t×m thuéc h¹ Giíi L­u Phong.")
	AddNote(1,1,"C«ng Tö TiÕu b¶o b¹n ®i D­îc V­¬ng cèc t×m thuéc h¹ Giíi L­u Phong. Nghe nãi h¾n ®ang ë D­îc V­¬ng cèc (289,205)");
end;

function no()
end;