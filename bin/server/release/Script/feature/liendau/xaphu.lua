Include("\\script\\header\\taskid.lua");

THANHTHI_RETURN={
{1  ,1659,3219},
{11 ,3204,5145},
{162,1592,3141},
{37 ,1771,3070},
{78 ,1553,3117},
{80 ,1758,3029},
{176,1451,3265}
};

function main(NpcIndex)
	if(GetNpcValue(NpcIndex) == 0) then
	Say(10022,2,
		"§­a ta rêi khái héi tr­êng/rangoai",
		"Ch­a cÇn/no")
	else
	Say(10050,2,
		"Ta muèn ra ngoµi chuÈn bÞ vµi thø /gohoitruong",
		"Ta ®· s½n sµng/no")
	end
end;

function rangoai()
	local nTask = GetNumber(1,GetTask(TASK_NVST),9);
			NewWorld(THANHTHI_RETURN[nTask][1],
			THANHTHI_RETURN[nTask][2],THANHTHI_RETURN[nTask][3])
end;

function gohoitruong()
	SubWorld = SubWorldID2Idx(396)
	if(IsMission(1) ~= 1) then
	return end
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then
	SetPMParam(1,nPlayerDataIdx,0,0)--setoffline
	SetPos(1492,3045)
	end
end;

function no()
end;