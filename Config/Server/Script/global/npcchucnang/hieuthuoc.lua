Include("\\script\\header\\taskid.lua");
function main(NpcIndex)
	local OK_TRADE = format("Giao dÞch/giaodich(%d)",NpcIndex);
	local NOT_TRADE = "Kh«ng giao dÞch/no";
	local w,x,y = GetWorldPos();
	if (w == 53) then--ba lang
	if(nvbalang() == 1) then
	return end;
	Say(10003,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 20) then--giang tan
	if(nvgiangtan() == 1) then
	return end;
	Say(12952,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 99) then--vinh lac
	Say(12408,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 100) then--chu tien
	Say(10851,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 101) then--dao huong
	Say(12952,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 121) then--long mon
	Say(12102,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 153) then--thach co
	Say(13985,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 174) then--long tuyen thon
	Say(10948,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 1) then--phuong tuong
	Say(11432,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 11) then--thanh do
	Say(12630,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 162) then--dai ly
	Say(13911,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 78) then--tuong duong
	Say(15289,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 37) then--bien kinh
	Say(14815,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 80) then--duong chau
	Say(10948,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 176) then--lam an
	Say(10855,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 380) then--tong kim
	Say(10658,2,
		--"NhËn thuèc/nhanthuoctk",
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 242) then--tay tuy
	Say(10515,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	if (w == 396) then--lien dau
	Say(10021,2,
		OK_TRADE,
		NOT_TRADE)
	return end
	Say(10003,2,
		OK_TRADE,
		NOT_TRADE)
end;

function giaodich(NpcIndex)
	local nParam = GetNpcValue(NpcIndex)
	if(nParam ~= nil and nParam > 0) then
	Sale(nParam)
	end
end;

function nhanthuoctk()
	Input("commonnhanthuoc",CalcFreeItemCellCount());
end;

function commonnhanthuoc()
	local nNum = tonumber(GetInput());
	if(nNum>0) then
		for i=1,nNum do
		local nNewItem= AddItemID(AddItem(0,1,2,0,5,0,0));
		SetTempItem(nNewItem,1);
		LockItem(nNewItem);
		end
	end
end;

function nvbalang()
	local nTaskValue = GetTask(TASK_DAOTAYTUY);
	local nTask = GetNumber(1,nTaskValue,9);
	if(nTask == 1) then
	SetTask(TASK_DAOTAYTUY, SetNumber(1,nTaskValue,9,2));
	Talk(1,"",11310);
	Msg2Player("Chñ d­îc ®iÕm cho biÕt Tú Bµ hoµn ®· b¸n hÕt. B¹n h·y ®i hái thö ®Ö tö Thiªn V­¬ng Bang.");
	return 1 end
	return 0
end;

function nvgiangtan()
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nTask = GetNumber(1,nTaskValue,8);
	if(nTask == 1) then
	Say(12951,2,
		"Mua/muagiangtan",
		"§Ó ta chuÈn bÞ tiÒn/no")
	return 1 end
	return 0
end;

function muagiangtan()
	if(GetCash() < 200) then
		Talk(1,"",12953)
	else
		Pay(200)
		AddItemID(AddItem(0,4,179,0,0,5,0,0))
		Msg2Player("Mua ®­îc 10 viªn Xuyªn Bèi hoµn.")
	end
end;

function no()
end;
