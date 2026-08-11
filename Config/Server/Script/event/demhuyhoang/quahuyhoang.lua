Include("\\script\\header\\taskid.lua");
function main(nNpcIdx)
	
	if (0 == GetCamp()) then
		Msg2Player("B¹n ch­a gia nhËp m«n ph¸i, kh«ng thÓ h¸i qu¶.")
		return
	end
	if (0 == GetFightState() or GetLife(0) <= 0) then
		Msg2Player("Kh«ng thÓ h¸i qu¶.")
		return
	end
	local nValue = GetTask(TASK_RESET);
	local nNum = GetNumber(1,nValue,2);
	if (nNum >= 5) then
		Msg2Player("B¹n chØ cã thÓ h¸i ®­îc tèi ®a 5 qu¶ huy hoµng trong mét ngµy.")
	return end
	local nPlayerLevel = GetLevel();
	local nGetSeedLevel;

	if (1 == GetNpcParam(nNpcIdx, 1)) then
		if (nPlayerLevel >= 90) then
		Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 90 trë xuèng cã thÓ h¸i!")
		return end;
	elseif (2 == GetNpcParam(nNpcIdx, 1)) then
		if (nPlayerLevel < 90 or nPlayerLevel >= 120) then
		Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 90 ®Õn cÊp 119 míi cã thÓ h¸i.")
		return end;
	else
		if (nPlayerLevel < 120) then
			Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 120 trë lªn míi cã thÓ h¸i!")
		return end;
	end;
	Msg2Player("§ang thu thÊp...");
	PaceBar("thuthap("..nNpcIdx..")",180)
end;

function thuthap(nNpcIdx)
	if(nNpcIdx <= 0) then return end;
	if(GetNpcParam(nNpcIdx, 1) >= 1 and GetNpcParam(nNpcIdx, 1) <= 3) then
		if(GetNpcParam(nNpcIdx,4) >= 5) then
			return
		end;	
		local nValue = GetTask(TASK_RESET);
		local nNum = GetNumber(1,nValue,2);		
		SetTask(TASK_RESET,SetNumber(1,nValue,2,nNum+1))
		local nItemIdx = AddItemID(AddItem(0,6,904+GetNpcParam(nNpcIdx, 1),0,0,5,0,0));
		AddTimeItem(nItemIdx, 604800);
		Msg2Player(format("B¹n nhËn ®­îc mét %s ",GetNameItem(nItemIdx)));
		SetNpcParam(nNpcIdx, 4, GetNpcParam(nNpcIdx,4)+1)		
		if(GetNpcParam(nNpcIdx,4) >= 5) then
			DelNpc(nNpcIdx)
		end
	elseif(GetNpcParam(nNpcIdx, 1) == 4) then
		if(GetNpcParam(nNpcIdx,4) >= 1) then
			return
		end;	
		local nItemIdx = AddItemID(AddItem(0,6,908,0,0,5,0,0));
		AddTimeItem(nItemIdx, 604800);
		AddNews(format("§¹i hiÖp %s ®· h¸i ®­îc qu¶ Hoµng Kim!!!",GetName()));
		SetNpcParam(nNpcIdx, 4, GetNpcParam(nNpcIdx,4)+1)		
		DelNpc(nNpcIdx)
	end
end;

function Timeout(nNpcIdx)
	DelNpc(nNpcIdx);
end;