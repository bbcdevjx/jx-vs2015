--hoangnhk
Include("\\script\\header\\repute_head.lua");

function main()
	Say(GetSex()==1 and 10101 or 10100, 2,
	"§­îc! §Ó ta xem thö/xem",
	"Kh«ng cÇn ®©u/no")
end;

function xem()
	if(GetCash() >= 5000) then
	Pay(5000)
	--Talk(1,"",10103);
	local nRepute = GetRepute()
	local nReputeLv = GetReputeLevel(nRepute) 
	if (nReputeLv == -1) then
	Talk(1,"",10103) 
	elseif (nReputeLv == 0) then 
	Talk(2,"","Kim long h¸ lµ trong ao vËt, ng­¬i b©y giê mÆc dï mét giíi ¸o v¶i, ng­êi giang hå së kh«ng biÕt, nh­ng gi¶ lÊy ngµy giê, tÊt ®em cã kinh thiªn ®éng ®Şa kh¶ n¨ng",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 1) then 
	Talk(2,"","ThÇn long chît hiÖn trong cuéc sèng, ng­¬i mÆc dï s¬ xuÊt mao l­, nh­ng tÊt ®em nhanh chãng quËt khëi, cã thøc chi sÜ sÏ rÊt nhanh chó ı tíi lùc l­îng cña ng­¬i",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 2) then 
	Talk(2,"","Så ph­îng lßng cã hång héc chİ, mÆc dï ë trong chèn giang hå ng­¬i vÉn chØ lµ v« danh tiÓu bèi, nh­ng v­ît qua phµm bèi ®èi víi ng­¬i mµ nãi ch¼ng qua lµ ch¹m tay cã thÓ ®ông chuyÖn",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 3) then 
	Talk(2,"","TiÒm tu m­êi t¸i kh«ng ng­êi hái, ë trong chèn giang hå ng­¬i vÉn yªn lÆng kh«ng nghe thÊy, nh­ng tiÒm chÊt ®· biÓu lé kh«ng bá sãt, NhÊt Phi Trïng Thiªn ch¼ng qua lµ sím muén chuyÖn",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 4) then 
	Talk(2,"","§· tr¶i qua ®«ng ®¶o ma luyÖn sau ®İch ng­¬i, ®· ®ang lóc mäi ng­êi tr­íc s¬ s¬ hiÓn lé phong mang, giang hå bÇy hiÖp ®· më míi chó ı tíi ng­¬i quËt khëi",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 5) then 
	Talk(2,"","Ng­¬i ®· v­ît qua gian nan nhÊt khèn khæ ®İch giai ®o¹n, ng­¬i danh tiÕng b¾t ®Çu ¶nh h­ëng ®Õn nh÷ng ng­êi chung quanh, ng­êi nhiÒu h¬n ph¸t hiÖn n¨ng lùc cña ng­¬i",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 6) then 
	Talk(2,"","Ng­¬i quËt khëi ®ang bŞ cµng ngµy cµng nhiÒu ng­êi coi träng, trong chèn giang hå ng­¬i danh tiÕng ®· cµng ngµy cµng vang déi, mäi ng­êi b¾t ®Çu thËt lßng thùc ı ®Şa ®èi víi ng­¬i nãi “ nh­ sÊm bªn tai”",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 7) then 
	Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm trong giang hå. B¶n lÜnh ®· dÇn thÓ hiÖn, c¸c anh hïng hiÖp nghÜa trªn giang hå ®· dÇn dÇn chó ı ®Õn ng­¬i.",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 8) then 
	Talk(2,"","Ng­¬i ®· cã nhiÒu kinh nghiÖm trong giang hå. B¶n lÜnh ®· dÇn thÓ hiÖn, c¸c anh hïng hiÖp nghÜa trªn giang hå ®· dÇn dÇn chó ı ®Õn ng­¬i.",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	elseif (nReputeLv == 9) then 
	Talk(2,"","Danh väng giang hå ®· t¨ng lªn tét ®Ønh, giang hå t«n ng­¬i lµ: NhÊt §¹i T«ng s­, Vâ L©m §¹i HiÖp",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	else 
	Talk(2,"","Th©n lµ nh©n vËt truyÒn thuyÕt chèn giang hå, giang hå hËu bèi xem lµ môc tiªu phÊn ®Êu, ng­¬i nh­ ThÇn Long thÊy ®Çu kh«ng thÊy ®u«i",format("Danh väng giang hå cña ng­¬i hiÖn t¹i lµ %d. Giang hå xem ng­¬i hiÖn giê lµ <color=Red>%s ",nRepute,GetReputeStr(nReputeLv))) 
	end 
	else
		Talk(1,"",10102);
	end
end

function no()
end;