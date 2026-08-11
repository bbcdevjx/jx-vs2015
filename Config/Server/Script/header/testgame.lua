--hoangnhk
PLEASE = "H∑y l˘a ch‰n:";
function xanhtest()
	Say(PLEASE,10,
	"VÚ kh› /vukhit",
	"Y phÙc/aot",
	"Hµi/giayt",
	"Y™u Æ∏i/dait",
	"Kh´i m∑o/nont",
	"HÈ uy”n/baotayt",
	"Hπng li™n/hanglient",
	"Nh…n/gioichit",
	"Ng‰c bÈi/ngocboit",
	"Tho∏t/no")
end;

function vukhit()
	Say(PLEASE,6,
	"VÚ kh› h÷ Kim/selvk",
	"VÚ kh› h÷ MÈc/selvk",
	"VÚ kh› h÷ ThÒy/selvk",
	"VÚ kh› h÷ H·a/selvk",
	"VÚ kh› h÷ ThÊ /selvk",
	"Tho∏t/no")
end;

function aot()
	Say(PLEASE,6,
	"∏o h÷ Kim/selao",
	"∏o h÷ MÈc/selao",
	"∏o h÷ ThÒy/selao",
	"∏o h÷ H·a/selao",
	"∏o h÷ ThÊ /selao",
	"Tho∏t/no")
end;

function giayt()
	Say(PLEASE,6,
	"Gi«y h÷ Kim/selgiay",
	"Gi«y h÷ MÈc/selgiay",
	"Gi«y h÷ ThÒy/selgiay",
	"Gi«y h÷ H·a/selgiay",
	"Gi«y h÷ ThÊ /selgiay",
	"Tho∏t/no")
end;

function dait()
	Say(PLEASE,6,
	"ßai h÷ Kim/seldai",
	"ßai h÷ MÈc/seldai",
	"ßai h÷ ThÒy/seldai",
	"ßai h÷ H·a/seldai",
	"ßai h÷ ThÊ /seldai",
	"Tho∏t/no")
end;

function nont()
	Say(PLEASE,6,
	"MÚ h÷ Kim/selnon",
	"MÚ h÷ MÈc/selnon",
	"MÚ h÷ ThÒy/selnon",
	"MÚ h÷ H·a/selnon",
	"MÚ h÷ ThÊ /selnon",
	"Tho∏t/no")
end;

function baotayt()
	Say(PLEASE,6,
	"Bao tay h÷ Kim/seltay",
	"Bao tay h÷ MÈc/seltay",
	"Bao tay h÷ ThÒy/seltay",
	"Bao tay h÷ H·a/seltay",
	"Bao tay h÷ ThÊ /seltay",
	"Tho∏t/no")
end;

function hanglient()
	Say(PLEASE,6,
	"Hπng li™n h÷ Kim/seldc",
	"Hπng li™n h÷ MÈc/seldc",
	"Hπng li™n h÷ ThÒy/seldc",
	"Hπng li™n h÷ H·a/seldc",
	"Hπng li™n h÷ ThÊ /seldc",
	"Tho∏t/no")
end;

function gioichit()
	Say(PLEASE,6,
	"Nh…n h÷ Kim/selnhan",
	"Nh…n h÷ MÈc/selnhan",
	"Nh…n h÷ ThÒy/selnhan",
	"Nh…n h÷ H·a/selnhan",
	"Nh…n h÷ ThÊ /selnhan",
	"Tho∏t/no")
end;

function ngocboit()
	Say(PLEASE,6,
	"Ng‰c bÈi h÷ Kim/selnb",
	"Ng‰c bÈi h÷ MÈc/selnb",
	"Ng‰c bÈi h÷ ThÒy/selnb",
	"Ng‰c bÈi h÷ H·a/selnb",
	"Ng‰c bÈi h÷ ThÊ /selnb",
	"Tho∏t/no")
end;

function selvk(sel)
	for i=0,5 do
		AddItemID(AddItem(0,0,0,i,10,sel,10,10));
	end;
	for i=0,2 do
		AddItemID(AddItem(0,0,1,i,10,sel,10,10));
	end;
