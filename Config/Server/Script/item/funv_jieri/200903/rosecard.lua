-- Created by tsh 2004-12-09
-- Ãµ¹å¿¨
-- »ñµÃËæ»úÁùÕÅ¿¨

szTitle="H·y chän c©u chóc:"
Message=
{
	{"Ng­êi cã nhí ta nh­ ta nhí ng­êi kh«ng?","BÊt cø lóc nµo ng­êi nhí ®Õn ta th× còng lµ lóc ta ®ang nhí ®Õn ng­êi!"},
	{"Ng­êi lµ lÏ sèng cña ta","Khi ta nãi ng­êi lµ linh hån vµ lÏ sèng cña ta, xin ®õng kinh ng¹c, v× ng­êi kh«ng thÓ thiÕu trong cuéc ®êi ta."},
    {"Ng­êi ®· th¾p s¸ng ngän ®Ìn trong ®ªm tuyÕt r¬i","Bëi khi thÊy ng­êi, c¶m gi¸c Êm ¸p nh­ trong ®ªm tèi bçng nh×n thÊy ngän háa ®¨ng. ChÝnh ng­êi ®· th¾p lªn ngän löa Êm ¸p trong ®ªm!"},
    {"Kh«ng thÓ rêi xa ng­êi trong cuéc ®êi nµy.","500 n¨m ta ®· nguyÖn cÇu tr­íc ®øc PhËt, mong ­íc ®­îc kÕt duyªn trÇn, cïng ng­êi trän ®êi nµy m·i kh«ng rêi xa."},
    {"NguyÖn cïng ng­êi m·i m·i bªn nhau","§õng nãi nh÷ng lêi ®­êng mËt, ®õng tÆng nhau nh÷ng mãn ®¸t tiÒn! C¸i em cÇn chÝnh lµ tr¸i tim thËt lßng cña anh!"},
    {"Ng­êi vµ ta m·i kh¾ng khÝt bªn nhau, xin ®õng phô rÉy mèi l­¬ng duyªn!","MÆc cho thêi gian yªu nhau bao l©u, mong ng­êi lu«n ©u yÕm bªn ta, xin ®õng phô rÉy mèi l­¬ng duyªn!"},
    {"Tr­êng T­¬ng T­ ","Thiªn tr­êng lé viÔn hån phi khæ, méng hån bÊt ®¸o quan s¬n nan. Tr­êng t­¬ng t­ xÐ n¸t t©m can."},
    {"Tö Thanh B¶o KiÕm cña ta","Tö Thanh B¶o KiÕm cña ta ph¸t ra tÝn hiÖu tu..tu. Hãa ra ý trung nh©n lµ ng­êi, cßn bá ®i ®©u?"},
    {"Ng­êi ®· c­íp mÊt hån ta","Ng­êi sao c­íp mÊt hån ta ®Ó ngµy ®ªm ta mang m·i h×nh bãng ng­êi!"},
}

FuncBless={}

function main(index)
dofile("script/item/item_magicscript/1967.lua")
main1(index)
end
function main1(index)
	Input(format("chonloichuc(%d)",index))
end

function chonloichuc(index)
	local name = GetInput();
	local nTIdx = FindPlayer(name)
	if (nTIdx > 0) then
	local nSelectCount = getn(Message);
	for i=1, nSelectCount do
		FuncBless[i] = format(Message[i][1].."/BlessPlayerOnline[%d, %d,%d]",index, nTIdx, i)
	end

	nSelectCount = nSelectCount + 1;
	FuncBless[nSelectCount] = "Hñy bá /QueryWiseManCancel"

	Say(szTitle, getn(FuncBless), FuncBless);
	else
	Msg2Player("Ng­êi mµ b¹n muèn chóc phóc hiÖn kh«ng cã trªn m¹ng! §îi lóc sau thö l¹i!.");
	end
--ÏÈ²»É¾³ýÍæ¼ÒµÄ¿¨Æ¬£¬ÔÚÊµ¼Ê·¢ËÍÁË×£¸£Ê±ÔÙÉ¾£¨ÁÙÊ±¼ÇÂ¼ÏÂÀ´×°±¸±àºÅ£©
	return 1;

end


function BlessPlayerOnline(index, nTargetIdx, nSelect)
	local nMyIdx = PlayerIndex;
	PlayerIndex = nTargetIdx;
	local TargetName = GetName();
	PlayerIndex = nMyIdx;
	if (RemoveItem(index,1) == 1) then
		local szMsg
		szMsg = GetName().." nãi víi "..TargetName..""..Message[nSelect][2]
		AddCountNews(szMsg,1);
	else
		Msg2Player("Kh«ng t×m ®­îc thÎ! Xin thö l¹i 1 lÇn!.")
	end
end

function QueryWiseManCancel()
end