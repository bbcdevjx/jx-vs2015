Include("\\script\\header\\taskid.lua")
--nguoi choi danh quai' cuoi cung` khi chet
function LastDamage(NpcIndex)
	local nValue = GetTask(TASK_NVDANHVONG);
	local nKill = GetNumber(1,nValue,2);
	if(GetNumber(1,nValue,1) == 1 ) then
			if(nKill < 3) then
			nKill = nKill + 1;
			end
			SetTask(TASK_NVDANHVONG, SetNumber(1,nValue,2,nKill));
			local strInfo = "GiÕt ®­îc mét con heo rõng, ®· ®­îc "..nKill.." miÕng thÞt";
			Msg2Player(strInfo);
	end
end;

--khi phuc sinh
function Revive(NpcIndex)

	SetNpcLife(NpcIndex, 200);--set mau' quai' ngay tai day cung duoc
	local bBlueBoss = 0;
	if RANDOM(100) < 2 then		--xac suat 2% ra boss xanh
		bBlueBoss = 1;
	end
	if bBlueBoss == 1 then	--thiet lap thuoc tinh cho boss xanh
		SetNpcBoss(NpcIndex,1)
		local nLife = GetNpcLife(NpcIndex);
		nLife = floor(nLife/4);
		if(nLife <= 0) then
			nLife = 1
		end
		SetNpcLife(NpcIndex, nLife);
		SetNpcExp(NpcIndex, 1600);--kn boss xanh
		SetNpcHitRecover(NpcIndex,12);
		SetNpcSpeed(NpcIndex, 8);
		SetNpcResist(NpcIndex, 75, 75, 75, 75, 75);
		SetNpcDmgEx(NpcIndex,25,0,0,0,0,1);--sat thuong ngoai cong
	else	--thiet lap sat thuong cho npc thuong`
		SetNpcBoss(NpcIndex,0)
		SetNpcExp(NpcIndex, 400);--set kn quai thuong`
		SetNpcHitRecover(NpcIndex,6);
	end
end

--Khi chet
function DeathSelf(NpcIndex)
end
