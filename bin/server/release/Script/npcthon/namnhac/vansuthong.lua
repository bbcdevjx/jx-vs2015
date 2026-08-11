FIND_MONEY = {2500000,1000000,250000};
ENDTALK = "Kh«ng hái tr­íc/khonghoi"
function main(NpcIndex)
	Say(11439,4,
	format("Tèn %d v¹n l­îng b¹c ®Ó biÕt tin tøc vÒ mét ng­êi/timnguoi",FIND_MONEY[1]/10000),
	format("Tèn %d v¹n l­îng b¹c ®Ó biÕt tin tøc vÒ mét ng­êi/timnguoi",FIND_MONEY[2]/10000),
	format("Tèn %d v¹n l­îng b¹c ®Ó biÕt tin tøc vÒ mét ng­êi/timnguoi",FIND_MONEY[3]/10000),
	ENDTALK)
end;

function timnguoi(sel)
	local nSel = sel+1;
	Input("timten("..nSel..")")
end;

function timten(sel)
	if(sel< 1 or sel > 3) then
	Talk(1,"",11441);
	return end;
	local name = GetInput();
	if(name==GetName() or GetCash() < FIND_MONEY[sel]) then
	Talk(1,"",11441);
	return end;
	local nPlayer = FindPlayer(name);
	if(nPlayer <= 0) then
	Say("Xin lçi "..name.." hiÖn giêi kh«ng trªn m¹ng, kh«ng thÓ biÕt n¬i ë cña h¾n, phÝ ta chØ lÊy mét nöa th«i",0)
	Pay(FIND_MONEY[sel]/2);
	return end
	local tempid = PlayerIndex;
	PlayerIndex = nPlayer;
	local w,x,y = GetWorldPos();
	local pk = GetPK();
	PlayerIndex = tempid;
	Pay(FIND_MONEY[sel]);
	if(sel==1) then
	Say(name.." vÞ trÝ hiÖn t¹i lµ <color=red>"..GetWorldName(w).."("..floor(x/8).."/"..floor(y/16)..")<color> ®iÓm PK <color=red>"..pk.."<color>. NÕu ng­¬i muèn t×m h¾n th× ®i nhanh lªn",1,
	"§a t¹/no");
	elseif(sel==2) then
	Say(name.." vÞ trÝ hiÖn t¹i lµ <color=red>"..GetWorldName(w).."("..floor(x/8).."/"..floor(y/16)..")<color>. NÕu ng­¬i muèn t×m h¾n th× ®i nhanh lªn",1,
	"§a t¹/no");
	elseif(sel==3) then
	Say(name.." b©y giê ë t¹i <color=red>"..GetWorldName(w).."<color> ng­¬i ®i nhanh ®i, nÕu h¨n ®i n¬i kh¸c ta kh«ng qu¶n ®­îc ®©u",1,
	"§a t¹/no");
	end;
end;

function khonghoi()
Talk(1,"",11441);
end;

function no()
end;