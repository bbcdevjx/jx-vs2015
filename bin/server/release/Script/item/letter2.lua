Include("\\script\\feature\\nvhoangkim\\hkhead.lua");
function main(nItemIdx)
	Say("LINK:\\spr\\item\\questkey\\taskobj075_b.spr",0,10372,1,"NhËn hµm th­/nhanthu");
	RemoveItem(nItemIdx,1);
end;

function nhanthu()
	AddNote(3,0,"Long KhÝ chi häa\nThiªn Hoµng Long KhÝ thùc sù ®· lµm cho giang hå dËy sãng! B¹n còng khã mµ tho¸t khái søc hót hÊp dÉn cña nã!")
	AddNote(3,1,"Trong th­ Long Ngò b¶o b¹n ®Õn Long M«n TrÊn t×m gÆp V©n Nhi");
end;