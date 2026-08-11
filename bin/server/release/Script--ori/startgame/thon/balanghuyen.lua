--hoangnhk
function addnpcbalang()
	local nNpcIdx;

	----NPC Mon Phai trong thon-----
	nNpcIdx = AddNPCEx(189,1,53,1592*32,3129*32,"\\script\\npcthon\\npcmonphai\\thieulam.lua",6,183) SetNpcValue(nNpcIdx, 0);
	nNpcIdx = AddNPCEx(184,1,53,1610*32,3196*32,"\\script\\npcthon\\npcmonphai\\thienvuong.lua",6,247) SetNpcValue(nNpcIdx, 1);
	nNpcIdx = AddNPCEx(177,1,53,1613*32,3174*32,"\\script\\npcthon\\npcmonphai\\duongmon.lua",6,246) SetNpcValue(nNpcIdx, 2);
	nNpcIdx = AddNPCEx(186,1,53,1621*32,3205*32,"\\script\\npcthon\\npcmonphai\\ngudoc.lua",6,178) SetNpcValue(nNpcIdx, 3);
	nNpcIdx = AddNPCEx(83 ,1,53,1636*32,3184*32,"\\script\\npcthon\\npcmonphai\\ngami.lua",6,248) SetNpcValue(nNpcIdx, 4);
	nNpcIdx = AddNPCEx(171,1,53,1581*32,3203*32,"\\script\\npcthon\\npcmonphai\\thuyyen.lua",6,177) SetNpcValue(nNpcIdx, 5);
	nNpcIdx = AddNPCEx(103,1,53,1601*32,3124*32,"\\script\\npcthon\\npcmonphai\\caibang.lua",6,194) SetNpcValue(nNpcIdx, 6);
	nNpcIdx = AddNPCEx(181,1,53,1619*32,3163*32,"\\script\\npcthon\\npcmonphai\\thiennhan.lua",6,240) SetNpcValue(nNpcIdx, 7);
	nNpcIdx = AddNPCEx(188,1,53,1635*32,3189*32,"\\script\\npcthon\\npcmonphai\\vodang.lua",6,249) SetNpcValue(nNpcIdx, 8);
	nNpcIdx = AddNPCEx(309,1,53,1576*32,3145*32,"\\script\\npcthon\\npcmonphai\\conlon.lua",6,181) SetNpcValue(nNpcIdx, 9);
	----NPC Chuc nang-----
	nNpcIdx = AddNPCEx(625,1,53,1612*32,3168*32,"\\script\\global\\npcchucnang\\ruongchua.lua",6); SetNpcValue(nNpcIdx, 19);
	nNpcIdx = AddNPCEx(219,1,53,1600*32,3170*32,"\\script\\global\\npcchucnang\\taphoa.lua",6,84); SetNpcValue(nNpcIdx, 23);
	nNpcIdx = AddNPCEx(198,1,53,1586*32,3155*32,"\\script\\global\\npcchucnang\\thoren.lua",6,55); SetNpcValue(nNpcIdx, 22);
	nNpcIdx = AddNPCEx(203,1,53,1598*32,3209*32,"\\script\\global\\npcchucnang\\hieuthuoc.lua",6,251); SetNpcValue(nNpcIdx, 24);
	AddNPCEx(239,1,53,1578*32,3236*32,"\\script\\global\\npcchucnang\\xaphu.lua",6,42)
	AddNPCEx(108,1,53,1626*32,3172*32,"\\script\\global\\npcchucnang\\datau.lua",6,59)
	AddNPCEx(377,1,53, 52150, 102241, "\\script\\global\\npcchucnang\\lequan.lua",6,57) 
	AddNPCEx(663,1,53,1619*32,3169*32,"\\script\\global\\npcchucnang\\longngu.lua",6)--enemy199
	AddNPCEx(373,1,53,1601*32,3188*32,"\\script\\global\\npcchucnang\\cthanhquan.lua",6,186)
	AddNPCEx(311,1,53,53489,95320,"\\script\\global\\npcchucnang\\vosu.lua",6,201)
	AddNPCEx(87,1,53,52189,101738,"\\script\\global\\npcchucnang\\trogiup.lua",6,"T©n Thñ Sø Gi¶ ") --308
	--Npc ba lang huyen
	AddNPCEx(362,1,53,1639*32,3210*32,"\\script\\npcthon\\balang\\tieungu.lua",6,252) 
	AddNPCEx(297,1,53,1632*32,3214*32,"\\script\\npcthon\\balang\\ngudan.lua",6,241) 
	AddNPCEx(347,1,53,1621*32,3256*32,"\\script\\npcthon\\balang\\aphuong.lua",6,253) 
	AddNPCEx(323,1,53,1506*32,3173*32,"\\script\\npcthon\\balang\\thamcuu.lua",6,242) 
	AddNPCEx(247,1,53,1632*32,3243*32,"\\script\\npcthon\\balang\\colaothai.lua",6,254) 
	AddNPCEx(359,1,53,57538,98808,"\\script\\npcthon\\balang\\dukhach.lua",6,237) 
	AddNPCEx(360,1,53,1569*32,3151*32,"\\script\\npcthon\\balang\\thuanthuy.lua",6,239)
	AddNPCEx(385,1,53,1564*32,3145*32,"\\script\\npcthon\\balang\\lagiathamtu.lua",6,238) 
	AddNPCEx(246,1,53,1557*32,3196*32,"\\script\\npcthon\\balang\\cuucanlaogia.lua",6,243) 
	AddNPCEx(212,1,53,1605*32,3120*32,"\\script\\npcthon\\balang\\chutuudiem.lua",6,38) 
	AddNPCEx(367,1,53,1551*32,3220*32,"\\script\\npcthon\\balang\\ducuuchau.lua",6,250) 
	AddNPCEx(333,1,53,1568*32,3183*32,"\\script\\npcthon\\balang\\phuongkhavi.lua",6,244) 
	nNpcIdx = AddNPCEx(240,1,53,1801*32,3154*32,"\\script\\npcthon\\balang\\thuyenphu.lua",6,241);SetNpcValue(nNpcIdx, 2);
	nNpcIdx = AddNPCEx(242,1,53,1778*32,3176*32,"\\script\\npcthon\\balang\\thuyenphu.lua",6,241);SetNpcValue(nNpcIdx, 2);
	nNpcIdx = AddNPCEx(242,1,53,49385,93542,"\\script\\npcthon\\balang\\thuyenphu.lua",6,31);SetNpcValue(nNpcIdx, 1);
