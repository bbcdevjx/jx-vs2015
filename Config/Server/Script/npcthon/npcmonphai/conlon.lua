Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","C«n L«n ph¸i ë T©y Vùc xa x«i, rÊt İt giao h¶o víi Trung Nguyªn. Tr¶i qua mÊy ®êi ch­ëng m«n ®· dÇn trë thµnh mét trong NhÊt ®¹i m«n ph¸i. ")
	elseif (player_Faction == "kunlun") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: Nghe nãi sau khi ng­¬i xuèng nói ®· lËp chót c«ng danh, cã nhí ®Õn s­ ®Ö s­ muéi chóng ta kh«ng?",4,"XuÊt s­ xuèng nói/xuatsu","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				else
				Say("<npc>: Nghe nãi sau khi ng­¬i xuèng nói ®· lËp chót c«ng danh, cã nhí ®Õn s­ ®Ö s­ muéi chóng ta kh«ng?",3,"T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				end
			else
				Say("<npc>: Nghe nãi sau khi ng­¬i xuèng nói ®· lËp chót c«ng danh, cã nhí ®Õn s­ ®Ö s­ muéi chóng ta kh«ng?",4,"Trïng ph¶n m«n ph¸i/trungphansumon","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Qu¶ ®óng lµ mü n÷! Ng­êi xø T©y B¾c khæ hµn khã mµ s¸nh ®­îc! ")
	elseif (player_Faction == "emei") then				
		Talk(1,"","N÷ l­u th× nªn häc c¸ch ch¨m sãc chång con! Vung g­¬m móa kiÕm ch¼ng ra thÓ thèng g×!  §óng lµ thêi thÕ ®¶o lo¹n! ")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","§­êng m«n ¸m khİ lµm sao cã thÓ so s¸nh víi chó thuËt ®¹o ph¸p thiªn t«n cña bän ta! ")
	elseif (player_Faction == "wudu") then
		Talk(1,"","A! Tµ ma ngo¹i ®¹o l¹i d¸m xuÊt hiÖn ë ®©y! H·y xem thanh kiÕm cña l·o gia ®©y! ")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Thiªn v­¬ng bang tuy hiÖn nay kh¸ m¹nh, nh­ng do mét n÷ l­u l·nh ®¹o!  Råi còng cã ngµy lµm tiªu tan c¬ nghiÖp")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Ai còng b¶o ThiÕu l©m lµ vâ häc chİnh t«ng nh­ng s¸nh sao ®­îc víi Thiªn s­ ®¹o thuËt cña C«n L«n ta?")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Hai ph¸i chóng ta cïng thuéc ®¹o gia!  ViÖc g× cø ph¶i ph©n tranh cao thÊp! ")
	elseif (player_Faction == "tianren") then
		Talk(1,"","DiÖt s¹ch cÈu Kim chİnh lµ bæn phËn c¶ ®êi ta!  L¹i ®©y nÕm thö mét kiÕm cña l·o gia nµo! ")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","C¸i bang anh hïng!  Hõ!  Thùc chÊt chØ lµ mét bän « hîp ch¶ ra g×! ")
	end
end


function enroll_select()
if (GetSeries() == 4) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("Bæn m«n tinh th«ng ®¹o chó kiÕm thuËt. Bän Vâ §ang  lµ c¸i thø g× chø!  Cã muèn gia nhËp bæn ph¸i kh«ng?", 2, "Gia nhËp C«n L«n/go", "§Ó ta suy nghÜ kü l¹i xem/thing")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!")
		end
	end
end;

function go()
gianhapmonphai(9)
end;

function thing()
	Talk(1,"",10239)
end;