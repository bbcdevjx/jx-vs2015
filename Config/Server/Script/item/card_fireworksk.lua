function main(index)
	Say("ThiÖp ph¸o hoa nµy cã thÓ b¾n ph¸o hoa xung quanh ng­êi m×nh chóc phóc.", 2, format("B¾t ®Çu chóc phóc/want2fireworks(%d)",index), "Hñy bá /OnCancel")
end
	
function want2fireworks(index)
	Input(format("guiloichuc(%d)",index));
end

function guiloichuc(index)
	local name = GetInput();
	local nTIndex = FindPlayer(name)
	if (nTIndex > 0) then
	if (RemoveItem(index,1) == 1) then
	local nMyIdx = PlayerIndex;
	PlayerIndex = nTIndex;
	CastSkill(251,1);
	PlayerIndex = nMyIdx;
	Msg2Player("Lêi chóc phóc cña b¹n ®· gëi ®i thµnh c«ng!")
	else
		Msg2Player("Kh«ng t×m ®­îc thÎ! Xin thö l¹i 1 lÇn!.")
	end
	else
	Say("Xin lçi! "..name.." hiÖn t¹i kh«ng cã trªn m¹ng.",0)
	end
end