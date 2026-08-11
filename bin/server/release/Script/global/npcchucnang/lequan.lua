--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\lib\\worldlibrary.lua");
END_TALK = "KÕt thóc ®èi tho¹i/no";
RESET_TALK = "§¹i hiÖp sÏ ®­îc xãa cµi ®Æt mËt m· vµo ngµy <color=Yellow>%s<color> nÕu sau 24h ngµy <color=Yellow>%s<color> kh«ng x¸c nhËn th× ®¨ng ký xãa cµi ®Æt mËt m· sÏ bÞ hñy bá ";
function main(NpcIndex)
	if(SERVER_MODE == 1) then
	Talk(1,"",SERVER_NOTICE)
	return end
	local LEQUAN_ANSWER = {};
	tinsert(LEQUAN_ANSWER,"Xãa cµi ®Æt mËt m·/xoamakhoa");
	--if(GetLocalDate("%w")==1) then-- thu2 hang tuan
	tinsert(LEQUAN_ANSWER,"Hñy ®¹o cô khãa vÜnh viÔn/huyvp");
	--end;
	tinsert(LEQUAN_ANSWER,END_TALK);
	Say("LINK:<npc>",0, 11316,getn(LEQUAN_ANSWER),
		LEQUAN_ANSWER)	
end

function huyvp()
	if(GetLockState()==1) then
		Msg2Player("B¹n ph¶i më khãa b¶o vÖ tr­íc, míi cã thÓ hñy trang bÞ");
	end;
	GiveItemUI("Hñy vËt phÈm", "§¹i hiÖp h·y cÈn träng trong viÖc hñy vËt phÈm", "huyvp1", "onCancel" )
end

function huyvp1()
	local count,nFIndex,nFGenre = 0;
	for i = 0,5 do
		for j = 0, 9 do
		nFIndex,nFGenre = FindItemEx(14,i,j);
		if (nFIndex > 0 and nFGenre==0 and GetLockItem(nFIndex) == -2) then--trang bi, khoa vinh vien
			RemoveItem(nFIndex, 1)
			count=count+1;
		end
		end
	end
	if count>0 then
		Msg2Player(format("§¹i hiÖp võa hñy thµnh c«ng %d vËt phÈm",count));
	end
	return 1;
end

function xoamakhoa()
	local nTaskValue = GetTask(TASK_THOIGIAN7);
	if (GetNumber(4,nTaskValue, 2) > 0) then
	Say("§¹i hiÖp t×m ta cã viÖc g×?", 3,
	"Xem thêi gian hoµn thµnh xãa cµi ®Æt mËt m·/ktthoigian",
	"Hñy xãa cµi ®Æt mËt m·/huyxoa",
		END_TALK)	
	else
	Say("§¹i hiÖp t×m ta cã viÖc g×?", 2,
	"§¨ng ký xãa cµi ®Æt mËt m·/xnxoa",
		END_TALK)	
	end
end

function xnxoa()
	local nValue = GetCurServerSec()+7*24*60*60;
	SetTask(TASK_THOIGIAN7, nValue);
	local szMsg = GetTimeDate("%Y-%m-%d %H:%M:%S", nValue);
	Talk(1, "", format(RESET_TALK, szMsg, szMsg));
end

function ktthoigian()
	local nValue = GetTask(TASK_THOIGIAN7);
	local szMsg = GetTimeDate("%Y-%m-%d %H:%M:%S", nValue);
	Talk(1, "", format(RESET_TALK, szMsg, szMsg));
end

function huyxoa()
	SetTask(TASK_THOIGIAN7,0);
	Msg2Player("Hñy bá xãa cµi ®Æt mËt m·");
end

function no()
end;
