--hoangnhk
function npctkimcaocap()
	local nNpcIdx;
	----NPC Chuc nang phe Tong-----
	nNpcIdx = AddNpcNew(629,1,380,40160,114176,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(629,1,380,39712,112736,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(629,1,380,43104,108992,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(629,1,380,42624,110176,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(629,1,380,41280,110240,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(625,1,325,1561*32,3194*32,"\\script\\global\\npcchucnang\\ruongchua.lua",6); SetNpcValue(nNpcIdx, 1);
	nNpcIdx = AddNpcNew(62,1,325,1550*32,3179*32,"\\script\\feature\\tongkim\\tkmoquan.lua",6,872);SetNpcValue(nNpcIdx, 1);--value 1 lµ bªn Tèng
	nNpcIdx = AddNpcNew(235,1,325,1535*32,3153*32,"\\script\\feature\\tongkim\\xaphutk.lua",6,42);SetNpcValue(nNpcIdx, 1);
	nNpcIdx = AddNpcNew(55,1,325,1546*32,3158*32,"\\script\\feature\\tongkim\\nhuquantk.lua",6,881);SetNpcValue(nNpcIdx, 1);
	nNpcIdx = AddNpcNew(203,1,380,40005,113788,"\\script\\global\\npcchucnang\\hieuthuoc.lua",6,614); SetNpcValue(nNpcIdx, 12);
	nNpcIdx = AddNpcNew(55,1,380,38930,113544,"\\script\\feature\\tongkim\\tongkimts.lua",6,"Tèng Qu©n tiÒn ph­¬ng ®Æc th¸m");SetNpcValue(nNpcIdx, 1);
	nNpcIdx = AddNpcNew(625,1,380,39541,113302,"\\script\\global\\npcchucnang\\ruongchua.lua",6);
	----NPC Chuc nang phe Kim-----
	nNpcIdx = AddNpcNew(630,1,380,53024,97920,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(630,1,380,55008,98432,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(630,1,380,51168,103264,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(630,1,380,49728,101056,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(630,1,380,50336,102208,nil,6,"");SetNpcKind(nNpcIdx,4);
	nNpcIdx = AddNpcNew(625,1,325,1593*32,3094*32,"\\script\\global\\npcchucnang\\ruongchua.lua",6); SetNpcValue(nNpcIdx, 2);
	nNpcIdx = AddNpcNew(61,1,325,1555*32,3082*32,"\\script\\feature\\tongkim\\tkmoquan.lua",6,822);--value 0 (mÆc ®Þnh) lµ bªn Kim
	nNpcIdx = AddNpcNew(235,1,325,1568*32,3075*32,"\\script\\feature\\tongkim\\xaphutk.lua",6,823);
	nNpcIdx = AddNpcNew(49,1,325,1580*32,3074*32,"\\script\\feature\\tongkim\\nhuquantk.lua",6,824);
	nNpcIdx = AddNpcNew(203,1,380,54582,98484,"\\script\\global\\npcchucnang\\hieuthuoc.lua",6,613); SetNpcValue(nNpcIdx, 12);
	nNpcIdx = AddNpcNew(49,1,380,53557,97460,"\\script\\feature\\tongkim\\tongkimts.lua",6,"Kim Quèc tiÒn tuyÕn trinh s¸t");
	nNpcIdx = AddNpcNew(625,1,380,54501,97854,"\\script\\global\\npcchucnang\\ruongchua.lua",6);
end;

function traptkcaocap()
	AddTrapEx2(380,1251,3529,10,"\\script\\maps\\tongkim\\trap\\tong.lua")
	AddTrapEx2(380,1289,3480,10,"\\script\\maps\\tongkim\\trap\\tong1.lua")
	AddTrapEx2(380,1661,3098,10,"\\script\\maps\\tongkim\\trap\\kim.lua")
	AddTrapEx2(380,1591,3162,10,"\\script\\maps\\tongkim\\trap\\kim1.lua")
	
	AddTrapEx1(380,1299,3420,18,"\\script\\maps\\tongkim\\trap\\tong_chancong.lua")
	AddTrapEx1(380,1342,3483,18,"\\script\\maps\\tongkim\\trap\\tong_chancong.lua")
	AddTrapEx2(380,1355,3403,18,"\\script\\maps\\tongkim\\trap\\tong_chancong.lua")
	
	AddTrapEx1(380,1537,3169,18,"\\script\\maps\\tongkim\\trap\\kim_chancong.lua")
	AddTrapEx1(380,1605,3233,18,"\\script\\maps\\tongkim\\trap\\kim_chancong.lua")
	AddTrapEx2(380,1525,3241,18,"\\script\\maps\\tongkim\\trap\\kim_chancong.lua")
end;

function objtkimcaocap()
end;