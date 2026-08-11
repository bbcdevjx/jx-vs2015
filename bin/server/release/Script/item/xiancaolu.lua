function main(nItemIdx)
	if (GetNpcExpRate() <= 100) then
		AddSkillState(440, 1, 1, 60*60*18, 1);
		RemoveItem(nItemIdx,1);
	end
end