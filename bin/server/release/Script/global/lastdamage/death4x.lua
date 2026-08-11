NPCLIFE = 2000
NPCEXP = 1000
--nguoi choi danh quai' cuoi cung` khi chet
function LastDamage(NpcIndex)

end

--khi hoi sinh
function Revive(NpcIndex)

	--set skill theo ngu hanh, ap dung cho quai cap cao (co skill)------------
	local Series = GetNpcSer(NpcIndex) --ngu hanh
	local nSTVL, nDoc, nBang, nHoa, nLoi = 0,0,0,0,0;--khai bao'
	if(Series==0) then		--KIM
		SetNpcSkill(NpcIndex, 419, 5, 1);
		SetNpcSkill(NpcIndex, 419, 5, 2);
		SetNpcSkill(NpcIndex, 424, 5, 3);
		SetNpcSkill(NpcIndex, 424, 5, 4);
		nSTVL = 15;
	elseif(Series==1) then	--MOC
		SetNpcSkill(NpcIndex, 420, 5, 1);
		SetNpcSkill(NpcIndex, 420, 5, 2);
		SetNpcSkill(NpcIndex, 425, 5, 3);
		SetNpcSkill(NpcIndex, 425, 5, 4);
		nDoc = 5;--doc co rut nen cho thap hon cac loai khac ti'
	elseif(Series==2) then	--THUY
		SetNpcSkill(NpcIndex, 421, 5, 1);
		SetNpcSkill(NpcIndex, 421, 5, 2);
		SetNpcSkill(NpcIndex, 426, 5, 3);
		SetNpcSkill(NpcIndex, 426, 5, 4);
		nBang = 15; --neu quai he thuy thi cho bang sat
	elseif(Series==3) then	--HOA
		SetNpcSkill(NpcIndex, 422, 5, 1);
		SetNpcSkill(NpcIndex, 422, 5, 2);
		SetNpcSkill(NpcIndex, 427, 5, 3);
		SetNpcSkill(NpcIndex, 427, 5, 4);
		nHoa = 15;--quai he hoa thi cho hoa sat,tuy theo quai manh hay yeu ma` cho so nay, vi du 8x thi cho 75 chan han ok
	elseif(Series==4) then	--THO
		SetNpcSkill(NpcIndex, 423, 5, 1);
		SetNpcSkill(NpcIndex, 423, 5, 2);
		SetNpcSkill(NpcIndex, 428, 5, 3);
		SetNpcSkill(NpcIndex, 428, 5, 4);
		nLoi = 15;
	else					--KHONG CO HE, truong hop nay la add sai hay sao do
		SetNpcSkill(NpcIndex, 418, 5, 1);
		SetNpcSkill(NpcIndex, 418, 5, 2);
		SetNpcSkill(NpcIndex, 418, 5, 3);
		SetNpcSkill(NpcIndex, 418, 5, 4);
		nSTVL = 15;
	end
	--end setskill-----------------------ket thuc phan tinh skill va sat thuong---
	local bBlueBoss = 0;
	if (RANDOM(100) < 2) then		--xac suat 2% ra boss xanh
		bBlueBoss = 1;
	end
	if (bBlueBoss == 1) then	--thiet lap thuoc tinh cho boss xanh
		local nLife = floor(NPCLIFE/4);
		if(nLife <= 0) then
			nLife = 1
		end
		SetNpcBoss(NpcIndex,1) --xac suat boss xanh dung', nen cho no mau xanh
		SetNpcLife(NpcIndex, nLife);--set mau' cho boss xanh
		SetNpcExp(NpcIndex, NPCEXP*4);--kinh nghiem
		SetNpcReplenish(NpcIndex,1);--phuc hoi sinh luc
		SetNpcHitRecover(NpcIndex,16);--cao nhat la 100(ko giat) --boss xanh 60 la vua
		SetNpcSpeed(NpcIndex, 10);--toc do di chuyen tang len
		SetNpcResist(NpcIndex, 75, 75, 75, 75, 75);--khang' cac loai
		SetNpcDmgEx(NpcIndex,nSTVL*3, nDoc*3, nBang*3, nHoa*3, nLoi*3,0);--sat thuong noi cong
		SetNpcDmgEx(NpcIndex,nSTVL*3, nDoc*3, nBang*3, nHoa*3, nLoi*3,1);--sat thuong ngoai cong
	else	--thiet lap sat thuong cho npc thuong`
		SetNpcLife(NpcIndex, NPCLIFE);
		SetNpcBoss(NpcIndex,0)
		SetNpcExp(NpcIndex, NPCEXP);--set kinh nghiem lai nhu cu
		SetNpcHitRecover(NpcIndex,10);
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,0);--sat thuong noi cong
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,1);--sat thuong ngoai cong
	end
end

--Khi chet
function DeathSelf(NpcIndex)
end
