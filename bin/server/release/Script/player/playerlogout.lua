--hoangnhk
Include("\\script\\header\\taskid.lua")
Include("\\script\\global\\npcchucnang\\dichquan.lua")
--offline live
function main()
end

function OnLogout()
	huyhamthu();
	SetTask(TASK_LVGAMESEC,GetCurServerSec());
end;