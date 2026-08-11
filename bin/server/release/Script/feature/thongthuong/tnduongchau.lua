--hoangnhk
Include("\\script\\lib\\worldlibrary.lua");
Include("\\script\\header\\repute_head.lua");
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\thongthuong.lua");

function tnduongchau()
	Say(10949,3,
		"NhiÖm vô Th«ng Th­¬ng/nvthongthuong",
		"Ta muèn ®æi B¶o r­¬ng/baoruong",
		"Rêi khái/no")
end;

function nvthongthuong()
	if(SERVER_MODE > 0 and SERVER_MODE < 3) then
		Talk(1,"","HiÖn giê kh«ng ph¶i thêi gian nhiÖm vô");
	return end;
	local nTaskValue=GetTask(TASK_NVTHONGTHUONG);
	local nMap = GetNumber(2,nTaskValue,1);
	Say("LINK:<npc>",0,"<npc>: Ng­¬i cã muèn thö søc víi nhiÖm vô cña ta kh«ng?",4,
	format("%s nhiÖm vô/%s",nMap<=0 and "NhËn" or "Giao",nMap<=0 and "nhannvtt" or "giaolbtt"),
	"Hñy nhiÖm vu/huynvtt",
	"Trë l¹i/main",
	"KÕt thóc ®èi tho¹i/no");
end;

function nhannvtt()
	if(GetLevel() < LEVEL_NORMAL or GetReputeLevel(GetRepute()) < 5) then
	Talk(1,"","NhiÖm vô nµy cÇn ng­êi cã thùc lùc vµ thanh thÕ trªn giang hå. §¼ng cÊp <color=Red>"..LEVEL_NORMAL.."<color> trë lªn. Danh väng cÊp <color=Red>5");
	return end;
	local bInTeam=GetTeamSize()>0 and 1 or 0;
	if(bInTeam==1 and IsCaptain()==0) then
	Talk(1,"","B¹n kh«ng ph¶i §éi Tr­ëng, kh«ng thÓ tiÖp nhËn nhiÖm vô");
	return end;
	local nMyIndex=PlayerIndex;
	local nFacbonus =0;
	if(bInTeam==1) then
		for i=0,7 do
			local nMemId=GetTeamMem(i);
			if(nMemId>0) then
			PlayerIndex = nMemId;
			if(GetFactionNo()==1 or GetFactionNo()==3 or GetFactionNo() == 5) then
				bFacbonus=10;
				i=7;
			end;
			end;
		end;
	end;
	PlayerIndex=nMyIndex;
	if(bInTeam == 1)then
		for i=0,7 do
			local nMemId=GetTeamMem(i);
			if(nMemId>0) then
			PlayerIndex = nMemId;
			local nMap = random(getn(THONGTHUONG_MONTER));
			local nTaskValue=GetTask(TASK_RESET3);
			local nNum = GetNumber(1,nTaskValue,8);
			if(nNum >= MAX_NVTN) then
				Msg2Team(GetName.." nhËn nhiÖm vô thÊt b¹i: ®ñ sè nhiÖm vô trong ngµy");
			elseif(nMap >0) then
				Msg2Team(GetName.." nhËn nhiÖm vô thÊt b¹i: hiÖn ®ang cã nhiÖm vô ch­a hoµn thµnh");
			else
			local nNpcTempID = THONGTHUONG_MONTER[nMap][2][random(getn(THONGTHUONG_MONTER[nMap][2]))];
			local nFNum = RANDOM(1,3)+(floor((200-GetLevel())/10))+GetTeamSize()+floor(nFNum*bFacbonus/100);
			local nIdx=AddItemID(AddItem(0,6,4811,0,0,5,0,0));
			SetParamItem(nIdx,nFNum);
			LockItem(nIdx,1,1,1);
			Msg2Player("NhËn ®­îc mét "..GetNameItem(nIdx).."");
			SetTask(TASK_RESET3,SetNumber(1,nTaskValue,8,nNum+1));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),1,nMap));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(3,GetTask(TASK_NVTHONGTHUONG),3,nNpcTempID));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),2,THONGTHUONG_MONTER[nMap][3]));
			SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),3,0));
			local str="NhËn nhiÖm vô <color=Yellow><Tiªu diÖt "..THONGTHUONG_MONTER[nMap][3].." "..GetNpcTempName(nNpcTempID).."><color> t¹i <"..GetWorldName(THONGTHUONG_MONTER[nMap][1])..">";
			Msg2Player(str);
			AddNote(13,1,1,str);
			end
			end
		end;
	else
		local nTaskValue=GetTask(TASK_RESET3);
		local nNum = GetNumber(1,nTaskValue,8);
		if(nNum >= MAX_NVTN) then
		Msg2Player("B¹n ®· ®¹t giíi h¹n trong ngµy, mai h·y lµm tiÕp");
		return end;
		local nMap = random(getn(THONGTHUONG_MONTER));
		local nNpcTempID = THONGTHUONG_MONTER[nMap][2][random(getn(THONGTHUONG_MONTER[nMap][2]))];
		local nFNum = RANDOM(1,3)+(floor((200-GetLevel())/10));
		local nNewItem=AddItemID(AddItem(0,6,4811,0,0,5,0,0));
		SetParamItem(nNewItem,nFNum);
		LockItem(nNewItem,1,1,1);
		Msg2Player("NhËn ®­îc mét "..GetNameItem(nNewItem).."");
		SetTask(TASK_RESET3,SetNumber(1,nTaskValue,8,nNum+1));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),1,nMap));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(3,GetTask(TASK_NVTHONGTHUONG),3,nNpcTempID));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),2,THONGTHUONG_MONTER[nMap][3]));
		SetTask(TASK_NVTHONGTHUONG,SetNumber(2,GetTask(TASK_NVTHONGTHUONG),3,0));
		local str="NhËn nhiÖm vô <color=Yellow><Tiªu diÖt "..THONGTHUONG_MONTER[nMap][3].." "..GetNpcTempName(nNpcTempID).."><color> t¹i <"..GetWorldName(THONGTHUONG_MONTER[nMap][1])..">";
		Msg2Player(str);
		AddNote(13,1,str);
	end;
