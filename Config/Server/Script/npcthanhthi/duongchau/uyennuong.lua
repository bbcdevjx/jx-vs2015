function main(sel)
	Say("B¸n lÔ vËt TÕt n¨m Th©n, thiÖp chóc TÕt ®©y!",2,"Ta muèn xem/yes","Kh«ng mua/no")
end;

function yes()
	Say("Trang phôc nam ®ãn xu©n, trang phôc n÷ mõng tuæi, ®ång gi¸ lµ 88888 l­îng!",3,"NhËn ¸o míi/male","¸o mõng tuæi/female","Kh«ng mua/no")
end;

function no()
	Say("Kh«ng mua còng kh«ng sao! N¨m míi gÆp nhiÒu may m¾n",0)
end;

function male()
	if(CheckRoom(2,3)==0) then
	Talk(1,"","Kh¸ch quan h·y xÕp l¹i hµnh trang tr­íc ®· ");
	return end;
	if(GetCash()>=88888)then
		AddItemID(AddItem(0,0,2,28,7,0,0,0))
		Pay(88888)
	else
		Say("TiÒn cña kh¸ch quan kh«ng ®ñ, lÊy ®ñ tiÒn råi h·y ®Õn mua!",0)
	end
end;

function female()
	if(CheckRoom(2,3)==0) then
	Talk(1,"","Kh¸ch quan h·y xÕp l¹i hµnh trang tr­íc ®· ");
	return end;
	if(GetCash()>=88888)then
		AddItemID(AddItem(0,0,2,28,8,0,0))
		Pay(88888)
	else
		Say("TiÒn cña kh¸ch quan kh«ng ®ñ, lÊy ®ñ tiÒn råi h·y ®Õn mua!",0)
	end
end;
