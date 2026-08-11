RANDOM_POS={
{1308,3461},
{1311,3442},
{1324,3428},
{1337,3420},
{1352,3419},
{1350,3439},
{1342,3463},
{1321,3468}
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
		tong_ratran()
	else
		SetPos(1298,3474);
	end
	SetFightState(1)
	StopTimer()
end;

function tong_ratran()
	local nRanNum = RANDOM(1,getn(RANDOM_POS));
	SetPos(RANDOM_POS[nRanNum][1],RANDOM_POS[nRanNum][2]);
end;