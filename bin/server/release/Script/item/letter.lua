Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(nItemIdx)
	Say("LINK:\\spr\\item\\questkey\\taskobj075_b.spr",0,10370,1,"NhËn hµm th­/nhanthu");
	RemoveItem(nItemIdx,1);
end;

function nhanthu()
	AddNote(1,0,"BÝ mËt TÇm Long héi\nHiÓm nguy ®ang b¾t ®Çu chê b¹n! Nh­ng tiÒn ®å còng cã thÓ tõ ®©y mµ ra!");
	AddNote(1,1,"Long Ngò b¶o b¹n ®i t×m M¹c SÇu <color=Red>(182,198)<color> ë <color=Red>§¹i Lý<color>. §»ng sau c« g¸i nµy h×nh nh­ cã 1 tæ chøc thÇn bÝ gäi lµ B¹ch §¹o");
end;