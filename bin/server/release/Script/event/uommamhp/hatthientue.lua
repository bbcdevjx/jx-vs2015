--hoangnhk
Include("\\script\\event\\uommamhp\\lib.lua")
Include("\\script\\header\\judgeoffline_limit.lua")
Include("\\script\\lib\\worldlibrary.lua");
function main(nItemIdx)
	if(SERVER_MODE == 1) then
	Talk(1,"",SERVER_NOTICE)
	return end
	--local now = tonumber(GetLocalDate("%Y%m%d"))
	--if (CheckTime(now) == 1) then
		if (CheckLimit() == 1) then
			local nW,nX,nY = GetWorldPos();
			local nRand = RANDOMC(THIENTUE_RATE[1],RANDOM(100)<10 and RANDOM(5,6) or RANDOM(1,4));
			local nNpcIdx = AddNpcNew(THIENTUE_TEMPLET[nRand][1],1,nW,nX*32,nY*32,SCRIPT_TREEDLG,6);
			if (nNpcIdx <= 0) then
				return 0;
			else
				if (nRand == 6) then
					Msg2SubWorld(format("Chóc mõng <color=yellow>%s<color> ®· trång ®­îc <color=yellow>%s<color>",GetName(),THIENTUE_TEMPLET[nRand][2]));
				end
				SetNpcTimeout(nNpcIdx,TREE_TIME_LIMIT);
				SetNpcName(nNpcIdx,THIENTUE_TEMPLET[nRand][2]);
				SetNpcOwner(nNpcIdx,GetName(),0,0);
				SetNpcParam(nNpcIdx,0,RANDOM(1,BASE_SCORE_RATE));
				SetNpcParam(nNpcIdx,1,RANDOMC(300,312,324,356,368,372,374,314,316,318,320,322,324,326,328,330));
				local nNum = GetNumber(1,GetTask(TASK_RESET2),9);
				SetTask(TASK_RESET2,SetNumber(1,GetTask(TASK_RESET2),9,nNum+1));
				RemoveItem(nItemIdx,1)
			end
		end
	--end
end

function CheckTime(now)
	if (now >= EVENT_END_DATE or now < EVENT_START_DATE) then
		return 0;
	end
	return 1;
end

function CheckMap(dwMapID)
	if (dwMapID == 11 or 
		dwMapID == 1 or 
		dwMapID == 37 or 
		dwMapID == 176 or 
		dwMapID == 78 or 
		dwMapID == 80 or 
		dwMapID == 162 or 
		dwMapID == 174 or 
		dwMapID == 121 or 
		dwMapID == 153 or 
		dwMapID == 101 or 
		dwMapID == 99 or 
		dwMapID == 100 or 
		dwMapID == 20 or 
		dwMapID == 53 or 
		dwMapID == 54 or 
		dwMapID == 175 or 
		dwMapID == 55) then
		return 1
	end
	return 0;
end

function CheckLimit()
	local now = tonumber(GetLocalDate("%H%M"));
	local bInTime = 0;
	for i=1,getn(DAILY_TIME_LIMIT) do
		if (DAILY_TIME_LIMIT[i][1] <= now and now <= DAILY_TIME_LIMIT[i][2]) then
			bInTime = 1;
			break;
		end
	end
	
	if (bInTime ~= 1) then
		Talk(1, "","Ho¹t ®éng b¾t ®Çu vµo mçi ngµy tõ 13:00 ®Õn 16:00, 18:30 ®Õn 21:30.");
		return 0;
	end
	
	if (OfflinePermitRegion() ~= 1 or CheckMap(SubWorldIdx2ID(SubWorld)) ~= 1 or GetFightState() ~= 0) then
		Say("Kh«ng ®­îc trång c©y thiªn tuÕ t¹i nh÷ng n¬i gÇn xa phu hoÆc xung quanh nh÷ng n¬i ®«ng ng­êi")
		return 0;
	end
	
	local nTaskValue = GetTask(TASK_RESET2);
	local nDailyUse = GetNumber(1,nTaskValue,9);
	if(GetLevel()<USE_MINLEVEL) then
		Talk(1, "",format("§¼ng cÊp d­íi %d kh«ng thÓ sö dông",USE_MINLEVEL));
		return 0;
	end
	if (nDailyUse < USE_DAILY_LIMIT) then
		if (GetFightState() > 0) then
			Talk(1, "", "Khu vùc thµnh thÞ th«n trÊn phi chiÕn ®Êu míi cã thÓ sö dông");
		else
			return 1;
		end
	else
		Talk(1, "", format("Mçi ngµy mçi nh©n vËt chØ ®­îc sö dông %d lÇn", USE_DAILY_LIMIT));
	end
	
	return 0;
end