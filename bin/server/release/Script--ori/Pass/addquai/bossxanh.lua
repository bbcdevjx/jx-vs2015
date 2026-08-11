function OnDeath()
end

function OnDrop()
end
function OnDeath_()
w,x,y = GetWorldPos()
ngay = tonumber(date("%d"))

	if ngay ~= GetTask(355) then
		SetTask(355, ngay)
		for k=357,361 do SetTask(k, 0) end
	end
	nvbang =  4
	if GetTaskTemp(36) == nvbang then
		SetTask(356+nvbang, GetTask(356+nvbang) + 1)
		Msg2Player("<color=yellow>NhiÖm vô bang héi tÝch lòy: "..GetTask(356+nvbang).." ®iÓm")
	end

sx = RandomNew(1,1500)
if sx == 50 then
	vt = random(1,6)	
	if GetTask(100) > 500 then
		sx2 = RandomNew(1,60)
		if sx2 == 20 then
			vt = random(7,getn(Mang_Item))
		end
	elseif GetTask(100) > 100 then
		sx2 = RandomNew(1,60)
		if sx2 == 20 then
			vt = random(7,11)	
		end
	end
	AddEventItem(Mang_Item[vt][3])
	Msg2SubWorld("§¹i hiÖp "..GetName().." trªn con ®­êng tu luyÖn t¹i <color=green>"..CheckDiaDiem(w).." <color=red>may m¾n t×m ®­îc <color=yellow>"..Mang_Item[vt][2].." ")		
end
end

function CheckDiaDiem(w)
if w == 53 then
return "Ba L¨ng HuyÖn"
elseif w == 70 then
return "Vò L¨ng S¬n"
elseif w == 74 then
return "Miªu LÜnh"
elseif w == 54 then
return "Nam Nh¹c TrÊn"
elseif w == 15 then
return "T­¬ng D­¬ng"
elseif w == 9 then
return "BiÖn Kinh"
elseif w == 17 then
return "Ph­îng T­êng"
elseif w == 3 then
return "Chu Tiªn TrÊn"
elseif w == 8 then
return "Phôc Ng­u S¬n §«ng"
elseif w == 91 then
return "Kª Qu¸n §éng"
elseif w == 41 then
return " Phôc Ng­u S¬n T©y"
elseif w == 50 then
return "Thiªn T©m §éng"
elseif w == 78 then
return "T­¬ng D­¬ng MËt §¹o"
elseif w == 21 then
return "M¹n B¾c Th¶o Nguyªn"
elseif w == 102 then
return "L©m Du Quan"
elseif w == 104 then
return "Ch©n Nói Tr­êng B¹ch"
elseif w == 105 then
return "Tr­êng B¹ch S¬n"
elseif w == 38 then
return "ThiÕt Th¸p TÇng 1"
elseif w == 39 then
return "ThiÕt Th¸p TÇng 2"
elseif w == 92 then
return "Thôc C­¬ng S¬n"
elseif w == 56 then
return "Néi ThÊt §éng"
elseif w == 57 then
return "ThÊt S¸t §éng"
elseif w == 13 then
return "KiÕm C¸c T©y B¾c"
elseif w == 14 then
return "Kim Quang §éng"
elseif w == 62 then
return "Táa V©n §éng"
elseif w == 63 then
return "Kinh Hoµng §éng"
elseif w == 64 then
return "D­¬ng Trung §éng"
elseif w == 65 then
return "Cæ D­¬ng §éng"
elseif w == 79 then
return "M¹c Cao QuËt"
elseif w == 66 then
return "Giang T©n Th«n"
elseif w == 46 then
return "Phong L¨ng §é"
elseif w == 67 then
return "Thanh Thµnh S¬n"
elseif w == 68 then
return "B¹ch V©n §éng"
elseif w == 73 then
return "Phôc L­u §éng"
elseif w == 76 then
return "§µo Hoa Nguyªn"
elseif w == 2 then
return "Hoa S¬n"

elseif w == 93 then
return "TiÕn Cóc §éng [9x]"
elseif w == 94 then
return "C¸n Viªn §éng [9x]"
elseif w == 100 then
return "TuyÕt B¸o §éng [9x]"
elseif w == 99 then
return "D­îc V­¬ng §éng [9x]"
elseif w == 109 then
return "Sa M¹c S¬n §éng 1 [PK]"
elseif w == 110 then
return "Sa M¹c S¬n §éng 2 [PK]"
elseif w == 111 then
return "Sa M¹c S¬n §éng 3 [PK]"

else
return "Ch­a §Æt Tªn"
end
end

Mang_Item = {
{0,"Tiªn Th¶o Lé 30 phót", 113},
{0,"N÷ Nhi Hång 30 phót", 114},
{0,"N÷ Nhi Hång 30 phót", 114},
{0,"Tiªn Th¶o Lé 1 giê ", 117},
{0,"N÷ Nhi Hång 1 giê ", 118}, -- 20
{0,"N÷ Nhi Hång 1 giê ", 118}, -- 20
{0,"X¸ Lîi Kim §¬n", 59},
{0,"Phi Phong ", 251}, -- 30
{0,"Lam Thñy Tinh", 28},
{0,"Tö Thñy Tinh", 29},
{0,"Lôc Thñy Tinh", 30},
{0,"Vâ L©m MËt TÞch", 0},
{0,"TÈy Tñy Kinh", 1}, 
}