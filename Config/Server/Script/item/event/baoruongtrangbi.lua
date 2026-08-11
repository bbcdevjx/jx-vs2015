TRANGBIID = {
[4] = {165,1,2},
[5] = {166,1,1},
[6] = {164,1,1},
[7] = {163,2,1},
[8] = {159,2,2},
[9] = {158,2,3},
[10] = {160,2,2},
[11] = {161,1,2},
[12] = {162,1,2},
};

function main(nItemIdx)
	local _,detail = FindItemEx(nItemIdx);
	if(TRANGBIID[detail]) then
	if (CheckRoom(TRANGBIID[detail][2],TRANGBIID[detail][3]) == 0) then
		PutMessage("Kho¶ng trèng trong tói kh«ng ®ñ",7,1)
		return end;
	local i = AddItemID(AddItem(2,0,TRANGBIID[detail][1],0,0,0,RANDOM(1,10)))
	Msg2Player("B¹n nhËn ®­îc "..GetNameItem(i).."")
	RemoveItem(nItemIdx,1)
	end;
end