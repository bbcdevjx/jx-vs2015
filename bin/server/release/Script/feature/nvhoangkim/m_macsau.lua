--monster macsau
Include("\\script\\header\\taskid.lua");

function LastDamage(NpcIndex)
	local nTaskValue = GetTask(TASK_NVST);
	local nNpcVal = GetNpcValue(NpcIndex);
	if(nNpcVal == 0) then
		if(GetNumber(2,nTaskValue,2) == 2) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,2,3));
		AddOwnExp(20000);
		Talk(1,"",10397);
		Msg2Player("M¹c SÇu b¶o b¹n vÒ thµnh nãi chuyÖn.");
		AddNote(1,1,"Th¾ng ®­îc M¹c SÇu khiÕn b¹n hao tæn kh«ng Ýt sinh lùc. Nh­ng tµi n¨ng cña b¹n ®· ®­îc bé lé. H·y trë l¹i thµnh <color=Red>(182,198)<color> t×m c« ta. M¹c SÇu thÊt b¹i mµ vÉn vui vÎ, b¹n c¶m thÊy rÊt kú l¹.");
		end
	elseif(nNpcVal == 1) then
		if(GetNumber(2,nTaskValue,3) == 2) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,3,3));
		AddOwnExp(20000);
		Talk(1,"",10456);
		Msg2Player("B¹n h·y quay vÒ t×m Phã Nam B¨ng.");
		end
	else	--2
		if(GetNumber(2,nTaskValue,4) == 3) then
		SetTask(TASK_NVST, SetNumber(2,nTaskValue,4,4));
		AddItemID(AddItem(0,4,503,0,0,5,0,0));
		AddOwnExp(20000);
		Msg2Player("B¹n nhËn ®­îc 1 Tóc Kim PhËt T­îng.");
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
		nSTVL = 50;
	elseif(Series==1) then	--MOC
		SetNpcSkill(NpcIndex, 420, 50, 1);
		SetNpcSkill(NpcIndex, 425, 50, 2);
		SetNpcSkill(NpcIndex, 420, 50, 3);
		SetNpcSkill(NpcIndex, 425, 50, 4);
		nDoc = 15;--doc sat khong giong sat thuong khac, = sat thuong khac chia 5, vi no co rut' doc
	elseif(Series==2) then	--THUY
		SetNpcSkill(NpcIndex, 421, 50, 1);
		SetNpcSkill(NpcIndex, 426, 50, 2);
		SetNpcSkill(NpcIndex, 421, 50, 3);
		SetNpcSkill(NpcIndex, 426, 50, 4);
		nBang = 50; --neu quai he thuy thi cho bang sat
	elseif(Series==3) then	--HOA
		SetNpcSkill(NpcIndex, 422, 50, 1);
		SetNpcSkill(NpcIndex, 427, 50, 2);
		SetNpcSkill(NpcIndex, 422, 50, 3);
		SetNpcSkill(NpcIndex, 427, 50, 4);
		nHoa = 50;--quai he hoa thi cho hoa sat,tuy theo quai manh hay yeu ma` cho so nay, vi du 8x thi cho 75 chan han ok
	elseif(Series==4) then	--THO
		SetNpcSkill(NpcIndex, 423, 50, 1);
		SetNpcSkill(NpcIndex, 428, 50, 2);
		SetNpcSkill(NpcIndex, 423, 50, 3);
		SetNpcSkill(NpcIndex, 428, 50, 4);
		nLoi = 50;
	else					--KHONG CO HE, truong hop nay la add sai hay sao do
		SetNpcSkill(NpcIndex, 418, 50, 1);
		SetNpcSkill(NpcIndex, 418, 50, 2);
		SetNpcSkill(NpcIndex, 418, 50, 3);
		SetNpcSkill(NpcIndex, 418, 50, 4);
		nSTVL = 50;
	end
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,0);--sat thuong noi cong
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,1);--sat thuong ngoai cong
end

--Khi chet
function DeathSelf(NpcIndex)
end
