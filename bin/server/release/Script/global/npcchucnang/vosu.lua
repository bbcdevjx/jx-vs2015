--hoangnhk
Include("\\script\\header\\taskid.lua");
NOT_ENOUGH = "Ng­¬i luyÖn tËp vÉn ch­a ®ñ. TiÕp theo h·y ®i ®¸nh ";

function main(NpcIndex)
	local w,x,y = GetWorldPos();
	if(w == 20) then
		local nTaskValue = GetTask(TASK_NVDANHVONG);
		local nTask = GetNumber(1,nTaskValue,9);
		if(nTask == 1) then
		SetTask(TASK_NVDANHVONG, SetNumber(1,nTaskValue,9,2));
		Talk(1,"",12939)
		Msg2Player("Vâ s­ ®ång ı d¹y vâ miÔn phİ cho Hæ Tö. Mau quay vÒ b¸o cho cha Hæ Tö biÕt.")
		return end;
	end;
	Say("<npc>: D¹o nµy kh«ng hiÓu sao l¹i cã nhiÒu ng­êi ®Õn t×m ta thÕ! §õng nãi lµ ng­¬i còng t×m ta nhĞ!",3,
	"Ta ®ang cã nhiÖm vô b¸n thŞt t­¬i/nvthittuoi",
	"Ta muèn häc khinh c«ng/hockcong",
	"Kh«ng cã g×! ChØ lµ ®i ngang qua th«i!/no")
end;

function nvthittuoi()
	Say("LINK:<npc>",0,"<npc>: Ng­¬i hiÖn ®ang cã "..GetTask(TASK_THITTUOI).." miÕng thŞt t­¬i. Ta muèn ng­¬i ra ngoµi rõng t×m thªm mét İt n÷a. Mang vÒ ®©y ta sÏ tÆng ng­¬i mét sè ®iÓm kinh nghiÖm, cã ®ång ı kh«ng?",
	3,
	"§­¬ng nhiªn! Dï sao ta còng muèn t×m chót İt kinh nghiÖm/nhannv",
	"Ta ®Õn ®Ó giao thŞt/tranv",
	"§Ó ta suy nghÜ l¹i!/no")
end

function nhannv()
	local nTask = GetNumber(2,GetTask(TASK_DUNGCHUNG2),4);
	if(nTask > 0) then
		Say("Ng­¬i ®· nhËn nhiÖm vô t×m thŞt t­¬i råi! Kh«ng cÇn lµm n÷a! T×m "..nTask.." miÕng thŞt t­¬i ®i!","KÕt thóc ®èi tho¹i/no")
	else
		nTask = random(5,20);
		SetTask(TASK_DUNGCHUNG2,SetNumber(2,GetTask(TASK_DUNGCHUNG2),4,nTask));
		Say("HiÖn giê ta cÇn "..nTask.." miÕng thŞt t­¬i, h·y ®i t×m gióp ta!.",1,"KÕt thóc ®èi tho¹i/no")
		AddNote(13,1,"T×m cho vâ s­ "..nTask.." miÕng thŞt t­¬i");
	end
end


