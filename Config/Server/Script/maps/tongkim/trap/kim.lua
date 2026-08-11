
RANDOM_POS_KIM={
{1585,3181},
{1570,3173},
{1551,3175},
{1544,3204},
{1550,3223},
{1569,3227},
{1586,3216},
{1592,3198}
};

function main(sel)
	
	local nRemain = GetRestTime() - 175*18; --180 giay chi lay 5 giay thoi
	if(nRemain > 0) then
		local nfRemain = floor(nRemain/18);
		if(nfRemain > 0) then
		Msg2Player("Vui lßng ®îi "..nfRemain.." gi©y n÷a míi cã thÓ ra trËn.");
		end
	return end
	local nPlayerDataIdx;
	nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(GetPMParam(1,nPlayerDataIdx,1) == 1) then --dang trong giai doan chien dau
		kim_ratran()
	else
		SetPos(1590,3170);
	end
	SetFightState(1)
	StopTimer()
end;

function kim_ratran()
	local nRanNum = RANDOM(1,getn(RANDOM_POS_KIM));
	SetPos(RANDOM_POS_KIM[nRanNum][1],RANDOM_POS_KIM[nRanNum][2]);
end;