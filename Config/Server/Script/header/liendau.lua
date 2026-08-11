MAP_LIENDAU= {
397,
399,
401,
403,
405,
407,
409,
411,
413,
415,
535,
536,
537,
538,
541,
543,
545,
547,
549,
551,
553,
555,
557,
559
};

LIENDAU_THANG = 10
LIENDAU_HOA = 4
LIENDAU_MAX = 48
LIENDAU_MSGBOCUOC = "Chóc mõng! §èi thñ bá cuéc, b¹n ®· giµnh th¾ng lîi!"
LIENDAU_MSGWIN = "Chóc mõng! B¹n ®· toµn th¾ng trËn nµy!"
LIENDAU_MSGWINTIME = "Thêi gian thi ®Êu ®· hÕt! PhÇn th¾ng nghiªng vÒ phÝa b¹n!"
LIENDAU_MSGSAME = "HÕt thêi gian! TrËn nµy hßa!"

function kiemtra()
	Say(10046,3,
	"KiÓm tra chiÕn ®éi cña m×nh/xemminh",
	"Xem 10 chiÕn ®éi dÉn ®Çu/top10",
	"Tho¸t/no")
end;

function xemminh()
	local nTaskValue = GetTask(TASK_LIENDAU)
	if(nTaskValue < 1) then
		Talk(1,"",10038)
	return end;
	showthanhtich(nTaskValue-1)
end;

function top10()
	local nGroup = GetDataInt(1);
	if(nGroup == 0) then
	Talk(1,"",10055)
	return end
	local strTab = {};
	local count = 1;
	local nameid,nValue1,nPoint,nTime,nRank,Name1,Name2;
	for i=1,10 do
	nGroup = GetDataInt(i)
	if(nGroup > 0) then
	nameid,nValue1,nPoint,nTime,nRank,Name1,Name2 = GetDataGr(nGroup-1);
	strTab[count] = format("H¹ng thø %d %s/seltop",i,Name1);
	count = count +1;
	end
	end
	if(count == 1) then
	return end
	strTab[count] = "§ãng/no"
	Say(10080, count,strTab)
	
end;

function seltop(sel)
	local nSel = sel + 1
	local nGroup = GetDataInt(nSel)
	showthanhtich(nGroup-1)
end;

function showthanhtich(nGroup)
	local nameid,nValue1,nPoint,nTime,nRank,Name1,Name2 = GetDataGr(nGroup);
	if(nameid == 0) then
	return end;
	
	local nThang = GetNumber(3,nValue1,1);
	local nHoa = GetNumber(3,nValue1,2);
	local nThua = GetNumber(3,nValue1,3);
	local nTotal = nThang+nHoa+nThua
	local nRate;
	if(nTotal > 0) then
		nRate = floor(nThang*100/nTotal);
	else
		nRate = 0;
	end
	local szNo = format("%d",nRank);
	if(szNo == "0") then
	szNo = "?";
	end
	local str = format(
	"<color=Gold><npc><color>:\nVâ l©m liªn ®Êu chiÕn ®éi <color=Yellow>%s<color>\nThµnh viªn ®éi chiÕn ®Êu: <color=cyan>%s %s<color>\n§· tham gia %d trËn ®Êu: <color=Green>th¾ng %d trËn<color>, <color=Yellow>hßa %d trËn<color>, <color=Red>thÊt b¹i %d trËn<color>\nTØ lÖ th¾ng: <color=Yellow>%d%%<color>\n§iÓm th­ëng: <color=Yellow>%d<color>\nThêi gian tham gia chiÕn ®Êu: <color=Yellow>%d gi©y<color>\nXÕp h¹ng thø: <color=Green>%s<color>",
	Name1,Name1,Name2,nTotal,nThang,nHoa,nThua,nRate,nPoint,nTime,szNo);
	Say("LINK:<npc>",0,str,1,"KÕt thóc ®èi tho¹i/no");
end;

function nhom()
	Talk(1,"",10020)
end;

function hotro()
	Say("Lo¹i h×nh thi ®Êu lÇn nµy lµ <color=red>§¬n ®Êu tù do<color>.",2,
	"TiÕp tôc t×m hiÓu/tieptuchd",
	"Ta râ råi/no")
end;

function tieptuchd()
	Talk(4,"endhd",10015,10016,10017,10018)
end;

function endhd()
	Say(10019,1,
	"Ta ®· râ råi/no")
end;