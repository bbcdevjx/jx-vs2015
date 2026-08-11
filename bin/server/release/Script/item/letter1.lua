Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(nItemIdx)
	Say("LINK:\\spr\\item\\questkey\\taskobj075_b.spr",0,10371,1,"NhËn hµm th­/nhanthu");
	RemoveItem(nItemIdx,1);
end;

function nhanthu()
	AddNote(2,0,"C©u chuyÖn L©m Uyªn Nhai\nLong Ngò giíi thiÖu b¹n ®Õn BiÖn Kinh gÆp Phã Nam B¨ng <color=Red>(212,197)<color>, lµ 1 ng­êi trong tæ chøc L©m Uyªn Nhai. Xem ra b¹n kh«ng thÓ an nhµn n÷a råi!");
	AddNote(2,1,"Long Ngò b¶o b¹n ®Õn BiÖn Kinh t×m gÆp Phã Nam Bang (212,197)");
end;