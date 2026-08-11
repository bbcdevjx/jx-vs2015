--hoangnhk
STATION_ARRAY = {
{1  		,300},
{11 		,200},
{162	,500},
{37 		,300},
{78 		,300},
{80 		,400},
{176	,500}
}

function main(NpcIndex)
	local bTong = GetNpcValue(NpcIndex)
	if(bTong == nil) then
	return end
	if(bTong > 0) then	--ben Tong
	Say(10577,3,
	"§iÓm b¸o danh phe Kim/baodanhphekim",
	"Nh÷ng thµnh thÞ ®· ®i qua/thanhthidiqua",
	"Kh«ng cÇn ®©u/out")
	else
	Say(10577,3,
	"§iÓm b¸o danh phe Tèng/baodanhphetong",
	"Nh÷ng thµnh thÞ ®· ®i qua/thanhthidiqua",
	"Kh«ng cÇn ®©u/out")
	end
end;

function thanhthidiqua()
	local count = 1;
	local StationTab = {};
	
	local price = -1;
	for i=1,getn(STATION_ARRAY) do
		price = STATION_ARRAY[ i][2];
		if(price > 0) then
		StationTab[count] = GetStationName(i) .. " [" .. price .. " l­îng]" .. "/SelStation";
		count = count + 1;
		end
	end
	
	if(count == 1) then
	return end
	
	StationTab[count] = "Kh«ng ®i ®©u c¶ /out";
	Say("§¹i hiÖp muèn ®i ®©u:",count,StationTab)
end;

function SelStation(nSel)
	local nPrice = STATION_ARRAY[nSel+1][2];
	local nMoney = GetCash();
	if(nMoney < nPrice) then
	Talk(1,"",10076);
	else
	local nW , nX, nY = GetStationPos(nSel+1);
	if(NewWorld(nW, nX , nY ) == 1) then
	Msg2Player("Ngåi yªn! Chóng ta ®i "..GetStationName(nSel+1).."!");
	Pay(nPrice);
	end
	end
end;

function baodanhphekim()
	SetPos(floor(50944/32), floor(98400/32));--bao danh tong kim cao cap--phe Kim
end;

function baodanhphetong()
	SetPos(floor(48928/32), floor(102272/32));--bao danh tong kim cao cap--phe Tong
end;

function out()
end;
