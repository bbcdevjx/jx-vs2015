Include("\\script\\event\\demhuyhoang\\event.lua")

function main(nNpcIdx)
	local nPlayerLevel = GetLevel();

	if (nPlayerLevel < 90) then
		nGetSeedLevel = 1;
	elseif (nPlayerLevel >= 90 and nPlayerLevel < 120) then
		nGetSeedLevel = 2;
	elseif (nPlayerLevel >= 120) then
		nGetSeedLevel = 3;
	end
	local nSeedLevel = GetNpcParam(nNpcIdx, 1)
	
	if  nSeedLevel ~= 4 and nGetSeedLevel~= nSeedLevel then
		if (1 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("ChØ cã ng­êi ch¬i cÊp d­íi 90 míi cã thÓ h¸i qu¶ nµy!")
		elseif (2 == GetNpcParam(nNpcIdx, 1)) then
			Msg2Player("Lo¹i qu¶ nµy chØ tõ cÊp 90 ®Õn cÊp 119 ng­êi ch¬i míi cã thÓ h¸i ®­îc.")
		else
			Msg2Player("Lo¹i qu¶ nµy ng­êi ch¬i tõ cÊp 120 trë lªn míi cã thÓ h¸i!")
		end
		return
	elseif nSeedLevel == 4 and nGetSeedLevel ~= 3 then
			Msg2Player("ChØ cã ng­êi ch¬i tõ cÊp 120 trë lªn míi cã thÓ h¸i qu¶ nµy!")
			return
	end;
	Msg2Player("Qu¶ vÉn ch­a chÝn, ph¶i ®îi 5 phót n÷a.")
end;

function Timeout(nNpcIdx)
	local nNewNpcIdx;
	if(GetNpcParam(nNpcIdx,1) ==1) then
		for i=1,getn(HUYHOANG_THAP) do
		nNewNpcIdx = AddNpcNew(1111,1,HUYHOANG_THAP[i][1],HUYHOANG_THAP[i][2],HUYHOANG_THAP[i][3],QUAHH_FILE,6)
		SetNpcParam(nNewNpcIdx,1,1);
		SetNpcTimeout(nNewNpcIdx, TIME_SWITCH);
		end
	elseif(GetNpcParam(nNpcIdx,1) ==2) then
		for i=1,getn(HUYHOANG_TRUNG) do
		nNewNpcIdx = AddNpcNew(1111,1,HUYHOANG_TRUNG[i][1],HUYHOANG_TRUNG[i][2],HUYHOANG_TRUNG[i][3],QUAHH_FILE,6)
		SetNpcParam(nNewNpcIdx,1,2);
		SetNpcTimeout(nNewNpcIdx, TIME_SWITCH);
		end
	elseif(GetNpcParam(nNpcIdx,1) ==3) then
		for i=1,getn(HUYHOANG_CAO) do
		nNewNpcIdx = AddNpcNew(1111,1,HUYHOANG_CAO[i][1],HUYHOANG_CAO[i][2],HUYHOANG_CAO[i][3],QUAHH_FILE,6)
		SetNpcParam(nNewNpcIdx,1,3);
		SetNpcTimeout(nNewNpcIdx, TIME_SWITCH);
		end
	elseif(GetNpcParam(nNpcIdx,1) ==4) then
		nNewNpcIdx = AddNpcNew(1118,1,336,46332,95226,QUAHH_FILE,6);
		SetNpcParam(nNewNpcIdx,1,4);
		SetNpcTimeout(nNewNpcIdx, TIME_SWITCH);		
		end;
	DelNpc(nNpcIdx);
end;