--hoangnhk
FUNC_MAIN = "chaohang"
function main(NpcIndex)
	local w,x,y = GetWorldPos();
	if (w == 1) then--phuong tuong
	Talk(1,FUNC_MAIN,12235)
	return end
	if (w == 11) then--thanh do
	Talk(1,FUNC_MAIN,12235)
	return end
	if (w == 162) then--dai ly
	Talk(1,FUNC_MAIN,12235)
	return end
	if (w == 78) then--tuong duong
	Talk(1,FUNC_MAIN,RANDOM(15267,15268))
	return end
	if (w == 37) then--bien kinh
	Talk(1,FUNC_MAIN,14792)
	return end
	if (w == 80) then--duong chau
	Talk(1,FUNC_MAIN,15453)
	return end
	if (w == 176) then--lam an
	Talk(1,FUNC_MAIN,10831)
	return end
	Talk(1,FUNC_MAIN,12235)
end;

function chaohang()
	local MUA_BAOLIXI = "N¬i nµy cã bao l× x× kh«ng?/xemhang"
	local OK_TRADE = "§æi Kim Nguyªn B¶o sang tiÒn ®ång?/tiendong";
	local NOT_TRADE = "Nh©n tiÖn ghÐ qua th«i/no";
	if(GetSex() == 0) then
	Say(10085,3,
		MUA_BAOLIXI,
		OK_TRADE,
		NOT_TRADE)
	else
	Say(10086,3,
		MUA_BAOLIXI,
		OK_TRADE,
		NOT_TRADE)
	end;
end;

function xemhang()
	Say(GetSex() == 0 and 10085 or 10086,3,
		"Ta muèn ®æi TiÓu Hång Bao L× X×/doibaotieu",
		"Ta muèn ®æi §¹i Hång Bao L× X×/doibaodai",
		"Ta kh«ng cÇn/no")
end;

function doibaotieu()
	if(GetCash() < 10000) then
	Talk(1,"","Ta cÇn 10000 l­îng ®Ó gãi bao l× x× ");
	return end;
	Pay(10000);
	local nNewItem=AddItemID(AddItem(0,6,14,0,0,5,0,0));
	Talk(1,"",format("%s nhËn ®­îc mét %s ",GetSex() == 0 and "§¹i HiÖp" or "N÷ HiÖp", GetNameItem(nNewItem)));
end;

function doibaodai()
	if(GetCash() < 100000) then
	Talk(1,"","Ta cÇn 100000 l­îng ®Ó gãi bao l× x× ");
	return end;
	Pay(100000);
	local nNewItem=AddItemID(AddItem(0,6,13,0,0,5,0,0));
	Talk(1,"",format("%s nhËn ®­îc mét %s ",GetSex() == 0 and "§¹i HiÖp" or "N÷ HiÖp", GetNameItem(nNewItem)));
end;

function tiendong()
	local nKNB = GetItemCount(0,4,343);
	if(nKNB < 1) then
		Talk(1,"",15290)
	return end
	local nNewItem = AddItemID(AddItem(0,4,417,0,0,5,0,0)) --tien dong 10 cai
	SetStackItem(nNewItem,10);
	DelItem(1,0,4,343)
	Msg2Player("B¹n ®· ®æi ®­îc 10 tiÒn ®ång.")
end;

function knb2van()
	local nKNB = GetItemCount(0,4,343);
	if(nKNB < 1) then
		Talk(1,"",15290)
	return end
	DelItem(1,0,4,343)
	Earn(2000000)
	Msg2Player("B¹n ®· ®æi ®­îc 200 v¹n ng©n l­îng.")
end;

function no()
end;
