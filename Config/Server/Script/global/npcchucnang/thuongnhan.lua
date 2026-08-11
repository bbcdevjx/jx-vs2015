--hoangnhk
Include("\\script\\feature\\thongthuong\\tnduongchau.lua");

NEED_ROOM_EMPTY = "Quý kh¸ch h·y s¾p xÕp l¹i hµnh trang."
ABOUT_FUYUAN = "Liªn quan phóc duyªn/timhieu";
NOT_TRADE = "Rêi khái/no";
function main(NpcIndex)
	local w,x,y = GetWorldPos();
	if (w == 78) then--tuong duong
	Say(12409,3,
		"Giao dÞch/tuongduongsale",
		"Mua mÆt n¹ gi¸ng sinh/chr_buy",
		NOT_TRADE)
	return end
	if (w == 80) then--duong chau
	tnduongchau();
	return end
	if (w == 176) then--lam an
	Say(10852,3,
		"Mua vËt quý T©y vùc/lamansale",
		--"Mua mÆt n¹ gi¸ng sinh/chr_buy",
		NOT_TRADE)
	return end
	Say(12409,2,
		--"Mua mÆt n¹ gi¸ng sinh/chr_buy",
		NOT_TRADE)
end;

function lamansale()
	Say(10095,3,
		"Mua B¨ng TÇm V« cùc t¬ [30 tiÒn ®ång]/bangtam",
		"Mua Nam Minh Chi Tinh [25 tiÒn ®ång]/namminh",
		NOT_TRADE)
end;

function bangtam()
	if(CheckRoom(1,1) == 0) then
		Msg2Player(NEED_ROOM_EMPTY)
	return end
	if(GetItemCount(0,4,417) < 30) then	--tien dong
		Talk(1,"",10248)
	return end;
	AddItemID(AddItem(0,4,415,0,0,5,0,0))
	DelItem(30,0,4,417);
end;

function namminh()
	if(CheckRoom(1,1) == 0) then
		Msg2Player(NEED_ROOM_EMPTY)
	return end
	if(GetItemCount(0,4,417) < 25) then	--tien dong
		Talk(1,"",10248)
	return end;
	AddItemID(AddItem(0,4,416,0,0,5,0,0))
	DelItem(25,0,4,417);
end;

function tuongduongsale()
	Sale(94,2)
end;

function chr_buy()
	local Yr,Mth,Dy,Hr,Mn,Se = GetTime();
	if(Mth == 12 and (Dy >= 23 and Dy<=26)) then
	Say("LÔ gi¸ng sinh, ta cã hai b¶o vËt cho ng­¬i, ®ã lµ <color=red>¤ng giµ N«en<color> vµ <color=red>Thiªn sø gi¸ng sinh<color>. NÕu nh­ muèn mua 1 trong sè ®ã th× <color=red>399 v¹n l­îng<color>, Mua cïng lóc c¶ hai th× chØ cÇn <color=red>688 v¹n l­îng<color>. Cßn do dù g× n÷a ",4,"Mua mÆt n¹ ¤ng giµ N« en (399 v¹n) /mask","Mua mÆt n¹ Thiªn sø gi¸ng sinh(399 v¹n) /mask","Mua c¶ hai(688 v¹n) /mask_all","§Ó ta suy nghÜ/no")
	else
		Talk(1,"","Mçi n¨m, tõ ngµy <color=Yellow>23 ®Õn ngµy 26 th¸ng 12<color> ta b¸n c¸c lo¹i mÆt n¹ gi¸ng sinh, ng­¬i cã thÓ tïy ý ®Õn mua");
	end;
end

function mask_all()
	if (GetCash() >= 6880000) then
		Pay(6880000)
		AddItemID(AddItem(0,0,11,70,0,0,0,0))
		AddItemID(AddItem(0,0,11,71,0,0,0,0))
		Msg2Player("Ng­¬i nhËn ®­îc 1 mÆt n¹ ")
	else
		Say("Quªn mang tiÒn µ? Kh«ng sao, ta ë ®©y ®îi ng­¬i. Nhí quay l¹i nhanh mét chót",1,"§­îc !/no")
	end
end


function mask(msel)
	on_Pay = 3990000
	if (GetCash() >= 3990000) then
		Pay(3990000)
		if (msel == 0) then
			AddItemID(AddItem(0,0,11,70,0,0,0,0))
			Msg2Player("Ng­¬i nhËn ®­îc 1 mÆt n¹ ¤ng giµ N¤ en")
		else
			AddItemID(AddItem(0,0,11,71,0,0,0,0))
			Msg2Player("Ng­¬i nhËn ®­îc 1 mÆt n¹ Thiªn sø gi¸ng sinh")
		end
	else
		Say("Quªn mang tiÒn µ? Kh«ng sao, ta ë ®©y ®îi ng­¬i. Nhí quay l¹i nhanh mét chót",1,"§­îc !/no")
	end
end

function timhieu()
end;

function no()
end;
