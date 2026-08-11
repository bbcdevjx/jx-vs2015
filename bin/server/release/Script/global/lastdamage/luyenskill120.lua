Include("\\script\\header\\taskid.lua");
KHAITHONG120 = "H¹ ®­îc 1 thÇn bÝ cao thñ. Kü n¨ng 120 cña b¹n ®· ®­îc n©ng cao."
FULLSKILL = "Kü n¨ng 120 cña b¹n ®· ®¹t ®Õn giíi h¹n ®¨ng phong t¹o cùc. Kh«ng luyÖn thªm ®­îc n÷a!"
TIMEPERDAY120 = "B¹n luyÖn c¶ ngµy trêi ®· thÊm mÖt, kh«ng cßn hiÖu qu¶. Mai h·y tiÕp tôc!"

SKILLEXP_ARRAY=
{
	{"§¹i Thõa Nh­ Lai Chó ",709},
	{"§¶o H­ Thiªn",708},
	{"BÕ NguyÖt PhÊt TrÇn",712},
	{"Ngù TuyÕt Èn",713},
	{"Mª ¶nh Tung",710},
	{"HÊp Tinh YÓm",711},
	{"Hçn Thiªn KhÝ C«ng",714},
	{"Ma ¢m PhÖ Ph¸ch",715},
	{"XuÊt ø BÊt NhiÔm",716},
	{"L­ìng Nghi Ch©n KhÝ ",717}
};

function luyen120()
	local lv;
	for i=1, getn(SKILLEXP_ARRAY) do
		lv = GetMagicLevel(SKILLEXP_ARRAY[i][2]);
		if(lv > 0) then
			if(lv >= 20) then
			return 2 end
			IncSkillExp(SKILLEXP_ARRAY[i][2],10000000)
		return  1 end
	end
	return 0
end

function LastDamage(NpcIndex)
	local nValue = GetTask(TASK_RESET);
	local nLan = GetNumber(2,nValue,3);
	if(nLan >= 10) then
			Msg2Player(TIMEPERDAY120)
	return end
	
	local nRet = luyen120();
	if(nRet == 1) then
		SetTask(TASK_RESET,SetNumber(2,nValue,3,nLan+1));
		Msg2Player(KHAITHONG120);
	elseif(nRet == 2) then
		Msg2Player(FULLSKILL)
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
