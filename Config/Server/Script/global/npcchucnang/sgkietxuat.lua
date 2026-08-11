Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\liendau.lua");
Include("\\script\\lib\\worldlibrary.lua");
--hoangnhk
LIENDAU_TOURNO = 1	--giai dau thu 1
function main(NpcIndex)
	if(SERVER_MODE == 1) then
	Talk(1,"",SERVER_NOTICE)
	return end
	if(GetTask(TASK_LIENDAU_TIME) ~= LIENDAU_TOURNO) then
		SetTask(TASK_LIENDAU_TIME,LIENDAU_TOURNO)
		SetTask(TASK_LIENDAU, 0);
	end
	Say("LINK:<npc>",0,14807,4,
		"Vµo vâ l©m liªn ®Êu héi tr­êng/htruong",
		--"Vâ l©m liªn ®Êu nhãm/nhom",
		--"KiÓm tra t×nh h×nh thi ®Êu/kiemtra",
		"Ta muèn l·nh phÇn th­ëng liªn ®Êu/doidiem",
		"Vâ l©m liªn ®Êu hç trî /hotro",
		"Ta chØ tiÖn ghĞ qua/no")
end;

function htruong()
	local nTaskValue = GetTask(TASK_LIENDAU)
	if(nTaskValue < 1) then
		Say(10045,2,
		"Tham gia liªn ®Êu/lapnhom",
		"Ta kh«ng muèn thi ®Êu/no")
	return end;
	gohoitruong()
end;

function lapnhom()
	if(GetLevel() < 80) then
		Talk(1,"",10047)
	return end
	if(GetFactionNo() < 0) then
		Talk(1,"",10039)
	return end
	local nAdd = AddDataGr(GetName());
	if(nAdd >= 0) then
		SetTask(TASK_LIENDAU, nAdd+1);
		gohoitruong()
	end
end;

function gohoitruong()
	local w,x,y = GetWorldPos();
	local nMapNo = 1;
	if(w == 11) then
	nMapNo = 2;
	elseif(w == 162) then
	nMapNo = 3;
	elseif(w == 37) then
	nMapNo = 4;
	elseif(w == 78) then
	nMapNo = 5;
	elseif(w == 80) then
	nMapNo = 6;
	elseif(w == 176) then
	nMapNo = 7;
	end
	SetTask(TASK_NVST, SetNumber(1,GetTask(TASK_NVST),9,nMapNo));
	NewWorld(396,1465,3009);
end;

function doidiem()
	Say("LINK:<npc>",0,"BÊt kÓ tham gia Vâ l©m liªn ®Êu hay vâ l©m kiÖt xuÊt ®Òu ®­îc nhËn phÇn th­ëng. PhÇn th­ëng bao gåm <color=red>PhÇn th­ëng xÕp h¹ng<color> vµ <color=red>®iÓm Vinh dù<color>. Sau mçi giai ®äan thi ®Êu kÕt thóc, sÏ c¨n cø vµo <color=red>®iÓm tich lòy, tû lÖ th¾ng, tæng thêi gian thi ®Êu<color> ®Ó xÕp h¹ng. <color=red>10 ®éi xÕp cao nhÊt<color> sÏ nhËn ®­îc <color=red>phÇn th­ëng ®Æc biÖt<color>. Ng­êi ch¬i trong qu¸ tr×nh thi ®Êu cß thÓ dïng ®iÓm vinh dù ®Ó ®æi phÇn th­ëng danh dù. Ng­¬i muèn nhËn phÇn th­ëng g×?",3,
	"Ta muèn ®æi phÇn th­ëng danh dù/giaodich",
	"Ta muèn mua phÇn th­ëng uy danh/giaodich",
	"Ta chØ tiÖn ghĞ qua/no");
end;

function giaodich(sel)
	if(sel == 0) then
		Talk(1,"",format("HiÖn t¹i %s cã ®iÓm vinh dù lµ <color=yellow>%d<color>",GetSex()==0 and "®¹i hiÖp" or "n÷ hiÖp",GetHonor()));
		Sale(92,5)
	else
		Talk(1,"",format("HiÖn t¹i %s cã ®iÓm uy danh lµ <color=yellow>%d<color>",GetSex()==0 and "®¹i hiÖp" or "n÷ hiÖp",GetRespect()));
		Sale(95,6)
	end;
end;

function no()
end;
