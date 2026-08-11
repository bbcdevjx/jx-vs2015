--hoangnhk
Include("\\script\\header\\taskid.lua");
MAX_PER_DATE = 20
GETMAXEXP	= 150000000;
function main(sel)
	exps={
		{430,100},
		{2960,90},
		{9490,80},
		{22515,70},
		{48190,50},
		{104980,30},
		{246310,20},
		{609360,15},
		{1511850,10},
		{3611636,5}
	}
	msg={
		"B¹n ®Êu víi ThiÕt La H¸n h¬n nöa ngµy, kÕt qu¶ ®· thu ®­îc mét sè kinh nghiÖm thùc tiÔn chiÕn ®Êu ",
		"B¹n ®Êu víi ThiÕt La H¸n h¬n nöa ngµy, kÕt qu¶ ®· thu ®­îc mét sè kinh nghiÖm thùc tiÔn chiÕn ®Êu ",
		"B¹n cïng víi ThiÕt La H¸n ®èi luyÖn h¬n nöa ngµy, kÕt qu¶ kh«ng thu ®­îc hiÖu qu¶ g× ",
		"§¹i hiÖp ®· thu ®­îc kinh nghiÖm cao nhÊt tõ ho¹t ®éng nµy.",
	}
	local nTaskValue = GetTask(TASK_RESET3);
	local nDate = tonumber(GetLocalDate("%m%d"))
	if ( GetNumber(2,nTaskValue,2) ~= nDate ) then
		SetTask(TASK_RESET3, SetNumber(2,GetTask(TASK_RESET3),2,nDate))
		SetTask(TASK_THIETLAHAN, 0);
	end
	level = GetLevel()
	if(level <1) then 
		level =1
	end
	if(level > 130) then
		Msg2Player(msg[3])
		return 1
	end
	if(nNum >= MAX_PER_DATE) then
		Msg2Player(msg[4])
		return 1
	end
	if(level >100) then
		level = 100
	end	
	levelseg = floor((level-1)/10)+1
	rnd = random(100)
	if(rnd > exps[levelseg][2]) then
		nExp = floor(exps[levelseg][1]*rnd/200);
		if (nExp + GetTask(TASK_THIETLAHAN) > GETMAXEXP) then
			Msg2Player(msg[4]);
			return 1
		end
		AddOwnExp(nExp)
		Msg2Player(msg[1])
		SetTask(TASK_THIETLAHAN, GetTask(TASK_THIETLAHAN) + nExp);
		return 0
	end

	AddOwnExp(exps[levelseg][1])
	Msg2Player(msg[2])
	SetTask(TASK_THIETLAHAN, GetTask(TASK_THIETLAHAN) + exps[levelseg][1]);
	return 0
end