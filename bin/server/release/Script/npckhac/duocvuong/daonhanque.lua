--hoangnhk
Include("\\script\\header\\factionhead.lua")
Include("\\script\\header\\taskid.lua")
MONEY_FIRST = 200000;
MAX_TIMES=5;
function main(NpcIndex)
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(1,nTaskValue,5);
	if(nTask >=MAX_TIMES) then
		Say(12140,2,
		"T×m hiÓu c¸ch luyÖn kü n¨ng 120/timhieu120",
		"KÕt thóc ®èi tho¹i/no")
	else
		Say(nTask >0 and 12138 or 12139,3,
		"C¶i t¹o kinh m¹ch/ctkinhmach",
		"T×m hiÓu c¸ch luyÖn kü n¨ng 120/timhieu120",
		"KÕt thóc ®èi tho¹i/no")
	end;
	--Say(12138,2,
	--"T×m hiÓu c¸ch luyÖn kü n¨ng 120/timhieu120",
	--"§ãng/no")
end;

function ctkinhmach()
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(1,nTaskValue,5);
	local nNMoney=MONEY_FIRST+(MONEY_FIRST*nTask);
	Say(format("Thµnh thËt, sè tiÒn Ýt ái nµy ®Ó kÝnh l·o §¹o tr­ëng míi ®­îc %d l­îng. §ã kh«ng ph¶i lµ con sè nhá, ta ph¶i ®i kiÕm míi ®­îc",nNMoney),2,
	"Coi nh­ ng­¬i còng cã tÊm lßng ®ã, th«i ®­îc, ng­¬i muèn trÞ khái phÇn nµo?/sel",
	"KÕt thóc ®èi tho¹i/no");
end;

function sel()
	Say(12145,5,
	"Søc m¹nh/bdcaitao",
	"Th©n ph¸p/bdcaitao",
	"Sinh khÝ/bdcaitao",
	"Néi c«ng/bdcaitao",
	"ViÖc nµy. Ta cßn ph¶i suy nghÜ l¹i/no");
end;

function bdcaitao(nSel)
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(1,nTaskValue,5);
	local nNMoney=MONEY_FIRST+(MONEY_FIRST*nTask);
	if(GetCash()<nNMoney) then
	Talk(1,"",12146);
	return end;
	local nTSer=GetSeries();
	if(nTSer < 0 or nTSer>4) then
	return end;
	if(nSel==0) then
		if(GetStrg()-FACTION_PROP[nTSer+1][1]<5) then
		Talk(1,"",12147);
		return end;
	AddStrg(-5);
	Talk(1,"",12148);
	elseif(nSel==1) then
		if(GetDex()-FACTION_PROP[nTSer+1][2]<5) then
		Talk(1,"",12149);
		return end;
	AddDex(-5);
	Talk(1,"",12150);
	elseif(nSel==2) then
		if(GetVit()-FACTION_PROP[nTSer+1][3]<5) then
		Talk(1,"",12151);
		return end;
	AddVit(-5);
	Talk(1,"",12152);
	elseif(nSel==3) then
		if(GetEng()-FACTION_PROP[nTSer+1][4]<5) then
		Talk(1,"",12153);
		return end;
	AddEng(-5);
	Talk(1,"",12154);
	else
		return end;
	Pay(nNMoney);
	SetTask(TASK_DUNGCHUNG2,SetNumber(1,nTaskValue,5,nTask+1));
end;

function timhieu120()
	Talk(1,"",10341)
end;

function no()
end;
