Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","Bæn bang ®· cã danh x­ng Thiªn h¹ ®Ö nhÊt bang, danh chÊn giang hå.Nh©n tµi ngäa Hæ tµng Long, thêi nµo còng cã ")
	elseif (player_Faction == "gaibang") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: §· l©u kh«ng gÆp! Mäi ng­êi ®Òu rÊt mong nhí! §¹i hiÖp d¹o nµy cã kháe kh«ng?",4,"XuÊt s­ xuèng nói/xuatsu","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				else
				Say("<npc>: §· l©u kh«ng gÆp! Mäi ng­êi ®Òu rÊt mong nhí! §¹i hiÖp d¹o nµy cã kháe kh«ng?",3,"T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				end
			else
				Say("<npc>: §· l©u kh«ng gÆp! Mäi ng­êi ®Òu rÊt mong nhí! §¹i hiÖp d¹o nµy cã kháe kh«ng?",4,"Trïng ph¶n m«n ph¸i/trungphansumon","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Tõ l©u nghe tiÕng c¸c c« n­¬ng Thóy Yªn ®Ñp nh­ tiªn n÷, vŞ c« n­¬ng nµy cho ¨n mµy ta İt tiÒn uèng r­îu ®­îc ch¨ng?")
	elseif (player_Faction == "emei") then				
		Talk(1,"","KÎ ¨n mµy nµy vèn tõ l©u ng­ìng mé Nga My kiÕm thuËt. H«m nay ®­îc gÆp n÷ hiÖp ®©y, thËt tháa lßng mong ­íc!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","¸m khİ §­êng m«n khiÕn nhiÒu kÎ võa nghe danh ®· biÕn s¾c. §ao ph¸p cña quı m«n còng lîi h¹i kh«ng kĞm!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","X­a nay Tµ chİnh ph©n minh, bän tiÓu nh©n dïng ®éc nh­ c¸c ng­¬i còng d¸m khoe danh ­?")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Bæn bang vµ quı bang hîp thµnh Thiªn h¹ l­ìng ®¹i ph¸i, chóng ta nªn gióp ®ì nhau nhiÒu h¬n ®Ó thèng lÜnh vâ l©m! Ha! Ha! Ha!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Quı ph¸i v× sù tån vong cña Vâ l©m Trung nguyªn, d¸m ®­¬ng ®Çu víi Kim quèc hïng m¹nh! KÎ ¨n mµy nµy mu«n phÇn béi phôc")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Vâ §ang hiÖp kh¸ch lõng danh thiªn h¹, xøng lµ Danh m«n chİnh ph¸i! Xin cho kÎ ¨n mµy nµy göi lêi hái th¨m ®Õn §¹o NhÊt Ch©n Nh©n vµ c¸c vŞ §¹o tr­ëng!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Th× ra lµ ®Ö tö cña C«n L«n ph¸i. Th¶o nµo cèt c¸ch bÊt phµm! Râ mÆt anh tµi!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","MÆc dï quı ph¸i lµ chñ, nh­ng C¸i bang vµ Thiªn NhÉn x­a nay vèn kh«ng ®éi trêi chung. Chóng ta kh«ng cÇn ph¶i nhiÒu lêi. HÑn gÆp nhau trªn sa tr­êng!")
	end
end


function enroll_select()
if (GetSeries() == 3) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("Cã høng thó gia nhËp C¸i bang kh«ng? Mäi ng­êi cã c¬m cïng ¨n, cã r­îu cïng uèng!", 2, "Gia NhËp C¸i bang/go", "§Ó ta suy nghÜ kü l¹i xem/thing")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!")
		end
	end
end;

function go()
gianhapmonphai(6)
end;

function thing()
	Talk(1,"",10452)
end;