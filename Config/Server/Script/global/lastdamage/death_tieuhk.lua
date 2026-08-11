--Boss Tieu Hoang Kim
function LastDamage(NpcIndex)
end;

--khi hoi sinh
function Revive(NpcIndex)
		local Series = GetNpcSer(NpcIndex);--
	local nSTVL, nDoc, nBang, nHoa, nLoi = 0,0,0,0,0;
	if(Series==0) then		--KIM
		nSTVL = 1500;
	elseif(Series==1) then	--MOC
		nDoc = 500;
	elseif(Series==2) then	--THUY
		SetNpcSkill(NpcIndex, 88, 1, 1);
		SetNpcSkill(NpcIndex, 88, 1, 2);
		SetNpcSkill(NpcIndex, 88, 1, 3);
		SetNpcSkill(NpcIndex, 88, 1, 4);
		nBang = 1500; 
	elseif(Series==3) then	--HOA
		nHoa = 1500;
	elseif(Series==4) then	--THO
		nLoi = 1500;
	else					--KHONG CO HE, truong hop nay la add sai hay sao do
		nSTVL = 1500;
	end
	
	SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi ,0);--
	SetNpcDmgEx(NpcIndex,nSTVL, nDoc, nBang, nHoa, nLoi ,1);--
	SetNpcResist(NpcIndex, 75, 75, 75, 75, 75);
	SetNpcHitRecover(NpcIndex,100);
end;

--Khi chet
function DeathSelf(NpcIndex)
	DelNpc(NpcIndex)
end;
