Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(1,"enroll_select","ThiÕu l©m ph¸i lu«n ®­îc xem lµ Vâ l©m ®Ö nhÊt m«n ph¸i, mÖnh danh 'Th¸i s¬n b¾c ®Èu' cña Trung nguyªn vâ l©m")
	elseif (player_Faction == "shaolin") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: S­ ®Ö! S­ phô l¹i ph¸i ®Ö xuèng nói ­?",4,"XuÊt s­ xuèng nói/xuatsu","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin thay ta vÊn an s­ phô /no")
				else
				Say("<npc>: S­ ®Ö! S­ phô l¹i ph¸i ®Ö xuèng nói ­?",3,"T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin thay ta vÊn an s­ phô /no")
				end
			else
				Say("<npc>: S­ ®Ö! S­ phô l¹i ph¸i ®Ö xuèng nói ­?",4,"Trïng ph¶n m«n ph¸i/trungphansumon","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin thay ta vÊn an s­ phô /no")
			end
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Quı m«n lÊy vò luyÖn vâ! UyÓn chuyÓn mµ tinh diÖu! TiÓu t¨ng v« cïng béi phôc!")
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh HiÓu S­ Th¸i cña quı ph¸i tinh th«ng phËt häc, vâ nghÖ cao c­êng, tiÓu t¨ng ng­ìng mé ®· l©u!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Nghe nãi tõ §­êng m«n ®æi ¸m khİ thµnh minh khİ, h¹ thñ xuÊt thÇn! T¹i h¹ rÊt kh©m phôc!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","§éc M«n cña quı ph¸i thiªn h¹ ®Òu o¸n ghĞt! BÇn t¨ng m¹o muéi khuyªn c¸c ng­¬i nªn tu söa PhËt tËp! Quay ®Çu lµ bê!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Nghe nãi Kim quèc ®ang muèn tiªu diÖt quı bang tËn gèc! Xin c¸c vŞ v« cïng thËn träng!")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Xin chuyÓn lêi hái th¨m cu¶ bÇn t¨ng ®Õn §¹o NhÊt Ch©n Nh©n! Cã dŞp sÏ ®Õn ®Ó thØnh gi¸o ng­êi!")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Ng­êi luyÖn vâ kş nhÊt lµ h¸m danh vµ ®è kŞ! A Di ®µ PhËt!")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Quı gi¸o tuy ®­îc Kim quèc b¶o hé, nh­ng giang hå cã quy t¾c cña giang hå. Kh«ng ph¶i muèn lµm g× th× lµm.")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","D­íi sù l·nh ®¹o cña quı bang, d©n chóng ®· cã nh÷ng ngµy yªn b×nh h¹nh phóc! V¹n lÇn béi phôc! Béi phôc!")
	end
end


function enroll_select()
	if (GetSeries() == 0) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("ThiÕu L©m kh«ng hæ danh lµ danh m«n chİnh ph¸i! Huynh ®Ö cã muèn gia nhËp kh«ng?", 2, "Gia nhËp ThiÕu L©m ph¸i/go", "§Ó ta suy nghÜ kü l¹i xem/thing")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!")
		end
	end
end

function go()
gianhapmonphai(0)
end;

function thing()
	Talk(1,"",10283)
end;