end;

function addtrapbalang()
	AddTrapEx1(53,1648,3244,12,"\\script\\maps\\balang\\trap\\cong4h.lua")
	AddTrapEx2(53,1558,3250,12,"\\script\\maps\\balang\\trap\\cong8h.lua")
	AddTrapEx1(53,1534,3119,12,"\\script\\maps\\balang\\trap\\cong10h.lua")
	AddTrapEx2(53,1624,3093,12,"\\script\\maps\\balang\\trap\\cong2h.lua")
	
end;

function addobjbalang()
	AddObj(303,53,57712,96746,"\\script\\maps\\balang\\obj\\ngocboi.lua",0,0)
	AddObj(6,53,52041,98881,"\\script\\maps\\balang\\obj\\biada.lua",1,0)
	AddObj(4,53,51824,99108,"",0,0)
	AddObj(6,53,49418,99490,"\\script\\maps\\balang\\obj\\biada.lua",0,0)
	--AddObj(1,53,51593,101357,"",0,0)
	AddObj(4,53,52083,101248,"\\script\\maps\\balang\\obj\\caothi.lua",1,0)
	AddObj(6,53,49835,104110,"\\script\\maps\\balang\\obj\\biada.lua",1,0)
	AddObj(6,53,53128,103632,"\\script\\maps\\balang\\obj\\biada.lua",0,0)
	SetObjValue(AddObj(295,53,43188,105587,"\\script\\maps\\balang\\obj\\dauhieu.lua",0,0),1)
	SetObjValue(AddObj(295,53,43178,106701,"\\script\\maps\\balang\\obj\\dauhieu.lua",0,0),2);
	SetObjValue(AddObj(296,53,57826,109886,"\\script\\maps\\balang\\obj\\dauhieu.lua",0,0),3)
end;