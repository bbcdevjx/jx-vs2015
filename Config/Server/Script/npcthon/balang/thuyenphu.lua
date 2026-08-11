--hoangnhk
NOTWANT_GO = "Kh«ng ngåi/no"
BOAT_ARRAY = {
{8,400},{5,100},{6,400},{3,400},{7,400}
};

function main(nNpcIndex)
	local nParam = GetNpcValue(nNpcIndex)
	if(nParam == 1) then
	Say(11231,2,
	"Ngåi thuyÒn/ngoithuyen",
	NOTWANT_GO
							)
	return end
	Say(11234,2,
	"§i Thiªn V­¬ng ®¶o/gothienvuong",
	NOTWANT_GO
	)
	
end;

function ngoithuyen()
	Say(10072,6,
	"Giang T©n th«n [400 L­îng]/selplace",
    "T­¬ng D­¬ng phñ [400 L­îng]/selplace",
    "D­¬ng Ch©u phñ [800 L­îng]/selplace",
    "§¹i Lý [800 L­îng]/selplace",
    "L©m An phñ [800 L­îng]/selplace",
    NOTWANT_GO)
end

function selplace(sel)
	local nSel = sel + 1
	local nPrice = BOAT_ARRAY[nSel][2]
	local nMoney = GetCash();
	if(nMoney < nPrice) then
	Talk(1,"",10073);
	else
		local nW, nX, nY = GetStationPos(BOAT_ARRAY[nSel][1]);
		if(NewWorld(nW, nX , nY ) == 1) then
			Pay(nPrice);
			Msg2Player("Ngåi yªn! Chóng ta ®i "..GetStationName(BOAT_ARRAY[nSel][1]).."!");
		end
	end
end

function gothienvuong()
	
end

function no()
	
end