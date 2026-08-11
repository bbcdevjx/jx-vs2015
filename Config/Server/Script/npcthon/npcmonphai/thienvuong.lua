Include("\\script\\header\\factionhead.lua")
Include("\\script\\header\\taskid.lua")
Include("\\script\\npckhac\\hoanhson\\doccokiem.lua");
function main(nNpcIndex)
	if(nvthegioi(nNpcIndex) == 1) then
	return end;
	if (nvbalang() == 1) then
	return end;
local player_Faction = GetFaction();
	if (player_Faction == "") then
		Talk(3, "enroll_select", "Bang chñ D­¬ng Anh vâ nghÖ cao c­êng, gan d¹ h¬n ng­êi, kh«ng kĞm g× tu mi nam tö!", "Bæn m«n quy luËt uy nghiªm, ng­êi ®«ng thÕ m¹nh! Kh«ng ai trong thiªn h¹ d¸m coi khinh!", "Bæn bang võa chèng Kim võa kh¸ng Tèng! Huynh ®Ö ®Òu xuÊt th©n lµ d©n nghÌo, phiªu b¹t giang hå lµ v× kÕ sinh nhai! Ai lµm vua bän ta ch¶ cÇn quan t©m")
	elseif (player_Faction == "tianwang") then
			if (GetNumber(1,GetTask(TASK_DUNGCHUNG2),9) == 0) then
				if GetLevel() >= 60 then
				Say("<npc>: H¶o huynh ®Ö! Chóng ta l¹i gÆp nhau råi! Cã c¬ héi ta sÏ uèng r­îu cïng nhau!",4,"XuÊt s­ xuèng nói/xuatsu","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				else
				Say("<npc>: H¶o huynh ®Ö! Chóng ta l¹i gÆp nhau råi! Cã c¬ héi ta sÏ uèng r­îu cïng nhau!",3,"T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
				end
			else
				Say("<npc>: H¶o huynh ®Ö! Chóng ta l¹i gÆp nhau råi! Cã c¬ héi ta sÏ uèng r­îu cïng nhau!",4,"Trïng ph¶n m«n ph¸i/trungphansumon","T×m hiÓu khu vùc luyÖn c«ng/map_help","T×m hiÓu vâ nghÖ bæn m«n/skill_help","Xin chuyÓn dïm lêi hái th¨m s­ phô /no")
			end
	elseif (player_Faction == "emei") then				
		Talk(1,"","Thanh HiÓu S­ Th¸i cña quı ph¸i tinh th«ng phËt häc, vâ nghÖ cao c­êng, bæn m«n ng­ìng mé ®· l©u!")
	elseif (player_Faction == "cuiyan") then				
		Talk(1,"","N÷ nh©n vèn ®· phiÒn, n÷ nh©n biÕt vâ c«ng l¹i cµng phiÒn h¬n! Ng­êi cña quı ph¸i chóng ta kh«ng d¸m trªu vµo!")
	elseif (player_Faction == "tangmen") then
		Talk(1,"","Ng­êi häc vâ cÇn ph¶i quang minh lçi l¹c! Ta ghĞt nhÊt bän ng­êi dïng ¸m khİ h¹ ®éc thñ ng­êi kh¸c!")
	elseif (player_Faction == "wudu") then				
		Talk(1,"","Tuy bæn bang kh«ng mª muéi tİn nhiÖm bÊt cø danh m«n chİnh ph¸i nµo nh­ng còng coi khinh bän h¹ ®éc ®ª hÌn!")
	elseif (player_Faction == "shaolin") then				
		Talk(1,"","C«ng phu ThiÕu L©m th× cã g× hay ho? Hßa th­îng ®äc kinh giái míi lµ ®óng, häc ng­êi ta ®¸nh nhau ®Ó lµm gi?")
	elseif (player_Faction == "wudang") then				
		Talk(1,"","Xin chuyÓn lêi hái th¨m cña t¹i h¹ ®Õn §¹o NhÊt Ch©n Nh©n! Cã dŞp sÏ ®Õn ®Ó thØnh gi¸o ng­êi!")
	elseif (player_Faction == "kunlun") then				
		Talk(1,"","Quı ph¸i gÇn ®©y ph¸t triÓn thÇn tèc! Qu¶ kh«ng ph¶i h­ danh! Nh­ng còng ®õng qu¸ xem th­êng vâ l©m Trung nguyªn!")
	elseif (player_Faction == "tianren") then				
		Talk(1,"","Chóng ta quyÕt kh«ng giao h¶o víi bän ng­êi Kim!")
	elseif (player_Faction == "gaibang") then
		Talk(1,"","Quı bang vµ bæn bang hîp thµnh Thiªn h¹ l­ìng ®¹i bang, cã c¬ héi chóng ta nªn th©n thiÕt h¬n n÷a")
	end
end

function nvbalang()
	if (GetNumber(1,GetTask(TASK_DAOTAYTUY),9) == 2) then
		Talk(1, "", 11303)
		AddItemID(AddItem(0,4,180,0,0,5,0,0))
		SetTask(TASK_DAOTAYTUY, SetNumber(1,nTaskValue,9,3));
		return 1;
	end
	return 0;
end

function enroll_select()
if (GetSeries() == 0) and (GetCamp() == 0) then
		if (GetLevel() >= 10) then					--µÈ¼¶´ïµ½Ê®¼¶
			Say("Gia nhËp bæn bang, chóng ta sÏ lµ huynh ®Ö mét nhµ, häa phóc cïng h­ëng!", 2, "Gia nhËp Thiªn V­¬ng Bang/go", "§Ó ta suy nghÜ kü l¹i xem/thing")
		else
			Talk(1,"","C¨n b¶n cña ng­¬i cßn kĞm l¾m! H·y ®i luyÖn tËp thªm, bao giê ®Õn <color=Red>cÊp 10<color> l¹i ®Õn t×m ta!")
		end
	end
end;

function go()
gianhapmonphai(1)
end;

function thing()
	Talk(1,"",10366)
end;