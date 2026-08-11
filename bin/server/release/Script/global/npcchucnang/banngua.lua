--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(NpcIndex)
	SetTaskTemp(NPCINDEX, NpcIndex)
	local OK_TRADE = "Giao dÞch/giaodich";
	local NOT_TRADE = "Kh«ng giao dÞch/no";
	local w,x,y = GetWorldPos();
	if (w == 1) then--phuong tuong
	Say(12234,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 11) then--thanh do
	Say(12584,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 162) then--dai ly
	Say(12234,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 78) then--tuong duong
	Say(15266,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 37) then--bien kinh
	Say(14788,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 80) then--duong chau
	Say(15452,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 176) then--lam an
	Say(10830,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	Say(15452,2,
		OK_TRADE,
		NOT_TRADE)
end;

function giaodich()
	local nParam = GetNpcValue(GetTaskTemp(NPCINDEX))
	if(nParam ~= nil) then
	Sale(nParam)
	end
end;

function no()
end;
