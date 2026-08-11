--hoangnhk
Include("\\script\\header\\taskid.lua");
function main(NpcIndex)
	local w,x,y = GetWorldPos();
	if (w == 1) then--phuong tuong
	Talk(1,"",10936)
	return end
	if (w == 11) then--thanh do
	if(nvheorung()==1) then
	return end;
	Talk(1,"",12628)
	return end
	if (w == 162) then--dai ly
	Talk(1,"",13908)
	return end
	if (w == 78) then--tuong duong
	Talk(1,"",RANDOM(15281,15282))
	return end
	if (w == 37) then--bien kinh
	Talk(1,"",RANDOM(14810,14811))
	return end
	if (w == 80) then--duong chau
	Talk(1,"",RANDOM(15461,15462))
	return end
	if (w == 176) then--lam an
	Talk(1,"",10114)
	return end
	Talk(1,"",10936)
end;

function nvheorung()
	local nCurTime = GetCurServerSec();
	local nTaskTime = GetTask(TASK_THOIGIAN3);
	if(GetNumber(1,GetTask(TASK_DUNGCHUNG1),8) == 1) then
		if(GetNumber(2,GetTask(TASK_DUNGCHUNG2),2) >= 10) then
		SetTask(TASK_DUNGCHUNG1, SetNumber(1,GetTask(TASK_DUNGCHUNG1),8,0))
		SetTask(TASK_DUNGCHUNG2, SetNumber(2,GetTask(TASK_DUNGCHUNG2),2,0))
		SetTask(TASK_THOIGIAN3,nCurTime);
		AddRepute(5);
		Earn(500);
		Talk(1,"","§· giÕt chÕt 10 con heo rõng? Tèt qu¸! Ta thay mÆt tr¨m hä Thµnh §« ®a t¹ ng­¬i vµ c¸c dòng sÜ ®· ra tay. §©y lµ 500 l­îng th­ëng!");
		Msg2Player("NhiÖm vô hoµn thµnh, ®­îc th­ëng 500 l­îng, thanh thÕ giang hå t¨ng 5 ®iÓm");
		else
		Talk(1,"","Muèn l·nh th­ëng µ? GiÕt 10 con heo rõng råi quay l¹i ®©y");
		end;
		return 1;
	elseif (nCurTime >0 and nCurTime - nTaskTime < 3600) then
		Talk(1,"","GÇn Thµnh §« cã rÊt nhiÒu nói, th­êng cã heo rõng xuÊt hiÖn, lÇn nµy may nhê cã ng­¬i míi cã thÕ ®¶m b¶o thu ho¹ch n¨m nay.");
		return 1;
	end
	return 0;
end;