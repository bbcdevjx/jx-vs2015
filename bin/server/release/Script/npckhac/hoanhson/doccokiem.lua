--hoangnhk
Include("\\script\\header\\taskid.lua");
Include("\\script\\header\\repute_head.lua");

function main(sel)
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	local nCurMin = GetNumber(7,nTaskValue,1);
	if (GetNumber(1,GetTask(TASK_NVDANHVONG3),5) == 1) then
	if (GetNumber(4,GetTask(TASK_NVDANHVONG3),1) == 1023) then
		hoanthanhnv()
	else
		Talk(1,"Tientrinhnv", 11332)
	end
	elseif (GetNumber(1,GetTask(TASK_NVDANHVONG3),5) == 0) then
		if(nCurMin < GetCurServerSec()) then
			if (GetLevel() >= 20) and (GetReputeLevel(GetRepute()) >= 2) then
				Say(11333,2,"Kh«ng thµnh vÊn ®Ò, ta xin gãp søc/nhannv","Ta b©y giê bÒ bén nhiÒu viÖc, lóc kh¸c h·y nãi./out")
			else
				Talk(3,"",11334,11335,11336)
			end
		else
			Talk(2,"",11337,11338)
		end;
	--else
		--Talk(1,"",11339)
	end
end; 

function nhannv() 
	Talk(1,"",11340) 
	SetTask(TASK_NVDANHVONG3,SetNumber(1,GetTask(TASK_NVDANHVONG3),5,1)); 
	SetTask(TASK_NVDANHVONG3,SetNumber(4,GetTask(TASK_NVDANHVONG3),1,0));
	Earn(10000) 
	Msg2Player("TiÕp nhËn nhiÖm vô Th¸i ®é Vâ L©m: thay §éc C« KiÕm ®i th¨m dß th¸i ®é c¸c m«n ph¸i, cã nguyÖn ®ång t©m diÖt Kim hay kh«ng.") 
	AddNote(13,1,"Thay §éc C« KiÕm ®i th¨m dß th¸i ®é c¸c m«n ph¸i, cã nguyÖn ®ång t©m diÖt Kim hay kh«ng.")
end 

function hoanthanhnv() 
	Talk(2,"",11341,11342) 
	local nTaskValue = GetTask(TASK_NVDANHVONG2);
	SetTask(TASK_NVDANHVONG2,SetNumber(7,nTaskValue,1,GetCurServerSec()+24*60));
	SetTask(TASK_NVDANHVONG3,SetNumber(1,GetTask(TASK_NVDANHVONG3),5,0)); 
	i = 10+random(1,10)
	AddRepute(i) 
	Msg2Player("Hoµn thµnh nhiÖm vô Th¸i ®é Vâ L©m cña §éc C« KiÕm, danh väng giang hå gia t¨ng "..i.." ®iÓm.") 
	AddNote(13,1,"Trë l¹i Hoµnh S¬n ®¹i ®iÖn, hoµn thµnh nhiÖm vô Th¸i ®é Vâ L©m cña §éc C« KiÕm") 
end 

function tientrinhnv() 
	local nTaskValue = GetTask(TASK_NVDANHVONG3) 
	faction_list = {
	"Ph¸i ThiÕu L©m",
	"Thiªn V­¬ng Bang",
	"§­êng M«n",
	"Ngò §éc gi¸o",
	"Ph¸i Nga Mi",
	"Thóy Yªn",
	"C¸i Bang",
	"Thiªn NhÉn gi¸o",
	"Ph¸i Vâ §ang",
	"C«n L«n ph¸i",
	}
	str = ""
	for i = 1,10 do
		if (GetBit(GetNumber(4,nTaskValue,1),i) == 1) then
			if (str == "") then
			str = faction_list[i]
			else
			str = str..", "..faction_list[i]
			end
		end
	end 
	if (str == "") then
		Talk(1,"",11343) 
	else 
		Talk(1,"","Ng­¬i b©y giê ®· qua ®iÒu tra c¸c m«n ph¸i: "..str..", hy väng cã thÓ nhanh mét chót.") 
	end
end 

