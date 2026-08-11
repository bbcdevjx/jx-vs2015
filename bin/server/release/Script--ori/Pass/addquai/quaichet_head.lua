function OnDeath(idx)
w,x,y = GetWorldPos()
gio = tonumber(date("%H"))
ngay = tonumber(date("%d"))

nhiemvu = mod(GetTask(911),1000)
if nhiemvu ==1 then
	if w == 68 and GetNpcName(idx) == "Sãi §á" and GetTask(912) < 100 then
			SetTask(912, GetTask(912) + 1)
			Msg2Player("TiÕn ®é nhiÖm vô gióp ®ì MÑ Giµ: "..GetTask(912).." / 100")
			if GetTask(912) == 100 then
				Talk(1,"","NhiÖm vô gióp ®ì MÑ Giµ Hoµn thµnh, quay vÒ Giang T©n Th«n ®Ó phôc mÖnh !")
			end
	end
end

if GetTask(495) == 2 then
if GetNpcName(idx) == "KÒn KÒn" and GetTask(494) < 15 then
	SetTask(494, GetTask(494) + 1)
	Msg2Player("NhiÖm vô t©n thñ hoµn thµnh: "..GetTask(494).." / 15 con")	
end
end


if w == 9999 and ngay == 1 and GetCamp() ~= 0 and GetPKState() ~= 0 and GetGlbMissionV(12) < 20000 then
	if	GetNpcName(idx) == "Heo Tr¾ng" then
		SetGlbMissionV(12, GetGlbMissionV(12) + 1)
			Msg2Player("<color=yellow>Sè l­îng Heo Tr¾ng bÞ giÕt: <color=green>"..GetGlbMissionV(12).." con")
		if GetGlbMissionV(12) == 100 or GetGlbMissionV(12) == 5100  or GetGlbMissionV(12) == 10100    or GetGlbMissionV(12) == 15100 then
			AddEventItem(117)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": 1 Tiªn Th¶o Lé 1 Giê ")
		elseif GetGlbMissionV(12) == 500 or GetGlbMissionV(12) == 5500 or GetGlbMissionV(12) == 10500 or GetGlbMissionV(12) == 15500 then
			AddEventItem(117)
			AddEventItem(117)
			AddEventItem(117)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": 3 Tiªn Th¶o Lé 1 Giê ")
		elseif GetGlbMissionV(12) == 1000 or GetGlbMissionV(12) == 6000 or GetGlbMissionV(12) == 11000 or GetGlbMissionV(12) == 16000 then
			AddEventItem(120)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": 1 Tiªn Th¶o Lé 6 Giê ")
		elseif GetGlbMissionV(12) == 1500 or GetGlbMissionV(12) == 6500 or GetGlbMissionV(12) == 11500 or GetGlbMissionV(12) == 16500 then
			Earn(5000000)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": 500 v¹n l­îng")
		elseif GetGlbMissionV(12) == 2000 or GetGlbMissionV(12) == 7000 or GetGlbMissionV(12) == 12000 or GetGlbMissionV(12) == 17000 then
			AddEventItem(119)
			AddEventItem(119)
			AddEventItem(119)
			AddEventItem(119)
			AddEventItem(119)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": 5 Tiªn Th¶o Lé 3 Giê ")
		elseif GetGlbMissionV(12) == 5000 then
			idxitem = AddEventItem(38)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": "..GetNameItemBox(idxitem).."")
		elseif GetGlbMissionV(12) == 10000 then
			idxitem = AddEventItem(37)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": "..GetNameItemBox(idxitem).."")
		elseif GetGlbMissionV(12) == 15000 then
			idxitem = AddEventItem(36)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": "..GetNameItemBox(idxitem).."")
		elseif GetGlbMissionV(12) == 20000 then
			idxitem = AddEventItem(35)
			Msg2SubWorld("<color=yellow>"..GetName().." nhËn ®­îc phÇn th­ëng thø "..GetGlbMissionV(12)..": "..GetNameItemBox(idxitem).."")		
		end
	end
