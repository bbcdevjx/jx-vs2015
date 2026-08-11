Include ("\\script\\header\\shitu.lua")

function main()
dofile("script/item/card/card_shitu.lua");
main1();
end

function main1()
	if (GetTranslife() > 0 and GetLevel() < 80) then
		Say("LÜnh héi B¾c §Èu Tr­êng Sinh ThuËt - T©m Ph¸p Thiªn xong, ë cÊp 80 vÒ tr­íc kh«ng thÓ sö dông S­ §å ThiÕp.", 0);
	return end;
	
	local tb = {

	};
	if(GetLevel()>= 80) then
		local nNum = GetApprenticeNum()
		if(FindApprentice() and nNum<GetApplyApprentice(GetNumber(2,GetTask(TASK_SHITU_XSU),1))) then
			tinsert(tb,"Thu nhËn ®Ö tö/CallBack_ShoutuList")
		end;
	end;
	if(GetEnableChushiApps()) then
		tinsert(tb,"§å ®Ö xuÊt s­/ChushiList")
	end
	--if(GetHaveNewLilianApps(masterName)) then
	--	tinsert(tb,"Tra xem rÌn luyÖn giang hå cña ®å ®Ö/LilianList")
	--end
	if(num > 0 ) then
		tinsert(tb,"Tra tin tøc ®å ®Ö/TudiInfoList")
		tinsert(tb,"Hñy bá quan hÖ ®å ®Ö/BreakTuList")
	end
	tinsert(tb,"Xem th«ng tin c¸ nh©n/SfChaShifu")
	tinsert(tb,"T×m hiÓu S­ ®å thiÕp/AboutShituCard")
	tinsert(tb,"§ãng/Quit")

	local str = "S­ ®å thiÕp dïng ®Ó g¾n kÕt quan hÖ s­ ®å, h¬n n÷a cã thÓ sö dông chøc n¨ng s­ ®å t­¬ng quan. NÕu b¹n ch­a cã quan hÖ s­ ®å, h·y lËp ®éi nhãm víi ng­êi ch¬i kh¸c råi míi sö dông S­ ®å thiÕp!"
	Say(str,getn(tb),tb)
	return
end

function FindApprentice()
	local nMemNum=GetTeamSize();
	local nCnt=0;
	if(nMemNum>0) then
	TIndex = PlayerIndex;
	for i = 0,nMemNum do 
		PlayerIndex = GetTeamMem(i);
		if(GetLevel()<80 and GetTaskS(TASK_SHITU_NAME)=="") then
		nCnt=nCnt+1;
		end;
	end;
	end;
	PlayerIndex = TIndex;	
	return nCnt;
end;

function timhieu()
	local str =
		"Trong thÕ giíi kiÕm hiÖp, ng­êi ch¬i tõ cÊp 80 trë xuèng (kh«ng gåm cÊp 80) , sö dông <color=green>S­ ®å thiÕp<color> cã thÓ b¸i ng­êi ch¬i cÊp 80 trë lªn (gåm c¶ cÊp 80) lµm s­ phô.<enter>"..
		"Mét khi sö dông quan hÖ s­ ®å gi÷a ng­êi ch¬i, s­ phô cÇn cã chøc tr¸ch nhÊt ®Şnh, chØ ®¹o hoÆc gióp ®ì ®Ö tö hoµn thµnh hÖ thèng nhiÖm vô <color=yellow>thİ luyÖn giang hå<color>, vµ cho ®å ®Ö sau khi d¹t ®­îc cÊp 80 xuÊt s­, s­ phô ®ã ®­îc xem nh­ dÉn d¾t 1 ®å ®Ö thµnh c«ng.<enter>"..
		"Trong thÕ giíi kiÕm hiÖp, 1 ®å ®Ö ®ång thêi chØ cã 1 s­ phô vµ 1 s­ phô cã thÓ ®ång thêi thu nhËn nhiÒu ®å ®Ö. NÕu ng­êi ch¬i tõ cÊp 25 trë xuèng (bao gåm cÊp 25) vµ ch­a bao giê b¸i s­, sau khi b¸i nhËp thµnh c«ng 1 s­ phô, ng­êi ch¬i ®ã chİnh lµ <color=yellow>§İch truyÒn ®Ö tö<color> cña s­ phô;NÕu ng­êi ch¬i tõ cÊp 25 trë lªn (kh«ng bao gåm cÊp 25) b¸i nhËp 1 s­ phô, ng­êi ch¬i lµ <color=yellow>®Ö tö trùc hÖ<color> cña s­ phô;NÕu ng­êi ch¬i tr­íc kia ®· b¸i s­ nh­ng ®· chÊm døt quan hÖ s­ ®å víi tiÒn s­, b¸i nhËn 1 s­ phô, ng­êi ch¬i sÏ lµ <color=yellow>phæ th«ng ®Ö tö<color> cña s­ phô.<enter>"..
		"<enter>§iÒu kiÖn trë thµnh ®å ®Ö:<enter>"..
		"1, Ng­êi ch¬i tõ cÊp 80 trë xuèng (kh«ng gåm cÊp 80)<enter>"..
		"2, Kh«ng lµ ®å ®Ö cña mét s­ phô nµo ®ã<enter>"..
		"<enter>§iÒu kiÖn trë thµnh s­ phô:<enter>"..
		"1, Ng­êi ch¬i tõ cÊp 80 trë lªn (bao gåm cÊp 80)<enter>"..
		"2, Kh«ng lµ ®å ®Ö cña mét s­ phô nµo ®ã<enter>"..
		"<enter>C¸ch nhËn ®­îc S­ ®å thiÕp:<enter>"..
		"1, Nh©n vËt ®­îc t¹o míi: cã s½n S­ ®å thiÕp trong hµnh trang<enter>"..
		"2, Nh©n vËt ®· t¹o: mua S­ ®å thiÕp ë c¸c tiÖm t¹p hãa, gi¸ b¸n lµ 100 l­îng<enter>"
	Say("LINK:<npc>",0,str,2,"Trë l¹i/main","§ãng/no")
end