function nvthegioi(nNpcIdx)
	local nFacId=GetNpcValue(nNpcIdx);
	if(nFacId<0 or nFacId >9) then return 0 end;
	local nTaskValue=GetTask(TASK_NVDANHVONG3);
	if(GetNumber(1,nTaskValue,5) == 0) then
	return 0 end;
	local nTask=GetNumber(4,nTaskValue,1);	
	if(GetBit(nTask,nFacId+1)== 1) then
	 return 0 end;
	if(nFacId==0 ) then
	Talk(1,"","§éc C« Minh Chñ cã lêi, l·o n¹p nhÊt ®Þnh kh«ng tõ, ch¼ng qua vèn tù ë trong tay ng­êi Kim, l·o n¹p kh«ng thÓ kh«ng c©n nh¾c nguy h¹i ®Õn t¸nh m¹ng chóng ®Ö tö, kh«ng d¸m ®­êng ®ét hµnh sù. Lµm phiÒn ng­¬i trë vÒ bÈm b¸o §éc C« Minh Chñ l·o n¹p kh«ng gióp ®­îc") 
	elseif(nFacId==1 ) then
	Talk(1,"", 11524) 
	elseif(nFacId==2 ) then
	Talk(1,"",format("§­êng m«n tæ s­ d¹y dç ®Ö tö kh«ng thÓ xen vµo chuyÖn bªn ngoµi. PhiÒn %s chuyÓn lêi ta ®èi víi §éc C« Minh Chñ v« cïng ¸y n¸y",GetSex()==0 and "thiÕu hiÖp" or "n÷ hiÖp")) 
	elseif(nFacId==3 ) then
	Talk(1,"","§éc C« KiÕm muèn liªn Tèng kh¸ng Kim? nãi kh«ng uæng? Bæn gi¸o cïng Kim quèc nguyªn lµ liªn minh mËt thiÕt. Nh÷ng thø thÕ c« lùc máng cã h¹i g× sao?") 
	elseif(nFacId==4 ) then
	Talk(1,"","Bæn m«n tuy lµ n÷ l­u tÇm th­êng, nh­ng viÖc quèc gia h­ng vong chØ tr¸ch kÎ thÊt phu. Håi bÈm §éc C« Minh Chñ, Nga Mi nghe tõ ng­êi phã th¸c!") 
	elseif(nFacId==5 ) then
	Talk(1,"","§éc C« Minh Chñ cã lÖnh, ta lµm sao d¸m kh«ng theo. Nh­ng lµ bæn m«n ®Òu lµ n÷ l­u b×nh th­êng, sî r»ng kh«ng ®­îc. Xin håi b¸o §éc C« Minh Chñ, bæn m«n nhÊt ®Þnh ñng hé c¸c vÞ anh hïng, chóc c¸c vÞ kú khai ®¾c th¾ng!") 
	elseif(nFacId==6 ) then
	Talk(1,"","§éc C« Minh Chñ cã lÖnh, ®Ö tö trªn d­íi C¸i Bang nhÊt mùc tu©n theo, xin vÒ håi bÈm §éc C« Minh Chñ, C¸i Bang nghe tõ ng­êi phã th¸c!") 
	elseif(nFacId==7 ) then
	Talk(1,"","§éc c« kiÕm mÊt ®i lý trÝ ch¼ng? Bæn gi¸o vèn lµ §¹i Kim quèc, ®©y , §éc c« kiÕm ph¸i ng­êi ®Õn hái l·o phô chuyÖn nµy. Tèt, ng­¬i vÒ nãi §éc C« KiÕm nãi , c¸c ng­¬i ch¼ng qua lµ mét ®¸m ng­êi « hîp ,d¸m cïng chèng ®èi §¹i Kim, c©n nh¾c tr­íc kÎo ®êi sau l¹i nãi, ha ha ha!") 
	elseif(nFacId==8 ) then
	Talk(1,"","B©y giê giang hå rÊt lo¹n, ®Ö tö trªn d­íi Vâ §ang ph¶i cÈn thËn.")
	elseif(nFacId==9 ) then
	Talk(1,"","Bæn ph¸i lµ thÇn d©n §¹i Tèng, chèng giÆc ngo¹i x©m lµ ®iÒu ®­¬ng nhiªn, nh­ng §éc C« KiÕm nh¹c phô phôc vô víi ng­êi Kim, chØ sî lµ khã cã thÓ hµng phôc") 
	else
		return 0;
	end;
	SetTask(TASK_NVDANHVONG3,SetNumber(4,GetTask(TASK_NVDANHVONG3),1,SetBit(nTask,nFacId+1,1)));	
	return 1;
end;

function out() 
end 