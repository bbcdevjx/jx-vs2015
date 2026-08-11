Include("\\script\\header\\taskid.lua")

function DropRate(NpcIndex)
	local nValue = GetNpcValue(NpcIndex)
	local nTaskValue = GetTask(TASK_VANTIEU)
	local nTask = GetNumber(1,nTaskValue,2)
	if(nValue == nTask) then
		SetTask(TASK_VANTIEU, SetNumber(1,nTaskValue,2,0))
	end
	Msg2Player("§· h¹ s¸t mét tªn s¬n tÆc!")
end

function LastDamage(NpcIndex)
end

DAMAGE = 150
function Revive(NpcIndex)
	local nSeries = GetNpcSer(NpcIndex)
	local nSTVL, nDoc, nBang, nHoa, nLoi = 0,0,0,0,0
	if (nSeries == 0) then
		SetNpcSkill(NpcIndex, 321, 20, 1)
		SetNpcSkill(NpcIndex, 321, 20, 2)
		SetNpcSkill(NpcIndex, 321, 20, 3)
		SetNpcSkill(NpcIndex, 321, 20, 4)
		nSTVL = DAMAGE
	elseif (nSeries == 1) then
		SetNpcSkill(NpcIndex, 355, 20, 1)
		SetNpcSkill(NpcIndex, 355, 20, 2)
		SetNpcSkill(NpcIndex, 355, 20, 3)
		SetNpcSkill(NpcIndex, 355, 20, 4)
		nDoc = floor(DAMAGE/3)
	elseif (nSeries == 2) then
		SetNpcSkill(NpcIndex, 337, 20, 1)
		SetNpcSkill(NpcIndex, 337, 20, 2)
		SetNpcSkill(NpcIndex, 337, 20, 3)
		SetNpcSkill(NpcIndex, 337, 20, 4)
		nBang = DAMAGE 
	elseif (nSeries == 3) then
		SetNpcSkill(NpcIndex, 362, 20, 1)
		SetNpcSkill(NpcIndex, 362, 20, 2)
		SetNpcSkill(NpcIndex, 362, 20, 3)
		SetNpcSkill(NpcIndex, 362, 20, 4)
		nHoa = DAMAGE
	elseif (nSeries == 4) then
		SetNpcSkill(NpcIndex, 375, 20, 1)
		SetNpcSkill(NpcIndex, 375, 20, 2)
		SetNpcSkill(NpcIndex, 375, 20, 3)
		SetNpcSkill(NpcIndex, 375, 20, 4)
		nLoi = DAMAGE
	else
		nSTVL = DAMAGE
	end
	SetNpcDmgEx(NpcIndex, nSTVL, nDoc, nBang, nHoa, nLoi , 0)
	SetNpcDmgEx(NpcIndex, nSTVL, nDoc, nBang, nHoa, nLoi , 1)
end

function DeathSelf(NpcIndex)
end