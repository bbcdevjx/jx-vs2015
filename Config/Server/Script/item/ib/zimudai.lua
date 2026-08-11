Include("\\script\\header\\taskid.lua")
function main(nItemIdx)
	Say("Tói tö mÉu cã thêi h¹n sö dông lµ: <color=yellow>"..get_expire_date().."<color>",2,
	"N¹p 1 tuÇn/recharge("..nItemIdx..")",
	"Hñy bá/no");
end

function get_expire_date()
	local nExpireTime = GetEquipItemEx();
	if (nExpireTime ~= 0) then
		return GetTimeDate("%Y-%m-%d %H:%M", nExpireTime);
	else
		return "Ch­a khëi ®éng";
	end
end;

function recharge(nItemIdx)
	SetTask(TASK_DUNGCHUNG3,SetNumber(1,GetTask(TASK_DUNGCHUNG3),1,1));
	RemoveItem(nItemIdx,1);
	local nExpireTime = GetEquipItemEx();
	if(nExpireTime<=0) then
		SetEquipItemEx(GetCurServerSec()+7*24*60*60);
	else
		SetEquipItemEx(GetEquipItemEx()+7*24*60*60);
	end;
	OpenEquipEx();
	Say("N¹p thµnh c«ng, tói tö mÉu cña ®¹i hiÖp cã thêi h¹n sö dông lµ: <color=yellow>"..get_expire_date().."<color>", 0);
end

function no()
end;