end;

function selao(sel)
	if(GetSex()==0) then
		for i=0,6 do
			AddItemID(AddItem(0,0,2,i,10,sel,10,10));
		end
	else
		for i=7,13 do
			AddItemID(AddItem(0,0,2,i,10,sel,10,10));
		end
	end;
end;

function selgiay(sel)
	for i=1,6 do
	if(CheckRoom(2,2) == 0) then
	return end;
	AddItemID(AddItem(0,0,5,GetSex()==0,10,sel,10,10));
	end;
end;

function seldai(sel)
	for i=1,6 do
	if(CheckRoom(2,1) == 0) then
	return end;
	AddItemID(AddItem(0,0,6,GetSex()==0,10,sel,10,10));
	end;
end;

function selnon(sel)
	if(GetSex()==0) then
		for i=0,6 do
			AddItemID(AddItem(0,0,7,i,10,sel,10,10));
		end
	else
		for i=7,13 do
			AddItemID(AddItem(0,0,7,i,10,sel,10,10));
		end
	end;
end;

function seltay(sel)
	for i=1,6 do
	if(CheckRoom(1,2) == 0) then
	return end;
	AddItemID(AddItem(0,0,8,GetSex()==0,10,sel,10,10));
	end;
end;

function seldc(sel)
	for i=1,6 do
	if(CheckRoom(2,1) == 0) then
	return end;
	AddItemID(AddItem(0,0,4,GetSex()==0,10,sel,10,10));
	end;
end;

function selnhan(sel)
	for i=1,6 do
	if(CheckRoom(1,1) == 0) then
	return end;
	AddItemID(AddItem(0,0,3,0,10,sel,10,10));
	end;
end;

function selnb(sel)
	for i=1,6 do
	if(CheckRoom(1,2) == 0) then
	return end;	
	AddItemID(AddItem(0,0,9,GetSex()==0,10,sel,10,10));
	end;
end;

-- function selvk(sel)
	-- local genre,detail,parti,level,series = 0,0,0,0,0;
	-- local nIndex;
	-- local	type1 , value1_1, value1_3,
				-- type2 , value2_1, value2_3,
				-- type3 , value3_1, value3_3,
				-- type4 , value4_1, value4_3,
				-- type5 , value5_1, value5_3,
				-- type6 , value6_1, value6_3,
				-- type7 , value7_1, value7_3,
				-- type8 , value8_1, value8_3;
-- for i=0,5 do
	-- genre,detail,parti,level,series = 0,0,i,10,sel;
	-- nIndex = AddItem(0,genre,detail,parti,level,series,0);
	-- if(sel == 0) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 115 , 30, 0,
		-- 121 , 30, 0,
		-- 126 , 80, 0,
		-- 140 , 150, 0,
		-- 136 , 3, 0,
		-- 101 , 20, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 1) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 115 , 30, 0,
		-- 125 , 30, 0,
		-- 137 , 3, 0,
		-- 144 , 30, 0,
		-- 126 , 80, 0,
		-- 103 , 25, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 2) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 115 , 30, 0,
		-- 123 , 50, 0,
		-- 126 , 80, 0,
		-- 141 , 150, 0,
		-- 166 , 200, 0,
		-- 102 , 20, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 3) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 137 , 3, 0,
		-- 142 , 150, 0,
		-- 115 , 30, 0,
		-- 106 , 30, 0,
		-- 85 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- else
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 166 , 200, 0,
		-- 143 , 150, 0,
		-- 136 , 3, 0,
		-- 108 , 30, 0,
		-- 58 , 1, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- end
	-- SetMagicAttrib(nIndex,
					-- type1 , value1_1, value1_3,
					-- type2 , value2_1, value2_3,
					-- type3 , value3_1, value3_3,
					-- type4 , value4_1, value4_3,
					-- type5 , value5_1, value5_3,
					-- type6 , value6_1, value6_3,
					-- type7 , value7_1, value7_3,
					-- type8 , value8_1, value8_3
					-- );
	-- AddItemID(nIndex);
