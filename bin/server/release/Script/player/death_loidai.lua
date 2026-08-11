Include("\\script\\header\\loidai.lua");

function OnDeath(nDesNpcIndex)
	local nDesPlayerIdx = NpcIdx2PIdx(nDesNpcIndex);
	local szDieName = GetName();
	SetDeathScript("")	
	LeaveGame();
	
	if (nDesPlayerIdx > 0) then
		PlayerIndex = nDesPlayerIdx;
		local szName = GetName();
		local nDestCamp = GetCurCamp();
		if (nDestCamp == 2 or nDestCamp == 3) then
			Msg2MSAll(BW_MISSIONID, GetMissionS(CITYID).." L«i ®µi tranh tµi ®ang diÔn ra, <color=yellow>"..szName.."<color> ë l«i ®µi ®¸nh b¹i <color=yellow>"..szDieName.."<color>.");
		end
	end;
end;