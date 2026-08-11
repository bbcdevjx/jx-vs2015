function main(nItemIndex)
	
	if (CalcFreeItemCellCount() < 12)  then
		Say("Xin h·y s¾p xÕp l¹i hµnh trang tr­íc ®·!");
		return 1;
	end;
	RemoveItem(nItemIndex,1);
	for i = 490, 501 do
		AddItemID(AddItem(0,4,i,0,0,5,0,0));
	end;
	
	Msg2Player("NhËn ®­îc 12 m¶nh tµng b¶o ®å.");
end;