end;

function giaolbtt()
	local nTaskValue = GetTask(TASK_NVTHONGTHUONG);
	if(GetNumber(2,nTaskValue,1)<=0) then
	return end;
	
	local nMap = GetNumber(2,nTaskValue,1);
	local nNpcTempID = GetNumber(3,GetTask(TASK_NVTHONGTHUONG),3);		
	local nNpcNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),2);
	local nCurNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),3);
	if(nCurNum >= nNpcNum) then
		Say("§¹i hiÖp h·y chän phÇn th­ëng",3,
		"NhËn th­ëng ®iÓm kinh nghiÖm/selthuong",
		"NhËn th­ëng ng©n l­îng/selthuong",
		"§Ó ta suy nghÜ kü xem/no");
	else
		Talk(1,"","Ng­¬i hiÖn ®ang cã nhiÖm vô tiªu diÖt <color=Red>"..nNpcNum.." "..GetNpcTempName(nNpcTempID).."<color> t¹i "..GetWorldName(THONGTHUONG_MONTER[nMap][1])..". HiÖn t¹i ®· tiªu diÖt <color=Yellow>"..nCurNum.."<color> tªn! H·y nhanh chãng hoµn thµnh");
	end;
end;

function selthuong(sel)
	SetTaskTemp(TEMP_TASK,sel);
	GiveItemUI("Giao nhiÖm vô","Xin h·y ®Æt vµo Th«ng Th­¬ng lÖnh","giaonvtt");
end;