end


if w == 2 then -- Hoa S¬n
	if ngay ~= GetTask(355) then
		SetTask(355, ngay)
		for k=357,361 do SetTask(k, 0) end
	end
	nvbang = 1
	if GetTaskTemp(36) == nvbang then
		SetTask(356+nvbang, GetTask(356+nvbang) + 1)
		Msg2Player("<color=yellow>NhiÖm vô bang héi tÝch lòy: "..GetTask(356+nvbang).." ®iÓm")
	end

	if GetTask(103) == 1 and GetNpcName(idx) == "NhÝm" then
		SetTask(104,GetTask(104)+1)
		Msg2Player("NhiÖm vô m«n ph¸i: Sè l­îng nhÝm tiªu diÖt "..GetTask(104).." / 10 con")
		if GetTask(104) >= 10 then
		Msg2Player("Sè l­îng tiªu diÖt nhÝm ®· ®ñ, quay l¹i Tr­ëng M«n ®Ó phôc mÖnh !")
		end
	end
		
	if GetTask(157) == 7 and GetNpcName(idx) == "NhÝm" then
		if GetTask(156) < 100 then
		SetTask(156,GetTask(156)+1)
		Msg2Player("B¹n ®· tiªu diÖt "..GetTask(156).."/100 con")
		if GetTask(156) == 100 then
		Talk(1,"","§· ®¹t ®ñ sè l­îng NhÝm . H·y t×m NhÝm Chóa ®i !")
		end
		end
	elseif GetTask(157) == 41 and GetNpcName(idx) == "NhÝm" then
		if GetTask(156) < 5 then
			sx = random(1,20)
			if sx == 10 then
			SetTask(156,GetTask(156)+1)
			Msg2Player("B¹n nhËn ®­îc 1 Thñ CÊp NhÝm")
			end
		else
		Msg2Player("NhiÖm vô ®· hoµn thµnh, h·y trë vÒ gÆp Long Ngò ®Ó tr¶ nhiÖm vô !")	
		end
	end
		
end

if w == 53 then -- Ba Lang Huyen
		if GetTask(157) == 3 then
			if GetTask(156) < 200 then
			SetTask(156,GetTask(156)+1)
			Msg2Player("B¹n ®· tiªu diÖt "..GetTask(156).."/200 con")
			else
			Msg2Player("NhiÖm vô hoµn thµnh, h·y eventrë vÖ gÆp Long Ngò ®Ó tr¶ nhiÖm vô !")
			end
		elseif GetTask(157) == 40 then
			if GetTask(156) < 5 then
				sx = random(1,20)
				if sx == 10 then
				SetTask(156,GetTask(156)+1)
				Msg2Player("B¹n nhËn ®­îc 1 Thñ CÊp H­¬u")
				end
			else
			Msg2Player("NhiÖm vô ®· hoµn thµnh, h·y trë vÒ gÆp Long Ngò ®Ó tr¶ nhiÖm vô !")	
			end
		end
end

