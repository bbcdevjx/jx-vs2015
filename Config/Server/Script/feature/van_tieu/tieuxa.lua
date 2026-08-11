Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")

function LastDamage(NpcIndex)
	local nNpcIdx = FindNearNpc(GetNpcID(NpcIndex))
	if(nNpcIdx > 0) then
	local dwPID = GetNpcValue(NpcIndex)
	local w,x,y = GetNpcPos(nNpcIdx)
	local nId=AddNpcNew(844,1,w,x*32-64,y*32,"\\script\\feature\\van_tieu\\ruongcuop.lua",6,"T¸n l¹c tiªu vËt")
	SetNpcTimeout(nId, 180)
	nId = AddNpcNew(1185,1,w,x*32,y*32,"\\script\\feature\\van_tieu\\tieuxahong.lua",6)
	SetNpcTimeout(nId, 3240)
	local nP = FindPlayer(GetNpcOwner(NpcIndex))
	if(nP > 0) then
		PlayerIndex = nP
		SetTask(TASK_NPCVANTIEU, GetNpcID(nId))
	end
	end
end

function Timeout(nIndex)
	DelNpc(nIndex)
end

function Revive(NpcIndex)
end

function DeathSelf(NpcIndex)
	DelNpc(NpcIndex)
end