-- end

-- for i=0,2 do
	-- genre,detail,parti,level,series = 0,1,i,10,sel;
	-- nIndex = AddItem(0,genre,detail,parti,level,series,0);
	-- if(sel == 0) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 115 , 30, 0,
		-- 121 , 30, 0,
		-- 126 , 80, 0,
		-- 140 , 150, 0,
		-- 136 , 3, 0,
		-- 101 , 20, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 1) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 115 , 30, 0,
		-- 125 , 30, 0,
		-- 137 , 3, 0,
		-- 144 , 30, 0,
		-- 126 , 80, 0,
		-- 103 , 25, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 2) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 115 , 30, 0,
		-- 123 , 50, 0,
		-- 126 , 80, 0,
		-- 141 , 150, 0,
		-- 166 , 200, 0,
		-- 102 , 20, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 3) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 137 , 3, 0,
		-- 142 , 150, 0,
		-- 115 , 30, 0,
		-- 106 , 30, 0,
		-- 85 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- else
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 166 , 200, 0,
		-- 143 , 150, 0,
		-- 136 , 3, 0,
		-- 108 , 30, 0,
		-- 58 , 1, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- end
	-- SetMagicAttrib(nIndex,
					-- type1 , value1_1, value1_3,
					-- type2 , value2_1, value2_3,
					-- type3 , value3_1, value3_3,
					-- type4 , value4_1, value4_3,
					-- type5 , value5_1, value5_3,
					-- type6 , value6_1, value6_3,
					-- type7 , value7_1, value7_3,
					-- type8 , value8_1, value8_3
					-- );
	-- AddItemID(nIndex);
-- end

-- end;

-- function selao(sel)
	-- local genre,detail,parti,level,series = 0,0,0,0,0;
	-- local nIndex;
	-- local	type1 , value1_1, value1_3,
				-- type2 , value2_1, value2_3,
				-- type3 , value3_1, value3_3,
				-- type4 , value4_1, value4_3,
				-- type5 , value5_1, value5_3,
				-- type6 , value6_1, value6_3,
				-- type7 , value7_1, value7_3,
				-- type8 , value8_1, value8_3;
-- for i=0,13 do
	-- genre,detail,parti,level,series = 0,2,i,10,sel;
	-- nIndex = AddItem(0,genre,detail,parti,level,series,0);
	-- if(sel == 0) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 113 , 30, 0,
		-- 101 , 20, 0,
		-- 85 , 120, 0,
		-- 134 , 10, 0,
		-- 88 , 3, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 1) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 85 , 120, 0,
		-- 103 , 25, 0,
		-- 113 , 30, 0,
		-- 134 , 10, 0,
		-- 117 , 10, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 2) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 102 , 20, 0,
		-- 88 , 3, 0,
		-- 99 , 15, 0,
		-- 113 , 30, 0,
		-- 110 , 30, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 3) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 113 , 30, 0,
		-- 106 , 30, 0,
		-- 117 , 10, 0,
		-- 104 , 20, 0,
		-- 85 , 120, 0,
		-- 98 , 15, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- else
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 105 , 20, 0,
		-- 85 , 120, 0,
		-- 108 , 30, 0,
		-- 113 , 30, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- end
	-- SetMagicAttrib(nIndex,
					-- type1 , value1_1, value1_3,
					-- type2 , value2_1, value2_3,
					-- type3 , value3_1, value3_3,
					-- type4 , value4_1, value4_3,
					-- type5 , value5_1, value5_3,
					-- type6 , value6_1, value6_3,
					-- type7 , value7_1, value7_3,
					-- type8 , value8_1, value8_3
					-- );
	-- AddItemID(nIndex);
-- end
-- end;

-- function selgiay(sel)
	-- local genre,detail,parti,level,series = 0,0,0,0,0;
	-- local nIndex;
	-- local	type1 , value1_1, value1_3,
				-- type2 , value2_1, value2_3,
				-- type3 , value3_1, value3_3,
				-- type4 , value4_1, value4_3,
				-- type5 , value5_1, value5_3,
				-- type6 , value6_1, value6_3,
				-- type7 , value7_1, value7_3,
				-- type8 , value8_1, value8_3;
