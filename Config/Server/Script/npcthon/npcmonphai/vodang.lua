Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(3, "enroll_select", "Thiªn h¹ vâ häc, B¾c t«n ThiÕu l©m, nam sïng Vâ §ang. Ch¾c ng­¬i ®· tõng nghe qua?", "Vâ c«ng bæn ph¸i lÊy tÜnh chÕ ®éng, lÊy nhu kh¾c c­¬ng, lÊy ng¾n th¾ng dµi, lÊy chËm ®¸nh nhanh, lÊy ı vËn khİ, lÊy khİ vËn th©n, ®¸nh sau tíi tr­íc. Khiªm tèn ®iÒm ®¹m, lÊy v« h×nh th¾ng h÷u h×nh, ®ã lµ c¶nh giíi vâ häc tèi cao!", "Vâ nghÖ bæn m«n cã 'ngò bÊt truyÒn': yÕu ®uèi, hiÓm ®éc, h¸o th¾ng, cuång töu, gian d©m sÏ kh«ng truyÒn vâ c«ng")
	elseif (player_Faction == "wudang") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: Tuy ng­¬i ®· xuÊt s­ nh­ng chóng ta vÉn th­êng nhí ®Õn! D¹o nµy cã kháe kh«ng?",4,"XuÊt s­ xuèng nói/xuatsu","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				else
				Say("<npc>: Tuy ng­¬i ®· xuÊt s­ nh­ng chóng ta vÉn th­êng nhí ®Õn! D¹o nµy cã kháe kh«ng?",3,"T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				end
			else
				Say("<npc>: Tuy ng­¬i ®· xuÊt s­ nh­ng chóng ta vÉn th­êng nhí ®Õn! D¹o nµy cã kháe kh«ng?",4,"Trïng ph¶n m«n ph¸i/trungphansumon","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
			end
	elseif (player_Faction == "emei") then
		Talk(1,"","Nga My n÷ hiÖp! TiÓu ®¹o xin kİnh lÔ! S­ phô Thanh HiÓu S­ Th¸i cã kháe kh«ng?")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","TiÓu ®¹o rÊt béi phôc c«ng phu Thóy Yªn m«n! Kh«ng biÕt c« n­¬ng cã g× chØ gi¸o!?")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Tuy ch­ëng m«n quı ph¸i tİnh t×nh nãng n¶y, hµnh sù kh«ng theo qui t¾c, nh­ng rÊt th¼ng th¾n! Kh«ng hæ danh ch©n qu©n tö!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","B¶n lÜnh dïng ®éc cao siªu th× cuèi cïng còng lµ h¹ ®¼ng ®ª hÌn! Kh«ng cã tinh thÇn vâ häc!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Sím nghe nãi huynh ®Ö Thiªn v­¬ng bang ai còng lµ anh hïng h¶o h¸n! H«m nay gÆp mÆt qu¶ nhiªn danh bÊt h­ truyÒn!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Th× ra lµ tiÓu s­ phô ThiÕu l©m! Kh«ng biÕt cã g× chØ gi¸o!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Th× ra lµ ®Ö tö C«n L«n ph¸i! Kh«ng biÕt cã g× chØ gi¸o!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","KÎ ¨n mµy nµy vèn tõ l©u ng­ìng mé Nga My kiÕm thuËt. H«m nay ®­îc gÆp n÷ hiÖp ®©y, thËt tháa lßng mong ­íc!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Bang chñ cña quı bang vµ ch­ëng m«n cña tÖ ph¸i vèn lµ b»ng h÷u tri giao! Quı bang cã viÖc g× tÖ ph¸i nhÊt ®Şnh lËp tøc gióp ®ì!")
	end
end


function enroll_select()
if (GetSeries() == 4) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then						--µÈ¼¶´ïµ½Ê®¼¶
			Say("NÕu muèn gia nhËp bæn ph¸i ph¶i thay ®æi t©m tİnh, chuyÓn t©m tu hµnh, t­¬ng lai cã rÊt nhiÒu c¬ héi chê ®ãn ng­¬i!", 2, "Gia nhËp Vâ §ang/go", "§Ó ta suy nghÜ kü l¹i xem/thing")
		else
			Say("C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn <color=Red>cÊp 10<color> l¹i ®Õn t×m ta", 0)
		end
	end
end;

function go()
gianhapmonphai(8)
end;

function thing()
	Talk(1,"",10394)
end;