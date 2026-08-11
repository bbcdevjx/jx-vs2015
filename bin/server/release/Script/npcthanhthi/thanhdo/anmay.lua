--hoangnhk
Include("\\script\\header\\taskid.lua");
MONEY = {100,200,400,800,1600,3200,6400,12800,25600,51200};
GIVE_MONEY = "Cho ng­¬i %d ng©n l­îng/chotien"
function main()
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(2,nTaskValue,1);
	if(nTask >= 10 or HaveMagic(400) ~= -1) then
	Talk(1,"", "Ng­êi tèt ë hiÒn gÆp lµnh");
	return end;
	Say("Chóc ngµi m¹nh kháe, xin th­¬ng xãt cho kÎ ¨n mµy ngheo hÌn nµy!", 2,
	format(GIVE_MONEY,MONEY[nTask+1]),
	"Nh÷ng kÎ ¨n no l­êi biÕng, nhÊt ®Þnh kh«ng ñng hé/no")
end;

function chotien()
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(2,nTaskValue,1);
	if(GetCash() >= MONEY[nTask+1]) then
		Pay(MONEY[nTask+1])
		if((RANDOM(1,10) <= 1) or (nTask == 10)) then
			Talk(3,"hockn","§a t¹ lßng tèt, cã muèn häc mét vµi trß ch¬i vui kh«ng?","Trß g× vui?","§óng lµ nh­ thÕ ");
			nTask = 10;
		else
			nTask = nTask+1;
		end;
		SetTask(TASK_DUNGCHUNG2,SetNumber(2,GetTask(TASK_DUNGCHUNG2),1,nTask));
	else
		Talk(1,"","B©y giê ta kh«ng mang theo tiÒn");
	end
end

function hockn()
	AddMagic(400,1);
	Msg2Player("Bè thÝ cho ng­êi ¨n mµy, häc ®­îc kü n¨ng 'KiÕp Phó TÕ BÇn'");
end;

function no()
	Talk(1,"","Ng­¬i kh«ng cã tÊm lßng! Bå T¸t sÏ kh«ng phï hé ");
end;