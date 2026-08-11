--monster oandoc
Include("\\script\\header\\taskid.lua");

function LastDamage(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nNpcVal = GetNpcValue(NpcIndex);
	if(nNpcVal == 0) then
		if(GetNumber(2,nTaskValue,2) == 14) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,2,15));
		AddOwnExp(230000);
		Msg2Player("B¹n lÊy ®­îc thñ cÊp O¸n §éc.")
		Msg2Player("B¹n cã thÓ vÒ L©m An gÆp M¹nh Phµm.")
		Talk(1,"","§êi ng­êi ai còng mét lÇn chÕt! Nh­ng chÕt nh­ thÕ nµy thËt kh«ng cam t©m!");
		end
	elseif(nNpcVal == 1) then
		if(GetNumber(2,nTaskValue,3) == 14) then
		AddItemID(AddItem(0,4,459,0,0,5,0,0));
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,3,15));
		AddOwnExp(230000);
		Talk(1,"","Long §o¹n ë ®©y, ng­¬i lÊy ®i...");
		Msg2Player("B¹n nhËn ®­îc chiÕn th­¬ng Long §o¹n, quay vÒ gÆp Phã Nam B¨ng.");
		end
	elseif(nNpcVal == 2) then
		if(GetNumber(2,nTaskValue,4) == 21) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,4,22));
		AddOwnExp(230000);
		Msg2Player("B¹n ®¸nh th¾ng Lôc Phi lÊy ®­îc b×nh Lam Hoa!");
		end
	else	--3
		if(GetNumber(2,nTaskValue,4) == 23) then	--done50
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,4,24));
		AddOwnExp(350000);
		AddSkillState(509,1,0,180);
		AddItemID(AddItem(0,6,71,0,0,5,0,0));--tien thao lo
		Msg2Player("B¹n chiÕn th¾ng §å §¬n §¹i nh©n!");
		Msg2Player("B¹n nhËn ®­îc 350.000 ®iÓm kinh nghiÖm");
		Msg2Player("B¹n nhËn ®­îc mét b×nh Tiªn Th¶o Lé ");
		Say(11021,1,
		"KÕt thóc ®èi tho¹i/no");
		AddNote(3,1,"§Õn Thiªn NhÉn Gi¸o t×m §oan Méc DuÖ");
		end
	end
end;

function Revive(NpcIndex)
	--set skill theo ngu hanh, ap dung cho quai cap cao (co skill)------------
	local Series = GetNpcSer(NpcIndex)
	local nSTVL, nDoc, nBang, nHoa, nLoi = 0,0,0,0,0;
	if(Series==0) then		--KIM
		SetNpcSkill(NpcIndex, 419, 50, 1);
		SetNpcSkill(NpcIndex, 424, 50, 2);
		SetNpcSkill(NpcIndex, 419, 50, 3);
		SetNpcSkill(NpcIndex, 424, 50, 4);
		nSTVL = 125;
	elseif(Series==1) then	--MOC
		SetNpcSkill(NpcIndex, 420, 50, 1);
		SetNpcSkill(NpcIndex, 425, 50, 2);
		SetNpcSkill(NpcIndex, 420, 50, 3);
		SetNpcSkill(NpcIndex, 425, 50, 4);
		nDoc = 40;--doc sat khong giong sat thuong khac, = sat thuong khac chia 5, vi no co rut' doc
	elseif(Series==2) then	--THUY
		SetNpcSkill(NpcIndex, 421, 50, 1);
		SetNpcSkill(NpcIndex, 426, 50, 2);
		SetNpcSkill(NpcIndex, 421, 50, 3);
		SetNpcSkill(NpcIndex, 426, 50, 4);
		nBang = 125; --neu quai he thuy thi cho bang sat
	elseif(Series==3) then	--HOA
		SetNpcSkill(NpcIndex, 422, 50, 1);
		SetNpcSkill(NpcIndex, 427, 50, 2);
		SetNpcSkill(NpcIndex, 422, 50, 3);
		SetNpcSkill(NpcIndex, 427, 50, 4);
		nHoa = 125;--quai he hoa thi cho hoa sat,tuy theo quai manh hay yeu ma` cho so nay, vi du 8x thi cho 75 chan han ok
	elseif(Series==4) then	--THO
		SetNpcSkill(NpcIndex, 423, 50, 1);
		SetNpcSkill(NpcIndex, 428, 50, 2);
		SetNpcSkill(NpcIndex, 423, 50, 3);
		SetNpcSkill(NpcIndex, 428, 50, 4);
		nLoi = 125;
	else					--KHONG CO HE, truong hop nay la add sai hay sao do
		SetNpcSkill(NpcIndex, 418, 50, 1);
		SetNpcSkill(NpcIndex, 418, 50, 2);
		SetNpcSkill(NpcIndex, 418, 50, 3);
		SetNpcSkill(NpcIndex, 418, 50, 4);
		nSTVL = 125;
	end
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,0);--sat thuong noi cong
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,1);--sat thuong ngoai cong
end

--Khi chet
function DeathSelf(NpcIndex)
end

function no()
end;