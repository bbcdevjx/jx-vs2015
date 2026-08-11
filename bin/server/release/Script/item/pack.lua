LETTER={455,456,506};

function main(nItemIdx)
	local nItemValue = GetParamItem(nItemIdx);
	if(nItemValue>=0 or nItemValue<=2) then
	local nNewItem=AddItemID(AddItem(0,6,131+nItemValue,0,0,5,0,0));
	nNewItem=AddItemID(AddItem(0,4,LETTER[nItemValue+1],0,0,5,0,0));
	end
	RemoveItem(nItemIdx,1);
end