if w == 76 then
	if gio == 20 or gio == 21 then
		if ngay ~= GetTask(355) then
			SetTask(355, ngay)
			for k=357,361 do SetTask(k, 0) end
		end
		nvbang = 3
		if GetTaskTemp(36) == nvbang then
			SetTask(356+nvbang, GetTask(356+nvbang) + 1)
			Msg2Player("<color=yellow>NhiÖm vô bang héi tÝch lòy: "..GetTask(356+nvbang).." ®iÓm")
		end
	else
		Msg2Player("Sù KiÖn H¸i Thuèc b¾t ®Çu vµo lóc 20h00 - 22h00, c¸c b¹n quay l¹i sau nhÐ ")	
	end
	--	if GetGlbMissionV(43) > 0 then
	--		if GetPKState() == 1 then
	--			if GetLevel() >= 90 then
	--				sx = random(1,20)
	--				if sx == 10 then
	--						tien = random(10,100)
	--						Earn(tien*10000)
	--						SetGlbMissionV(43, GetGlbMissionV(43) - tien)
	--						if tien > 80 then
	--							Msg2SubWorld("Chóc mõng "..GetName().." thu thËp C©y D­îc PhÈm may m¾n nhËn ®­îc <color=pink>"..tien.." v¹n l­îng <color=red>Cßn l¹i: <color=blue>"..GetGlbMissionV(43).." v¹n")
	--						elseif tien > 50 then
	--							Msg2World("Chóc mõng "..GetName().." thu thËp C©y D­îc PhÈm may m¾n nhËn ®­îc <color=green>"..tien.." v¹n l­îng <color=red>Cßn l¹i: <color=blue>"..GetGlbMissionV(43).." v¹n")
	--						else
	--							Msg2World("Chóc mõng "..GetName().." thu thËp C©y D­îc PhÈm may m¾n nhËn ®­îc <color=yellow>"..tien.." v¹n l­îng <color=red>Cßn l¹i: <color=blue>"..GetGlbMissionV(43).." v¹n")
	--						end
	--				else
	--					Msg2Player("B¹n ®ñ ®iÒu kiÖn tham gia sù kiÖn nh­ng thiÕu may m¾n, h·y thö l¹i !")
	--				end
	--			else
	--				Msg2Player("CÊp ®é yªu cÇu tham gia sù kiÖn: 90")
	--			end
		--	else
		--		Msg2Player("Tr¹ng th¸i chiÕn ®Êu míi cã thÓ tham gia sù kiÖn !")
		--	end
		--else
			--Msg2Player("Giíi h¹n sù kiÖn 5000 v¹n l­îng ®· hÕt, kh«ng thÓ tham gia tiÕp. Vui lßng quay l¹i vµo ngµy mai.")
		--end
	--else
		soluong = random(5,10)
		for i=1,soluong do 
			idxitem = AddItem(1,2,0,3,0,0,0)
			SetItemLock(idxitem)
		end
		Msg2Player("B¹n nhËn ®­îc "..soluong.." b×nh <color=yellow>Thõa Tiªn MËt")
	--end
		
end




end

function OnDrop()
ngay = tonumber(date("%d"))
w,x,y = GetWorldPos()


	-- sx = RandomNew(1,50)
	-- if sx == 25 then
		-- if (checkmapevent(w) == 0) then
			-- return
		-- end
		
		-- xsitem = RandomNew(1,200)
		-- if (xsitem < 180) then
				-- xsitem2 = RandomNew(1,100)
				-- if xsitem2 < 20 then
				-- idxitem = AddEventItem(313)
				-- Msg2Player("B¹n nhËn ®­îc <color=blue>M·ng CÇu")
				-- elseif xsitem2 < 40 then
				-- idxitem = AddEventItem(314)
				-- Msg2Player("B¹n nhËn ®­îc <color=blue>Dõa")
				-- elseif xsitem2 < 60 then
				-- idxitem = AddEventItem(315)
				-- Msg2Player("B¹n nhËn ®­îc <color=blue>§u §ñ ")
				-- elseif xsitem2 < 80 then
				-- idxitem = AddEventItem(316)
				-- Msg2Player("B¹n nhËn ®­îc <color=blue>Xoµi")
				-- else
				-- idxitem = AddEventItem(317)
				-- Msg2Player("B¹n nhËn ®­îc <color=blue>Sung")
				-- end
		-- else
				-- idxitem = AddEventItem(321)
				-- Msg2Player("B¹n nhËn ®­îc <color=yellow>M©m B¹c")	
		-- end
	-- end
end

function checkmapevent(idmap)
check = 0
for i=1,getn(MangMap) do
	if idmap == MangMap[i] then
		check = 1
		break
	end
end
return check
end

MangMap = {111,110,94,93,177,21,178,64,107,104,180,175,176,63,102,173,174}