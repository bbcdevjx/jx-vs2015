mang = {}
ksk = {}
klt = {}
function CheckDiaDiem(map)
w = ToaDoSatThu[map][1]
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
elseif w == 63 then
return "Táa V©n §éng"
elseif w == 62 then
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
return "TiÕn Cóc §éng"
elseif w == 94 then
return "C¸n Viªn §éng"
elseif w == 99 then
return "D­îc V­¬ng §éng"
elseif w == 100 then
return "TuyÕt B¸o §éng"
elseif w == 160 then
return "Th¹ch Cæ TrÊn"
elseif w == 161 then
return "Long M«n TrÊn"
elseif w == 11 then
return "§¹i Lý"
elseif w == 166 then
return "KiÕm C¸c Trung Nguyªn"
elseif w == 158 then
return "TÇng L¨ng"
elseif w == 162 then
return "KiÕm C¸c T©y Nam"
elseif w == 167 then
return "Thôc C­¬ng S¬n"
elseif w == 164 then
return "D­îc V­¬ng §éng TÇng 1"
elseif w == 159 then
return "L¨ng TÇn Thñy Hoµng"
elseif w == 165 then
return "§iÓm Th­¬ng §éng"
elseif w == 91 then
return "Mª Cung Kª Qu¸n §éng"
elseif w == 169 then
return "MËt ThÊt ThiÕu L©m"
elseif w == 171 then
return "Hoµnh S¬n Ph¸i"
elseif w == 172 then
return "Linh Cèc §éng"
elseif w == 174 then
return "D­îc V­¬ng §éng TÇng 2"
elseif w == 173 then
return "§¹i Tï §éng"









else
return "Ch­a §Æt Tªn"
end
end

ToaDoSatThu = {
-- 2x
{166,1611,3043,24,"Tr¸c L·nh CÇm"}, -- 1 
{166,1722,2753,24,"Tiªu Thiªn Ng¹o"},
{158,2538,2642,24,"Môc Minh KiÖt"}, 
{158,2373,2531,24,"TÊt V­u Phãng"},
{162,3419,3610,24,"Lôc Cöu U"},
{162,3214,4012,24,"Bé Hiªu TrÇn"},
-- 3x
{167,1948,3291,34,"§µo §o¹t Thu"}, -- 7
{167,1710,2646,34,"Xµ B¸ §«ng"},
{164,1566,3230,34,"L­¬ng T­ Nam"},
{164,1551,3259,34,"Tr¸c ThÊt Lang"},
{159,1526,3279,34,"KiÒu §Ønh Thiªn"},
{159,1605,3361,34,"Träng V« CÊp "},
-- 4x
{41,2215,2878,44,"Du Th¸n Giang"},
{41,1908,3113,44,"H¹ Hïng Phi"},
{8,1920,3364,44,"Tèng Vò Phong"},
{41,2175,3030,44,"Lé Th­îng Nh©n"},
{8,1944,3410,44,"NhËm T«ng Hoµnh"},
{8,1985,3221,44,"Hµn Khanh Long"},
-- 5x
{165,1472,3015,54,"M¹nh §¹p Hång"}, -- 19
{165,1636,3021,54,"¢n  Tøc HËn"},
{91,1590,3136,54,"Ho¾c Thanh S­¬ng"},
{91,1719,2768,54,"Miªn T­ §¹o"},
{169,1873,3116,54,"TiÕu Väng Du"},
{169,1688,3234,54,"Cao N·i Kho¸t"},
-- 6x
{50,1506,3161,64,"U«ng  ThÖ Thñy"}, --25
{50,1718,3109,64,"YÕn L­u  Sanh"},
{50,1622,3002,64,"Tang Th­¬ng H¶i"},
{171,1630,3156,64,"Bå ThËp Tam"},
{171,1618,3307,64,"HËu  KhÊt KiÕm"},
{171,1501,3254,64,"HËu YÕn T©n"},
{172,1750,3113,64,"ThiÖu ThÊt S¸t"},
{172,1724,3134,64,"Du V¹n Lý "},
{172,1598,3152,64,"Cõu DuÉn Sam"},
-- 7x
{174,1575,3177,74,"H¹ng LÖnh Ti"}, -- 34
{174,1466,3286,74,"Tµo Nh©n  Phñ"},
{102,1700,3708,74,"Tr×nh Phóc Ba"},
{102,1833,3396,74,"§Æng An Khuª"},
{102,1693,3237,74,"¦ng  Tiªu Phong"},
{102,1975,3630,74,"Th­¬ng TriÒu S­¬ng"},
{173,1551,3001,74,"Phïng Song Dùc"},
{173,1632,3118,74,"Phã Kh©u Tu"},
{173,1592,3242,74,"L¹c Long HiÒn"},
-- 8x
{53,1493,3389,84,"DiÖp øc Anh"}, -- 43
{53,1783,3287,84,"L¹c NhÜ Kim"},
{53,1791,2957,84,"M¹c Nam Tróc"},
{160,1477,3487,84,"TÇn Tö Du"},
{160,1807,2934,84,"C« V« Th­êng"},
{160,1435,3082,84,"LiÔu Tø Gia"},
{161,2192,4184,84,"Thi §¹i ThiÕu"},
{161,1818,4228,84,"T«n V¨n B­u "},
{161,2157,4692,84,"§ång BÊt Phôc"},
-- 9x
{11,1796,3559,94,"T¶  DËt Minh"},
{15,1784,3495,94,"NhËm Th­¬ng Khung"},
{17,1750,3045,94,"Chiªm Phóc V©n"},
{17,1853,3115,94,"Nh¹c Th­îng C«n"},
{11,1319,3014,94,"Viªn Thiªn Thä"},
{17,1747,3327,94,"Vu Cöu  §å"},
{11,1842,3208,94,"D­¬ng Phong DËt"},
{17,1499,3378,94,"Hµ Sinh Vong"},
{15,1452,2972,94,"T¨ng ChØ ãan"},
{15,1832,3307,94,"VÖ Biªn Thµnh"},
{15,1392,3503,94,"Cè Thñ §»ng"},
{11,1791,2986,94,"Gia C¸t Kinh Hång"},
}




function addboss()
for i=1,getn(ToaDoSatThu) do
		quai = AddNpc(1203 + i,ToaDoSatThu[i][4],SubWorldID2Idx(ToaDoSatThu[i][1]),ToaDoSatThu[i][2] * 32,ToaDoSatThu[i][3] * 32)
		SetNpcScript(quai, "\\script\\nvsatthu\\bossstdie.lua")
		SetNpcName(quai, ToaDoSatThu[i][5])
end
end

