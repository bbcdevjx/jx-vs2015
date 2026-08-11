function main(sel)
	if (GetMateName() ~= "") then
		--if (GetBit(Uworld67,1) == 0) then
			if (GetSex() == 0) then
				Talk(1,"buy_sale","<player>: nghe nãi ng­¬i may ¸o hoa ®Ñp nhÊt thiªn h¹ ®óng kh«ng?")
			else
				Talk(1,"buy_sale","<player>: ng­êi cßn hµng kh«ng?")
			end
		--else
		--	Talk(1,"","Tr­íc bæn tiÖm lµm y phôc kh«ng tÖ, ®­îc b»ng h÷u gióp ®ì òng hé thËt thæ thÑn!")
		--end
	else
		Talk(1,"","<npc>: kh«ng ph¶i nãi kho¸c nhµ ta cã may c¸c lÖ phôc tèt nhÊt thiªn h¹, ng­¬i cÇn may g× cø nãi!")
	end
end

function buy_sale()
	Say("Chæ nµy ®Æc biÖt may lÔ phôc, dÜ nhiªn ph¶i tèn chi phÝ, vµ gi¸ cña nã lµ 88888 l­îng b¹c. ",2,"§­¬ng nhiªn ta muèn mua mét bé./buy_yes","Kh«ng cÇn,ta cßn ch­a muèn kÕt h«n/no")
end

function buy_yes()
	if (GetCash() >= 88888) then
		Pay(88888)
		if (GetSex() == 0) then
			AddItemID(AddItem(0,0,2,28,1,random(0,4),0,0))
		else
			AddItemID(AddItem(0,0,2,28,4,random(0,4),0,0))
		end
		Talk(1,"","Kh«ng thµnh vÊn ®Ò chóc kh¸ch quan tr¨m n¨m h¶o hîp!")
	else
		Talk(1,"","Kh«ng cã tiÒn th× ®õng lµm phiÒn ta lµm viÖc!")
	end
end

function no()
end
