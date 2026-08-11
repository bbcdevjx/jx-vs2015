Include("\\script\\item\\heart_head.lua")
function main(nItemIdx)
	if (use_heart() == 1) then
		RemoveItem(nItemIdx,1);
	end;
end
