Include("\\script\\header\\taskid.lua")

function main(nItemIdx)
	local nWorldMaps = GetTask(TASK_SHXT);
	local _,detail = FindItemEx(nItemIdx);
	if (detail == 439) then
		nWorldMaps = nWorldMaps + 100;
		SetTask(TASK_SHXT,nWorldMaps);
		Msg2Player("B¹n nhËn ®­îc 100 m¶nh b¶n ®å S¬n Hµ X· T¾c! HiÖn t¹i b¹n cã tæng céng "..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
	elseif (detail == 2523) then
		nWorldMaps = nWorldMaps + 1000;
		SetTask(TASK_SHXT,nWorldMaps);
		Msg2Player("§¹i hiÖp nhËn ®­îc 1000 m¶nh b¶n ®å s¬n hµ x· t¾c! Tæng céng cã "..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
	end
	RemoveItem(nItemIdx,1);
end
