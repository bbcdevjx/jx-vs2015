Include ("\\script\\lib\\worldlibrary.lua")

function GetApprenticeNum()
	local nCnt=0;
	for i=TASK_SHITU_NAME1,TASK_SHITU_NAME10 do
		if(GetTaskS(i) ~="") then
		nCnt=nCnt+1;
		end;
	end;
	return nCnt;
end;

function GetApplyApprentice(num)
	if(num < 0) then num = 0 end
	if(num < 5) then 
		return 3
	end
	if(num < 7) then
		return 4
	end
	if(num < 10) then
		return 5
	end
	if(num < 13) then
		return 6
	end
	if(num < 17) then
		return 7
	end
	if(num < 21) then
		return 8
	end
	if(num < 26) then
		return 9
	end
	return 10
end

function GetEnableChushiApps()
	local tab = {}
	for i=TASK_SHITU_NAME,TASK_SHITU_NAME10 do
		local szName=GetTaskS(i);
		local pid = SearchPlayer(szName)
		if(TRUE(pid)) then
			local lvl = CallPlayerFunction(pid,GetLevel)
			if(lvl>=80) then
				tinsert(tab,{szName,lvl})
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end

function GetHaveNewLilianApps()
	local tab = {}
	for i=TASK_SHITU_NAME,TASK_SHITU_NAME10 do
		local szName=GetTaskS(i);
		local pid = SearchPlayer(GetTaskS(i))
		if(TRUE(pid)) then
			local num = HaveNewLilian(pid)
			if(TRUE(num)) then
				tab[getn(tab) + 1] = {GetTaskS(i),num}
			end
		end
	end
	if(getn(tab)<1) then
		return nil
	end
	return tab
end