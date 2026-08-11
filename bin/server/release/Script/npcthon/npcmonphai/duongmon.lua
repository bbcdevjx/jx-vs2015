Include("\\script\\header\\factionhead.lua")

function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(2, "enroll_select", "§­êng m«n hïng cø Xuyªn Thôc, ¸m khİ vµ háa khİ ®· lõng danh thiªn h¹. Ng­êi trong giang hå nghe ®Õn §­êng m«n th¶y ®Òu biÕn s¾c, ®ñ thÊy sù lîi h¹i cña bæn m«n", "C¸i g× lµ Vâ l©m chİnh ®¹o, d©n téc ®¹i nghÜa? Toµn lµ bän l¸o toĞt. Bæn m«n kh«ng ­a bän chİnh ®¹o, còng ch¼ng kÕt giao víi tµ ®¹o. Muèn gia nhËp bæn m«n kh«ng ph¶i lµ chuyÖn ®¬n gi¶n!")
	elseif (player_Faction == "tangmen") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: L©u qu¸ kh«ng gÆp! Sau khi xuÊt s­ ®· lËp nªn kú tİch g× ch­a? KÓ nghe thö!",4,"XuÊt s­ xuèng nói/xuatsu","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				else
				Say("<npc>: L©u qu¸ kh«ng gÆp! Sau khi xuÊt s­ ®· lËp nªn kú tİch g× ch­a? KÓ nghe thö!",3,"T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				end
			else
				Say("<npc>: L©u qu¸ kh«ng gÆp! Sau khi xuÊt s­ ®· lËp nªn kú tİch g× ch­a? KÓ nghe thö!",4,"Trïng ph¶n m«n ph¸i/trungphansumon","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
			end
	elseif (player_Faction == "emei") then				
		Talk(1,"","Quı ph¸i ®èi vµ bæn m«n tr­íc tíi nay ch­a hÒ qua l¹i! Kh«ng biÕt cã g× chØ gi¸o!")
	elseif (player_Faction == "cuiyan") then
		Talk(1,"","Bæn m«n hµnh sù tuy kh«ng theo luËt lÖ, nh­ng còng kh«ng bao giê b¾t n¹t nh÷ng phô n÷ yÕu ®uèi!")
	elseif (player_Faction == "wudu") then
		Talk(1,"","§éc d­îc cña Ngò ®éc gi¸o tuy lîi h¹i nh­ng còng ch­a ch¾c ®· th¾ng ®­îc ¸m khİ cña §­êng m«n! Lóc nµo r¶nh rçi ta xin thØnh gi¸o vµi chiªu!")
	elseif (player_Faction == "tianwang") then
		Talk(1,"","Quı bang xa tËn §éng §×nh Hå, tr­íc giê h×nh nh­ ch­a qua l¹i víi bæn bang! Xin hái cã g× chØ gi¸o?!")
	elseif (player_Faction == "shaolin") then
		Talk(1,"","Bæn m«n x­a nay vèn ch¼ng ­a g× c¸i bän tù x­ng lµ danh m«n chİnh ph¸i c¸c ng­¬i")
	elseif (player_Faction == "wudang") then
		Talk(1,"","Bæn m«n x­a nay vèn ch¼ng ­a g× c¸i bän tù x­ng lµ danh m«n chİnh ph¸i c¸c ng­¬i")
	elseif (player_Faction == "kunlun") then
		Talk(1,"","Cã g× chØ gi¸o?")
	elseif (player_Faction == "tianren") then
		Talk(1,"","Ta ng­¬i vèn kh«ng ®Şch thï, còng ch­a kÕt qua b»ng h÷u! Kh«ng biÕt ph¶i ®èi ®·i thÕ nµo cho tiÖn ®©y!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Kh«ng ngê c¸i bän ¨n mµy ®ã mµ còng cã thÓ vang danh thiªn h¹! T¹i h¹ thËt mu«n phÇn b¸i phôc")
	end
end


function enroll_select()
if (GetSeries() == 1) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then
			Say("Bæn m«n tinh th«ng ®¹o chó kiÕm thuËt. Bän Vâ §ang  lµ c¸i thø g× chø!  Cã muèn gia nhËp bæn ph¸i kh«ng?", 2, "Gia nhËp §­êng M«n/go", "§Ó ta suy nghÜ kü l¹i xem/thing")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn cÊp 10 l¹i ®Õn t×m ta!")
		end
	end
end;

function go()
gianhapmonphai(2)
end;

function no()
	Talk(1,"",10310)
end;