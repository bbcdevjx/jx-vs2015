function main( nItemIndex )
    
    local nPLev = GetLevel()
    if nPLev > 90  or nPLev < 50 then
        Say("ChØ cã nh©n vËt cÊp ®é tõ 50 ®Õn 90 (bao gåm cÊp 50 vµ 90) míi cã thÓ sö dông.", 0)
        return 0
    end
	
	RemoveItem(nItemIndex,1);
    AddStackExp(1433042000)
	nPLev = GetLevel()
	Msg2Player(format("Chóc mõng b¹n, ®¼ng cÊp hiÖn t¹i cña b¹n lµ %d.",nPLev))
end
