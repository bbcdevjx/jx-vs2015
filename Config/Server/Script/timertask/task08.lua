Include("\\script\\lib\\worldlibrary.lua")
function OnTimer()
	StopTimer();
end;

function OnMissionTimer(nIndex)
	StopMissionTimer(nIndex,8);
end;