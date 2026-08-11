--monster gioi luu phong
Include("\\script\\header\\taskid.lua");

function LastDamage(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nNpcVal = GetNpcValue(NpcIndex);
	if(nNpcVal == 0) then
		if(GetNumber(2,nTaskValue,2) == 10) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,2,11));
		AddOwnExp(100000);
		AddItemID(AddItem(0,4,460,0,0,5,0,0));
		Msg2Player("B¹n ®· lÊy ®­îc Cöu HiÖn Chi ChØ, quay vÒ §¹i Lý gÆp M¹c SÇu phôc mÖnh.")
		Talk(1,"",10431);
		end
	elseif(nNpcVal == 1) then
		if(GetNumber(2,nTaskValue,3) == 9) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,3,10));
		AddOwnExp(100000);
		AddItemID(AddItem(0,4,458,0,0,5,0,0));
		Talk(1,"","Mét mãn b¶o bèi h¹i ng­êi, thËt kh«ng ®¸ng chót nµo...");
		Msg2Player("B¹n nhËn ®­îc B¹ch Long Tøc, quay vÒ t×m LÖ Thu Thñy.");
		end
	else	--2
		if(GetNumber(2,nTaskValue,4) == 15) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,4,16));
		AddOwnExp(100000);
		AddItemID(AddItem(0,4,199,0,0,5,0,0));
		Msg2Player("B¹n nhËn ®­îc B¶n ®å chiÕn l­îc cña Trung nguyªn tõ Tiªu V« Th­êng!");
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
		nSTVL = 100;
	elseif(Series==1) then	--MOC
		SetNpcSkill(NpcIndex, 420, 50, 1);
		SetNpcSkill(NpcIndex, 425, 50, 2);
		SetNpcSkill(NpcIndex, 420, 50, 3);
		SetNpcSkill(NpcIndex, 425, 50, 4);
		nDoc = 30;--doc sat khong giong sat thuong khac, = sat thuong khac chia 5, vi no co rut' doc
	elseif(Series==2) then	--THUY
		SetNpcSkill(NpcIndex, 421, 50, 1);
		SetNpcSkill(NpcIndex, 426, 50, 2);
		SetNpcSkill(NpcIndex, 421, 50, 3);
		SetNpcSkill(NpcIndex, 426, 50, 4);
		nBang = 100; --neu quai he thuy thi cho bang sat
	elseif(Series==3) then	--HOA
		SetNpcSkill(NpcIndex, 422, 50, 1);
		SetNpcSkill(NpcIndex, 427, 50, 2);
		SetNpcSkill(NpcIndex, 422, 50, 3);
		SetNpcSkill(NpcIndex, 427, 50, 4);
		nHoa = 100;--quai he hoa thi cho hoa sat,tuy theo quai manh hay yeu ma` cho so nay, vi du 8x thi cho 75 chan han ok
	elseif(Series==4) then	--THO
		SetNpcSkill(NpcIndex, 423, 50, 1);
		SetNpcSkill(NpcIndex, 428, 50, 2);
		SetNpcSkill(NpcIndex, 423, 50, 3);
		SetNpcSkill(NpcIndex, 428, 50, 4);
		nLoi = 100;
	else					--KHONG CO HE, truong hop nay la add sai hay sao do
		SetNpcSkill(NpcIndex, 418, 50, 1);
		SetNpcSkill(NpcIndex, 418, 50, 2);
		SetNpcSkill(NpcIndex, 418, 50, 3);
		SetNpcSkill(NpcIndex, 418, 50, 4);
		nSTVL = 100;
	end
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,0);--sat thuong noi cong
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,1);--sat thuong ngoai cong
end

--Khi chet
function DeathSelf(NpcIndex)
end