function giaonvtt(sel)
	local nTaskValue = GetTask(TASK_NVTHONGTHUONG);
	if(GetNumber(2,nTaskValue,1)<=0) then
		return 1;
	end;
	
	local index,genre,detail = 0,0,0,0;
	local TIndex = 0;
	for i = 0,5 do
		for j = 0, 9 do
		index,genre,detail = FindItemEx(14,i,j);
		if (index>0 and genre==6 and detail==4811) then
			TIndex=index;
		end
		end
	end	
	if(TIndex<= 0) then
		Talk(1,"","VËt phÈm ®Æt vµo kh«ng ®óng, xin <sex> kiÓm tra l¹i!");
		return 0;
	end;
	local nFacIndex =GetParamItem(TIndex);
	RemoveItem(TIndex,1);
	local nMap = GetNumber(2,nTaskValue,1);
	local nNpcTempID = GetNumber(3,GetTask(TASK_NVTHONGTHUONG),3);		
	local nNpcNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),2);
	local nCurNum = GetNumber(2,GetTask(TASK_NVTHONGTHUONG),3);
	if(nCurNum >= nNpcNum) then
	if(GetTaskTemp(TEMP_TASK)==0) then
		AddOwnExp(EXP_NORMAL+(123456*(200-GetLevel()))*nFacIndex);
	else
		Earn(MONEY_NORMAL+(123*(200-GetLevel()))*nFacIndex);
	end;
	SetTask(TASK_NVTHONGTHUONG,0);
	end;
	return 1;
end;

function huynvtt()
	local nTaskValue = GetTask(TASK_NVTHONGTHUONG);
	if(GetNumber(2,nTaskValue,1)<=0) then
		Talk(1,"","HiÖn t¹i ng­¬i kh«ng cã nhiÖm vô nµo ®Ó hñy!");
		return 1;
	end;
	Say("Mçi ngµy chØ cã vµi c¬ héi lµm nhiÖm vô, ng­¬i ch¾c ch¾n muèn hñy nhiÖm vô nµy chø?",2,
	"Ta thËt t×nh kh«ng muèn lµm nhiÖm vô nµy!/xnhuynv",
	"§Ó ta suy nghÜ l¹i/no")
end;

function xnhuynv()
	SetTask(TASK_NVTHONGTHUONG,0);
	Talk(1,"","B¹n ®· hñy nhiÖm vô thµnh c«ng");
end;

function baoruong()
	if(GetExpandBox()>=2) then
		Talk(1,"","<npc>: §¹i hiÖp ®· më r­¬ng thø hai råi.");
		return
	elseif(GetExpandBox()<1) then
		Talk(1,"","<npc>: §¹i hiÖp vÉn ch­a më r­¬ng thø nhÊt, ta kh«ng thÓ trao ®æi B¸ch b¶o r­¬ng ®­îc. §Õn Ba L¨ng huyÖn më r­¬ng thø nhÊt råi h·y ®Õn t×m ta.");
		return end;
	GiveItemUI("B¸ch b¶o r­¬ng","§iÒu kiÖn ®æi B¸ch b¶o r­¬ng lµ ph¶i më réng r­¬ng thø nhÊt, cïng víi mét con ngùa cÊp 80 bÊt kú vµ mét bé Tµng bµo ®å tõ 1 ®Õn 12.","ktvatpham");
end;

function ktvatpham()
	local index,genre,detail,parti = 0,0,0,0,0;
	local TIndex = 0;
	for i = 0,5 do
		for j = 0, 9 do
		index,genre,detail,parti = FindItemEx(14,i,j);
		if (index>0 and genre==0 and detail==10 and parti==5) then
			TIndex=index;
		end
		end
	end
	if(TIndex <=0) then
		Talk(1,"","<npc>: Kh«ng ®­îc råi, vËt phÈm ta yªu cÇu vÉn ch­a ®ñ.");
		return 0;
	end
	for i=490,501 do
		if(GetItemCount(0,4,i,-1,-1,12)<=0) then
			Talk(1,"","<npc>: Kh«ng ®­îc råi, vËt phÈm ta yªu cÇu vÉn ch­a ®ñ.");
			return 0;
		end
	end
	RemoveItem(TIndex,1);
	for i=490,501 do
		ConsumeItem(1,0,4,i,-1,-1,12);
	end
	SetExpandBox(2)
	OpenBox(2)	
	Talk(1,"",11263)
	return 1;
end;