function tranv()
	local nTaskValue = GetTask(TASK_DUNGCHUNG2);
	local nTask = GetNumber(2,nTaskValue,4);
	local nNum = GetNumber(1,nTaskValue,6);
	if (nTask ~= 0) then
		if (GetTask(TASK_THITTUOI) >= nTask) then
			if (GetGameTime() >= GetTask(TASK_THOIGIAN8)) and (nNum >= 0) and  (nNum < 3) and  (nTask >= 5) then
				AddRepute(1)
				Msg2Player("B¹n nhËn ®­îc 1 ®iÓm danh väng.")
				nNum = nNum + 1
				if (nNum == 3) then
					SetTask(TASK_DUNGCHUNG2,SetNumber(1,GetTask(TASK_DUNGCHUNG2),6,0))
					SetTask(TASK_THOIGIAN8,GetGameTime()+43200)
				else
					SetTask(TASK_DUNGCHUNG2,SetNumber(1,GetTask(TASK_DUNGCHUNG2),6,nNum))
					SetTask(TASK_THOIGIAN8,GetGameTime())
				end
			end
			AddOwnExp(nTask*10)
			Earn(nTask*20)
			SetTask(TASK_THITTUOI,GetTask(TASK_THITTUOI)-nTask)
			SetTask(TASK_DUNGCHUNG2,SetNumber(2,GetTask(TASK_DUNGCHUNG2),4,0))
			Talk(1,"","ThËt xuÊt s¾c! H·y nhËn lÊy tiÒn vµ ®iÓm kinh nghiÖm!")
		else 
			Say("HiÖn giê ta cÇn "..nTask.." miÕng thŞt t­¬i. Ng­¬i hiÖn ®ang cã "..GetTask(TASK_THITTUOI).." miÕng, cè g¾ng thªm ®i!",1,"KÕt thóc ®èi tho¹i/no")
		end
	else 
		Talk(1,"","Vâ S­: Ch­a lµm xong nhiÖm vô mµ d¸m ®Õn g¹t ta µ? Ng­êi ®©u, tiÔn kh¸ch!")
	end
end

function hockcong()
	local nTaskValue = GetTask(TASK_DUNGCHUNG);
	local nTask = GetNumber(1,nTaskValue,7);
	if (GetLevel() >= 2) then
		if(nTask == 0) then
		Say("Vâ häc 'ngoµi luyÖn g©n cèt, trong luyÖn khİ c«ng'. Häc vâ ph¶i tËp c¶ trong lÉn ngoµi! Xem ng­¬i t­ chÊt th«ng minh, cã muèn häc vµi chiªu phßng th©n kh«ng? Häc phİ chØ cã 100 l­îng", 2, "Häc/kcong", "Kh«ng häc/no")
		else
		kcong();
		end;
	else
		Talk(1,"","H¹ luyÖn tam phôc, §«ng luyÖn tam cöu. Vâ nghÖ kh«ng ph¶i mét ngµy mµ thµnh!")
	end
end;

function kcong()
	local nTaskValue = GetTask(TASK_DUNGCHUNG);
	local nTask = GetNumber(1,nTaskValue,7);
	local nTime = GetNumber(2,nTaskValue,3);
	if(nTask == 0) then
		if(GetCash() < 100) then
		Talk(1,"",10259)
		else
		Pay(100)
		nTaskValue = SetNumber(1,nTaskValue,7,1)
		nTaskValue = SetNumber(2,nTaskValue,3,0)
		SetTask(TASK_DUNGCHUNG, nTaskValue)
		Talk(1,"",10258)
		end
	elseif(nTask == 1) then	--coc go
		if(nTime < 50) then
		Talk(1,"",NOT_ENOUGH..(50-nTime).." cäc gç ®i!")
		else
		nTaskValue = SetNumber(1,nTaskValue,7,2)
		nTaskValue = SetNumber(2,nTaskValue,3,0)
		SetTask(TASK_DUNGCHUNG, nTaskValue)
		Talk(1,"",10253)
		end
	elseif(nTask == 2) then	--bao cat
		if(nTime < 50) then
		Talk(1,"",NOT_ENOUGH..(50-nTime).." bao c¸t ®i!")
		else
		nTaskValue = SetNumber(1,nTaskValue,7,3)
		nTaskValue = SetNumber(2,nTaskValue,3,0)
		SetTask(TASK_DUNGCHUNG, nTaskValue)
		Talk(1,"",10254)
		end
	elseif(nTask == 3) then	--moc nhan
		if(nTime < 50) then
		Talk(1,"",NOT_ENOUGH..(50-nTime).." méc nh©n ®i!")
		else
		nTaskValue = SetNumber(1,nTaskValue,7,4)
		nTaskValue = SetNumber(2,nTaskValue,3,0)
		SetTask(TASK_DUNGCHUNG, nTaskValue)
		AddMagic(210,1)
		Msg2Player("Chóc mõng b¹n ®· luyÖn thµnh Khinh C«ng.")
		Talk(1,"",10255)
		end
	else	--da hoc xong
		Talk(1,"",10256)
	end
end;

function no()
end;