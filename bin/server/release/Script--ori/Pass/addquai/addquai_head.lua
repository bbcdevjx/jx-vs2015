Include("\\Script\\Pass\\addquai\\quaihead.lua")

function AddAllQuai()
for i=1,getn(mangquai) do
	vt = checkmang(mangquai[i][1])
	if (vt > 0 and vt <= getn(mangid)) then
		idnpc,level,series = checkidnpc(vt)
		quai = AddNpc(idnpc,level,SubWorldID2Idx(mangquai[i][1]),mangquai[i][2],mangquai[i][3])
		SetNpcScript(quai, "\\script\\pass\\addquai\\quaichet_head.lua")
	--	SetNpcName(quai, ""..mangquai[i][2].." "..mangquai[i][3].."")
	if vt < 29 then
		SetNpcSeries(quai, series)
	end	
		--SetNpcName(quai, ""..mangquai[i][2].." "..mangquai[i][3].."")
	end
end
Addsando()
end


function Addsando()
for i=1,getn(mangquai) do
	vt = checkmang1(mangquai[i][1])
	if (vt > 0 and vt <= getn(mangid1)) then
		idnpc,level,series = checkidnpc1(vt)
		quai = AddNpc(idnpc,level,SubWorldID2Idx(mangquai[i][1]),mangquai[i][2],mangquai[i][3])
		SetNpcScript(quai, "\\script\\pass\\addquai\\quaichet_head.lua")
	--	SetNpcName(quai, ""..mangquai[i][2].." "..mangquai[i][3].."")
	if vt < 29 then
		SetNpcSeries(quai, series)
	end	
		--SetNpcName(quai, ""..mangquai[i][2].." "..mangquai[i][3].."")
	end
end
end


mangid1 = {
-- ID Map 53, MinID 1291, MaxID 1292, Level 4

{159, 1673,1675, 34, 1}, -- langtangthuyhoang 3x



}


mangid = {
-- ID Map 53, MinID 1291, MaxID 1292, Level 4
{53, 1652,1653, 4, 1},  -- balanghuyen0x
{161, 1652,1653, 4, 1}, -- longmontran0x
{160, 1652,1653, 4, 1}, -- thachcotran 0x
{170, 1651,1651, 14, 1}, --lahanduong 1x
{157, 1654,1656, 14, 1}, -- duocvuongcoc 1x
{15, 1657,1660, 14, 1}, --tuongduong 1x
{17, 1657,1660, 14, 1}, --phuongtuong 1x
{11, 1657,1660, 14, 1}, --duongchau 1x
{163, 1661,1663, 14, 1}, --nhandangson 1x
{158, 1664,1666, 24, 1}, --tanglang 2x
{162, 1664,1665, 24, 1}, --kiemcactaynam 2x
{166, 1667,1669, 24, 1}, --kiemcactrungnguyen 2x
{167, 1670,1672, 34, 1}, --thuccuongson 3x
-- {159, 1673,1675, 34, 1}, -- langtangthuyhoang 3x
{164, 1676,1678, 34, 1}, -- duocvuongtang 3x
{8, 1679,1681, 44, 1}, -- phucnguusondong 4x
{41, 1679,1681, 44, 1}, -- phucnguusontay 4x
{168, 1682,1684, 44, 1}, -- diemthuongson 4x
{91, 1685,1687, 54, 1}, -- kequandong 5x
{169, 1688,1688, 54, 1}, --thieulammatthat 5x
{165, 1689,1691, 54, 1}, --thientamdongtang1 5x
{38, 1324,1326, 54, 2},
{14, 1324,1326, 54, 3},
{171, 1692,1694, 64, 1}, -- hoanh son phai 6x
{50, 1695,1697, 64, 1}, -- thien tam dong 6x
{172, 1698,1700, 64, 1}, -- linh coc dong 6x
{39, 1327,1329, 64, 1},  
{62, 1327,1329, 64, 3},
{173, 1727,1741, 74, 1}, -- dai tu dong 7x
{174, 1742,1756, 74, 1}, -- duoc vuong tang 2 7x
{102, 1757,1766, 74, 1}, -- lam du quan 7x
{63, 1330,1339, 74, 4},
{175, 1767,1781, 84, 1}, -- luong thuy dong 8x
{180, 1782,1796, 84, 1}, -- nhan thach dong 8x
{176, 1797,1811, 84, 1}, -- tang lang tang 3 8x
{107, 1340,1359, 84, 4}, -- Sa mac dia bieu 8x
{64, 1340,1359, 84, 4}, -- duong trung dong 6x
{104, 1340,1359, 84, 4}, -- truong bach son nam
{177, 1812,1831, 94, 1}, -- truong bach nam 9x
{178, 1832,1846, 94, 1}, -- duoc vuong dong tang 4 9x
{21, 1847,1856, 94, 1}, -- man bac thao nguyen 9x
{93, 1546,1560, 94, 4},  -- tien cuc dong
{94, 1506,1515, 94, 4}, -- can vien dong chuan
{110, 1400,1414, 94, 4}, -- Sa mac 2
{111, 1380,1399, 94, 4}, -- Sa mac 3


{75, 1380,1399, 94, 4}, -- Khoa Lang Dong

{55, 1857,1858, 94, 1}, -- Dao Hoa Nguyen


}


function checkmang1(map)
for i=1,getn(mangid1) do
	if map == mangid1[i][1] then
		return i
	end
end
return 0
end

function checkmang(map)
for i=1,getn(mangid) do
	if map == mangid[i][1] then
		return i
	end
end
return 0
end

function checkidnpc1(vt)
id = 0
level = 0
series = 0
if (vt > 0 and vt <=getn(mangid1)) then
	id = random(mangid1[vt][2],mangid1[vt][3])
	level = mangid1[vt][4]
	if (mangid1[vt][5] == 1) then
		series = random(0,2)
	elseif (mangid1[vt][5] == 2) then
		series = random(1,4)
	elseif (mangid1[vt][5] == 3) then
		sx2 = random(1,3)
		if sx2 == 1 then
			series = 0
		else
			series = random(3,4)
		end
	else
		series = random(0,4)
	end
	
	series = 1
end
return id,level,series
end

function checkidnpc(vt)
id = 0
level = 0
series = 0
if (vt > 0 and vt <=getn(mangid)) then
	id = random(mangid[vt][2],mangid[vt][3])
	level = mangid[vt][4]
	if (mangid[vt][5] == 1) then
		series = random(0,2)
	elseif (mangid[vt][5] == 2) then
		series = random(1,4)
	elseif (mangid[vt][5] == 3) then
		sx2 = random(1,3)
		if sx2 == 1 then
			series = 0
		else
			series = random(3,4)
		end
	else
		series = random(0,4)
	end
	
	series = RandomNew(0,4)
end
return id,level,series
end
