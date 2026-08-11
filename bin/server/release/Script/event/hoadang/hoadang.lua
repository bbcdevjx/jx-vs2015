Include("\\script\\header\\taskid.lua")
Include("\\script\\event\\hoadang\\lib.lua")
Include("\\script\\lib\\worldlibrary.lua");

function main(nNpcIndex)
	if(SERVER_MODE == 1) then
	Talk(1,"",SERVER_NOTICE)
	return end
	local ntime = tonumber(GetLocalDate("%H%M"));
	if ((ntime < HOADANG_START1 or ntime >= HOADANG_END1) and 
		(ntime < HOADANG_START2 or ntime >= HOADANG_END2)) then
		Say("LINK:passerby203",0,"Ho¹t ®éng Hoa ®¨ng chØ b¾t ®Çu tõ 11h:00 ®Õn 12h:00 vµ 19h:00 ®Õn 21h:00! Xin quay l¹i sau nhÐ!", 0)
		return 0;
	end;
	local nTaskValue = GetTask(TASK_RESET2);
	local nTask = GetNumber(2,nTaskValue,3);
	if (GetLevel() < 50) then
		Say("LINK:passerby203",0,"§¼ng cÊp thÊp h¬n 50, kh«ng thÓ tham gia ho¹t ®éng nµy.", 0)
		return
	end
	if(nTask >= MAX_HOADANG_COUNT) then
		Say("LINK:passerby203",0,"H«m nay b¹n ®· ®o¸n nhiÒu c©u ®è råi! Nh­êng c¬ héi cho ng­êi kh¸c ®i!", 0)
		return
	end
	delnpcsafe(nNpcIndex)	--delete npc
	SetTask(TASK_RESET2,SetNumber(2,GetTask(TASK_RESET2),4,0));
	nhancauhoi();
end

function delnpcsafe(nNpcIndex)
	if (nNpcIndex <= 0 )  then
		return
	end
	PIdx = NpcIdx2PIdx(nNpcIndex);
	if (PIdx > 0) then 
		return
	end;
	DelNpc(nNpcIndex)
end;

function nhanthuong(nCount)
	AddOwnExp(100000);
end

function nhanthuong3()
	local nRand = RANDOM(getn(HOADANG_THUONG));
	AddOwnExp(500000);
	LockItem(AddItemID(AddItem(0,HOADANG_THUONG[nRand][2],HOADANG_THUONG[nRand][3],0,0,5,0,0)),1,0,0);
end

function nhancauhoi()
	local nRanQtn=random(1,getn(QUESTION_AND_ANSWER));
	local question = QUESTION_AND_ANSWER[nRanQtn][1];
	local options = {};
	for i = 1, 4 do
		options[i] = QUESTION_AND_ANSWER[nRanQtn][i+1];
		if (i==1) then
			options[i] = format("%s/traloidung", options[i])
		else
			options[i] = format("%s/traloisai", options[i])
		end
	end
	sapxepngaunhien(options);
	Say("LINK:passerby203",0,question,getn(options),options,180);
end

function sapxepngaunhien(options)
	local tbl_answer_order = {
		"A",
		"B",
		"C",
		"D",
	};
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s", tbl_answer_order[i], options[i])
	end
end

function no()
end

function traloidung()
	local nTaskValue = GetTask(TASK_RESET2);
	local nTask = GetNumber(2,nTaskValue,3);
	SetTask(TASK_RESET2,SetNumber(2,GetTask(TASK_RESET2),3,nTask+1));
	
	local nCount = GetNumber(2,nTaskValue,4)+1;
	if (nCount>2) then
		nhanthuong3();
		Talk(1, "", "Ng­¬i ®· ®¸p ®óng liªn tôc 3 c©u! Xin nhËn phÇn th­ëng!")
		SetTask(TASK_RESET2,SetNumber(2,GetTask(TASK_RESET2),4,0));
	return end
	nhanthuong();
	SetTask(TASK_RESET2,SetNumber(2,GetTask(TASK_RESET2),4,nCount));
	Talk(1,"nhancauhoi","ThËt xuÊt s¾c! Xin tiÕp tôc! <enter>");

end

function traloisai()
	Talk(1, "", "Sai råi! Xin tiÕp tôc!")
	SetTask(TASK_RESET2,SetNumber(2,GetTask(TASK_RESET2),4,0));
end

function Timeout(nNpcIndex)
	DelNpc(nNpcIndex);
end;