Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\loidai.lua");
function OnTimer()
	StopTimer();
end;

function OnMissionTimer(nIndex)
	StopMissionTimer(nIndex,5);
end;