-- for i=0,3 do
	-- genre,detail,parti,level,series = 0,5,i,10,sel;
	-- nIndex = AddItem(0,genre,detail,parti,level,series,0);
	-- if(sel == 0) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 111 , 30, 0,
		-- 101 , 20, 0,
		-- 85 , 120, 0,
		-- 134 , 10, 0,
		-- 88 , 3, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 1) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 85 , 120, 0,
		-- 103 , 25, 0,
		-- 111 , 30, 0,
		-- 134 , 10, 0,
		-- 89 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 2) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 102 , 20, 0,
		-- 88 , 3, 0,
		-- 99 , 15, 0,
		-- 111 , 30, 0,
		-- 110 , 30, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 3) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 111 , 30, 0,
		-- 106 , 30, 0,
		-- 89 , 120, 0,
		-- 104 , 20, 0,
		-- 85 , 120, 0,
		-- 98 , 15, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- else
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 105 , 20, 0,
		-- 85 , 120, 0,
		-- 108 , 30, 0,
		-- 111 , 30, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- end
	-- SetMagicAttrib(nIndex,
					-- type1 , value1_1, value1_3,
					-- type2 , value2_1, value2_3,
					-- type3 , value3_1, value3_3,
					-- type4 , value4_1, value4_3,
					-- type5 , value5_1, value5_3,
					-- type6 , value6_1, value6_3,
					-- type7 , value7_1, value7_3,
					-- type8 , value8_1, value8_3
					-- );
	-- AddItemID(nIndex);
-- end
-- end;

-- function seldai(sel)
	-- local genre,detail,parti,level,series = 0,0,0,0,0;
	-- local nIndex;
	-- local	type1 , value1_1, value1_3,
				-- type2 , value2_1, value2_3,
				-- type3 , value3_1, value3_3,
				-- type4 , value4_1, value4_3,
				-- type5 , value5_1, value5_3,
				-- type6 , value6_1, value6_3,
				-- type7 , value7_1, value7_3,
				-- type8 , value8_1, value8_3;
-- for i=0,1 do
	-- genre,detail,parti,level,series = 0,6,i,10,sel;
	-- nIndex = AddItem(0,genre,detail,parti,level,series,0);
	-- if(sel == 0) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 101 , 20, 0,
		-- 85 , 120, 0,
		-- 134 , 10, 0,
		-- 88 , 3, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 1) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 85 , 120, 0,
		-- 103 , 25, 0,
		-- 88 , 3, 0,
		-- 134 , 10, 0,
		-- 89 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 2) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 102 , 20, 0,
		-- 88 , 3, 0,
		-- 110 , 30, 0,
		-- 85 , 120, 0,
		-- 99 , 15, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 3) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 106 , 30, 0,
		-- 89 , 120, 0,
		-- 104 , 20, 0,
		-- 85 , 120, 0,
		-- 98 , 15, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- else
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 105 , 20, 0,
		-- 85 , 120, 0,
		-- 108 , 30, 0,
		-- 89 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- end
	-- SetMagicAttrib(nIndex,
					-- type1 , value1_1, value1_3,
					-- type2 , value2_1, value2_3,
					-- type3 , value3_1, value3_3,
					-- type4 , value4_1, value4_3,
					-- type5 , value5_1, value5_3,
					-- type6 , value6_1, value6_3,
					-- type7 , value7_1, value7_3,
					-- type8 , value8_1, value8_3
					-- );
	-- AddItemID(nIndex);
-- end
-- end;

-- function selnon(sel)
	-- local genre,detail,parti,level,series = 0,0,0,0,0;
	-- local nIndex;
	-- local	type1 , value1_1, value1_3,
				-- type2 , value2_1, value2_3,
				-- type3 , value3_1, value3_3,
				-- type4 , value4_1, value4_3,
				-- type5 , value5_1, value5_3,
				-- type6 , value6_1, value6_3,
				-- type7 , value7_1, value7_3,
				-- type8 , value8_1, value8_3;
