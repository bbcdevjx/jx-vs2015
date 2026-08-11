function main(nItemIdx)
	p = random(0,99)
	if (p < 50) then
		AddItemID(AddItem(0,0,2,28,2,0,0,0))
		Msg2Player("Gi¸ng Sinh vui vÎ! Chóc mõng b¹n nhËn ®­îc 'Giang hå t×nh l÷' Kinh Thiªn Gi¸p!")
		RemoveItem(nItemIdx,1);
	else
		AddItemID(AddItem(0,0,2,28,5,0,0,0))
		Msg2Player("Gi¸ng Sinh vui vÎ! Chóc mõng b¹n nhËn ®­îc 'Giang hå t×nh l÷' KhÊp §Þa QuÇn")
		RemoveItem(nItemIdx,1);
	end
	
end