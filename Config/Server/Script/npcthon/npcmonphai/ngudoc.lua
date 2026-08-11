Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","Ngò §éc gi¸o hiÖn nay ®ang lóc h­ng thŞnh, l¹i liªn kÕt víi Thiªn NhÉn gi¸o hç trî §¹i Kim nam h¹! Ngµy sau vinh hoa phó quı sÏ cïng h­ëng!")
	elseif (player_Faction == "wudu") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: L©u l¾m kh«ng gÆp! Xem ra d¹o nµy ng­¬i ®· kh¸ h¬n tr­íc nhiÒu",4,"XuÊt s­ xuèng nói/xuatsu","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				else
				Say("<npc>: L©u l¾m kh«ng gÆp! Xem ra d¹o nµy ng­¬i ®· kh¸ h¬n tr­íc nhiÒu",3,"T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				end
			else
				Say("<npc>: L©u l¾m kh«ng gÆp! Xem ra d¹o nµy ng­¬i ®· kh¸ h¬n tr­íc nhiÒu",4,"Trïng ph¶n m«n ph¸i/trungphansumon","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","TiÓu mü n÷! §Õn th¨m ca ca nµy ­? Cho ta th¬m mét c¸i nµo! Hi hi!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Ni c« thói! ThËt lµ xui xÎo! Cø ®i ®i l¹i l¹i! Ph× ph× ph×!§¹i c¸t ®¹i lîi!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","§õng t­ëng Phi ®ao cña c¸c ng­¬i lµ ®Ö nhÊt thiªn h¹,®éc thuËt cña bæn bang v« h×nh v« ¶nh, giÕt ng­êi trong nh¸y m¾t")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","§èi ®Çu víi §¹i Kim sÏ ch¼ng İch lîi g× ®©u! Sím muén g× Kim quèc còng b×nh ®Şnh Trung Nguyªn, lóc ®ã c¸c ng­¬i hèi hËn còng muén råi!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Bän ®Çu träc c¸c ng­¬i th©n ë Kim Quèc nh­ng hån l¹i h­íng vÒ Nam triÒu! NÕu ®Ó lät vµo tay ta th× c¸c ng­¬i mét manh gi¸p còng kh«ng cßn! Ha! Ha! Ha!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Vâ §ang ®¹i hiÖp l¹i muèn chØ gi¸o cho t¹i h¹ ­? ThËt lµ nùc c­êi!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Bän c¸c ng­¬i qu¶ lµ kh«ng biÕt nh×n thêi thÕ! Dùa vµo søc c¸c ng­¬i mµ còng ®ßi chèng ®èi víi §¹i kim ­?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Chóng ta l­ìng ph¸i liªn minh, Nam c«ng B¾c kİch, sang s¬n hoa lÖ nµy sím muén g× còng thuéc vÒ chóng ta th«i! Ha! Ha! Ha!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","¡n mµy thói! §i ®i! §õng cã lµm bÈn ¸o cña ®¹i gia!")
	end
end


function enroll_select()
if (GetSeries() == 1) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("Sao h¶? Cã muèn gia nhËp bæn gi¸o kh«ng?", 2, "Gia nhËp Ngò §éc Gi¸o/go", "§Ó ta suy nghÜ kü l¹i xem/thing")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!")
		end
	end
end;

function go()
gianhapmonphai(3)
end;

function thing()
end;