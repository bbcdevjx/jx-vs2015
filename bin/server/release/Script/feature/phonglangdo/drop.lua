
function DropRate(NpcIndex)
	local nBoss = GetNpcBoss(NpcIndex);
	if(nBoss == 0) then
		if(random(1,10) < 6) then
		return end
		DropItem(NpcIndex,AddItem(0,1,2,0,5,5,0,0))
	else--boss
		DropItem(NpcIndex, AddItem(0,6,3361,0,0,5,0,0)) --bao ruong
		DropItem(NpcIndex, AddItem(0,6,3361,0,0,5,0,0)) --bao ruong
	end
	
end
