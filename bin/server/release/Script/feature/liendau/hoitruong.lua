--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\liendau.lua");
function main(NpcIndex)
	if(IsMission(1) == 0) then
	--Talk(1,"",10053)
	Say(10053,3,
	"KiÓm tra t×nh h×nh thi ®Êu/kiemtra",
	"Vâ l©m liªn ®Êu hç trî /hotro",
	"KÕt thóc ®èi tho¹i/no")
	return end
	Say(10048,2,
	"§¨ng ký tham gia liªn ®Êu/dangky",
	"Ta ch­a muèn/no")
end;

function dangky()
	if(GetTask(TASK_LIENDAU) == 0) then
	return end
	if(IsMission(1) ~= 1) then
	return end
	local nPlayerDataIdx = PIdx2MSDIdx(1,PlayerIndex);
	if(nPlayerDataIdx > 0) then	--da dang ky truoc do roi
		SetPMParam(1,nPlayerDataIdx,0,1)--online
		common()
	return end
	
	local n1,n2,n3,n4,n5,Name1,Name2 = GetDataGr(GetTask(TASK_LIENDAU) - 1);
	local nTotal = GetNumber(3,n2,1) + GetNumber(3,n2,2) + GetNumber(3,n2,3);
	if(nTotal >= LIENDAU_MAX) then
	Talk(1,"",10051)
	return end
	local nFighter = GetMissionV(0);
	if(nFighter >= getn(MAP_LIENDAU)*2) then
	Talk(1,"",10049)
	return end
	SetMission(0,nFighter+1)
	AddMSPlayer(1,0)
	common()
end;

RETURN_MSG = "Vâ l©m liªn ®Êu kh«ng ®­îc sö dông <color=Red>bÊt cø lo¹i d­îc phÈm PK nµo<color>, <color=Yellow>c¸c hiÖu qu¶ hç trî kü n¨ng còng bÞ v« hiÖu<color>. Sau khi vµo khu vùc thi ®Êu cã thÓ <color=Yellow>®iÒu phèi l¹i c¸c kü n¨ng<color>. Tr­íc khi vµo ®Êu tr­êng cÇn xem l¹i ®é hao mßn cña c¸c trang bÞ, ®Êu tr­êng kh«ng cho phÐp v­t trang bÞ ra ngoµi";
function common()
	local nIdx,nGr = FindItemEx(1,0,0);
	if(nIdx >0 and nGr ~= 1) then
		Say(RETURN_MSG,0);
	return end;
	for i=0,5 do
		for j=0,8 do
			nIdx,nGr = FindItemEx(3,i,j);
			if(nIdx >0 and nGr ~= 1) then
				Say(RETURN_MSG,0);
			return end;
			nIdx,nGr = FindItemEx(10,i,j);
			if(nIdx >0 and nGr ~= 1) then
				Say(RETURN_MSG,0);
			return end;
		end
	end;
	for i=0,2 do
		nIdx,nGr = FindItemEx(13,i);
		if(nIdx >0 and nGr ~= 1) then
			Say(RETURN_MSG,0);
		return end;
	end;
	SetPos(1590,2985)
	StopTimer()	--ngung hen gio dang chay bat ky
	SetRevPos(396,1)
	SetLogoutRV(1)--dung diem phuc sinh dang nhap
	Msg2Player(format("Cßn %d gi©y n÷a trËn ®Êu sÏ b¾t ®Çu!", floor(GetMSRestTime(1,1)/18)))
end;

function no()
end;
