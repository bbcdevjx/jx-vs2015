Include("\\script\\event\\demhuyhoang\\event.lua");
Include("\\script\\header\\taskid.lua");

function main(nItemIdx)
	if (GetLevel() >= 90 and GetLevel() < 120) then
		Talk(1,"","B¹n chØ cã thÓ ¨n qu¶ Huy hoµng Trung cÊp.")
		return
	elseif (GetLevel() >= 120) then
		Talk(1,"","B¹n chØ cã thÓ ¨n qu¶ Huy hoµng Cao cÊp.")
		return
	end
	local nValue = GetTask(TASK_RESET);
	local nUsed = GetNumber(1,nValue,1);
	if (nUsed >= MAX_HUYHOANG_PER_DAY) then
		Msg2Player(format("H«m nay b¹n ®· ¨n %d qu¶ Huy hoµng, vâ c«ng th¨ng tiÕn qu¸ nhanh dÔ g©y t¸c dông ph¶n nghÞch, ngµy mai h·y tiÕp tôc vËy.",MAX_HUYHOANG_PER_DAY))
	return end
    SetTask(TASK_RESET,SetNumber(1,nValue,1,nUsed+1))
    AddOwnExp(500000)
    RemoveItem(nItemIdx,1)
end

