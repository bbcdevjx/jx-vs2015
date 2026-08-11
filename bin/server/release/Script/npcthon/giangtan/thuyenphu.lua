--hoangnhk
NOTWANT_GO = "Kh«ng ngåi/no"
BOAT_ARRAY = {
{5,400},{10,400},{6,800},{3,100},{7,800}
};

function main(nNpcIndex)
	Say(12943,2,
	"Ngåi thuyÒn/ngoithuyen",
	NOTWANT_GO
							)
	
end;

function ngoithuyen()
	Say(10072,6,
	"T­¬ng D­¬ng phñ [400 L­îng]/selplace",
    "Ba L¨ng huyÖn [400 L­îng]/selplace",
    "D­¬ng Ch©u phñ [800 L­îng]/selplace",
    "§¹i Lý [100 L­îng]/selplace",
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

function no()
	
end