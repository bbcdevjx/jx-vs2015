Include("\\script\\header\\thongthuong.lua")

NPCLIFE = 30000
NPCEXP = 2250
--nguoi choi danh quai' cuoi cung` khi chet
function LastDamage(NpcIndex)
	ktnvthongthuong(NpcIndex);
end

--khi hoi sinh
function Revive(NpcIndex)

	--set skill theo ngu hanh, ap dung cho quai cap cao (co skill)------------
	local nSTVL, nDoc, nBang, nHoa, nLoi = 0,0,0,0,0;
		SetNpcSkill(NpcIndex, 419, 50, 1);
		SetNpcSkill(NpcIndex, 419, 50, 2);
		SetNpcSkill(NpcIndex, 424, 50, 3);
		SetNpcSkill(NpcIndex, 424, 50, 4);
		nSTVL = 40;
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
		SetNpcHitRecover(NpcIndex,35);--cao nhat la 100(ko giat) --tuy cam hung
		SetNpcSpeed(NpcIndex, 10);--toc do di chuyen tang len
		SetNpcResist(NpcIndex, 75, 75, 75, 75, 75);--khang' cac loai
		SetNpcDmgEx(NpcIndex,nSTVL*3, nDoc*3, nBang*3, nHoa*3, nLoi*3,0);--sat thuong noi cong
		SetNpcDmgEx(NpcIndex,nSTVL*3, nDoc*3, nBang*3, nHoa*3, nLoi*3,1);--sat thuong ngoai cong
	else	--thiet lap sat thuong cho npc thuong`, sat thuong y nhu cu~, con boss xanh thi x3, ok??
		SetNpcLife(NpcIndex, NPCLIFE);
		SetNpcBoss(NpcIndex,0)
		SetNpcExp(NpcIndex, NPCEXP);--set kinh nghiem lai nhu cu
		SetNpcHitRecover(NpcIndex,30);
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,0);--sat thuong noi cong
		SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi,1);--sat thuong ngoai cong
	end
end

--Khi chet
function DeathSelf(NpcIndex)
end