-- for i=0,13 do
	-- genre,detail,parti,level,series = 0,7,i,10,sel;
	-- nIndex = AddItem(0,genre,detail,parti,level,series,0);
	-- if(sel == 0) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 101 , 20, 0,
		-- 85 , 120, 0,
		-- 134 , 10, 0,
		-- 88 , 3, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 1) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 85 , 120, 0,
		-- 103 , 25, 0,
		-- 88 , 3, 0,
		-- 134 , 10, 0,
		-- 89 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 2) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 102 , 20, 0,
		-- 88 , 3, 0,
		-- 99 , 15, 0,
		-- 85 , 120, 0,
		-- 110 , 30, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 3) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 106 , 30, 0,
		-- 89 , 120, 0,
		-- 104 , 20, 0,
		-- 85 , 120, 0,
		-- 98 , 15, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- else
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 105 , 20, 0,
		-- 85 , 120, 0,
		-- 108 , 30, 0,
		-- 89 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- end
	-- SetMagicAttrib(nIndex,
					-- type1 , value1_1, value1_3,
					-- type2 , value2_1, value2_3,
					-- type3 , value3_1, value3_3,
					-- type4 , value4_1, value4_3,
					-- type5 , value5_1, value5_3,
					-- type6 , value6_1, value6_3,
					-- type7 , value7_1, value7_3,
					-- type8 , value8_1, value8_3
					-- );
	-- AddItemID(nIndex);
-- end
-- end;

-- function seltay(sel)
	-- local genre,detail,parti,level,series = 0,0,0,0,0;
	-- local nIndex;
	-- local	type1 , value1_1, value1_3,
				-- type2 , value2_1, value2_3,
				-- type3 , value3_1, value3_3,
				-- type4 , value4_1, value4_3,
				-- type5 , value5_1, value5_3,
				-- type6 , value6_1, value6_3,
				-- type7 , value7_1, value7_3,
				-- type8 , value8_1, value8_3;
-- for i=0,1 do
	-- genre,detail,parti,level,series = 0,8,i,10,sel;
	-- nIndex = AddItem(0,genre,detail,parti,level,series,0);
	-- if(sel == 0) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 101 , 20, 0,
		-- 85 , 120, 0,
		-- 134 , 10, 0,
		-- 88 , 3, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 1) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 85 , 120, 0,
		-- 103 , 25, 0,
		-- 88 , 3, 0,
		-- 134 , 10, 0,
		-- 89 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 2) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 89 , 120, 0,
		-- 102 , 20, 0,
		-- 88 , 3, 0,
		-- 110 , 30, 0,
		-- 85 , 120, 0,
		-- 99 , 15, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- elseif(sel == 3) then
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 106 , 30, 0,
		-- 89 , 120, 0,
		-- 104 , 20, 0,
		-- 85 , 120, 0,
		-- 98 , 15, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- else
		-- type1 , value1_1, value1_3,
		-- type2 , value2_1, value2_3,
		-- type3 , value3_1, value3_3,
		-- type4 , value4_1, value4_3,
		-- type5 , value5_1, value5_3,
		-- type6 , value6_1, value6_3,
		-- type7 , value7_1, value7_3,
		-- type8 , value8_1, value8_3
	-- =
		-- 88 , 3, 0,
		-- 105 , 20, 0,
		-- 85 , 120, 0,
		-- 108 , 30, 0,
		-- 89 , 120, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0,
		-- 0 , 0, 0;
	-- end
	-- SetMagicAttrib(nIndex,
					-- type1 , value1_1, value1_3,
					-- type2 , value2_1, value2_3,
					-- type3 , value3_1, value3_3,
					-- type4 , value4_1, value4_3,
					-- type5 , value5_1, value5_3,
					-- type6 , value6_1, value6_3,
					-- type7 , value7_1, value7_3,
					-- type8 , value8_1, value8_3
					-- );
	-- AddItemID(nIndex);
-- end
-- end;