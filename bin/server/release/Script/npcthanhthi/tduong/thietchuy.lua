--hoangnhk
Include("\\script\\header\\repute_head.lua");

function main()
	Say(GetSex()==1 and 10101 or 10100, 2,
	"§­îc! §Ó ta xem thö/xem",
	"Kh«ng cÇn ®©u/no")
end;

function xem()
	if(GetCash() >= 5000) then
	Pay(5000)
	Talk(1,"calc",10103);
	else
		Talk(1,"",10102);
	end
end

function calc()
	local nRepute = GetRepute();
	local nReputeLv = GetReputeLevel(nRepute);
	Talk(1,"",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv)));
end

function no()
end;