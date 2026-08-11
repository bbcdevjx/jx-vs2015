Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")

function main()
	local tempid = PlayerIndex;
	local nTeamSize = GetTeamSize();
	local nSex = GetSex();
	if(nTeamSize < 2) then
		Msg2Player("Ng­êi c« ®¬n nhÆt hoa hång t×nh yªu kh«ng ®em l¹i hiÖu qu¶. ");
		return 0;
	elseif(nTeamSize > 2) then
		Msg2Player("ChØ cã mét nam mét n÷ lËp ®éi nhÆt hoa hång t×nh yªu míi nhËn ®­îc phÇn th­ëng.");
		return 0;
	else
		local nValid = 0;
		for i = 0,1 do
			PlayerIndex = GetTeamMem(i);
			if( nSex ~= GetSex() ) then
				nValid = 1;
			end
		end
		PlayerIndex = tempid;
		if(nValid==1) then
			CallTeamFunction(PlayerIndex,commom);
		else
			Msg2Player("ChØ cã mét nam mét n÷ lËp ®éi nhÆt hoa hång t×nh yªu míi nhËn ®­îc phÇn th­ëng.");
		end;
		return 0;
	end
end

function commom()
	local levelexp = {70,160,280,400,520,590,770,850,1000,1200,1500};
	local nTaskValue = GetTask(TASK_EVENT);
	local nTask = GetNumber(2,nTaskValue,1);
	nTask = nTask+1;
	if(nTask >= 99 ) then
		AddItemID(AddItem(0,6,832,0,0,5,0,0));
		SetTask(TASK_EVENT,SetNumber(2,GetTask(TASK_EVENT),1,0));
		Msg2Player("B¹n ®· nhÆt ®­îc 99 ®ãa hoa hång t×nh yªu, nhËn ®­îc mét S«c«la, sè l­îng nhÆt ®­îc trë vÒ 0.");
	else
		SetTask(TASK_EVENT,SetNumber(2,GetTask(TASK_EVENT),1,nTask));
		Msg2Player("B¹n ®· nhÆt ®­îc "..nTask.." ®ãa hoa hång t×nh yªu");
	end		
	local level = GetLevel();
	local exp_level = floor(level / 10) + 1;
	if(exp_level > 11) then
		exp_level = 11;
	end
	AddOwnExp(levelexp[exp_level]);
end