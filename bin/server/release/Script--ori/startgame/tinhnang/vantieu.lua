function addnpcvantieu()
	AddNpcNew(308,1,11,3015*32,5059*32,"\\script\\feature\\van_tieu\\tieudau.lua",6,379)
	AddNpcNew(376,1,21,62460,112211,"\\script\\feature\\van_tieu\\tieusu.lua",6,"Thµnh §« tiªu s­")
	
--	if (SERVER_MODE == 1) then
--	return end
	
	nNpcIdx = AddNpcNew(701,100,21,78957,124476,"\\script\\feature\\van_tieu\\bossvantieu.lua",
	5,"S¬n tÆc h¹",nil,RANDOMC(0,1,2,3,4),0,1000000,nil,5000,100,1,1,1,500,50,nil,"\\script\\feature\\van_tieu\\bossvantieu.lua")
	SetNpcValue(nNpcIdx,1)
	nNpcIdx = AddNpcNew(701,100,21,72793,122074,"\\script\\feature\\van_tieu\\bossvantieu.lua",
	5,"S¬n tÆc trung",nil,RANDOMC(0,1,2,3,4),0,1000000,nil,5000,100,1,1,1,500,50,nil,"\\script\\feature\\van_tieu\\bossvantieu.lua")
	SetNpcValue(nNpcIdx,2)
	nNpcIdx = AddNpcNew(701,100,21,64069,119871,"\\script\\feature\\van_tieu\\bossvantieu.lua",
	5,"S¬n tÆc th­îng",nil,RANDOMC(0,1,2,3,4),0,1000000,nil,5000,100,1,1,1,500,50,nil,"\\script\\feature\\van_tieu\\bossvantieu.lua")
	SetNpcValue(nNpcIdx,3)
end

function addtrapvantieu()
	AddTrapEx3(21,1864,3674,30,"\\script\\feature\\van_tieu\\trap.lua")--trap chan. khu vuc bi loi~
	AddTrapEx4(21,2452,3867,25,"\\script\\feature\\van_tieu\\trap_sontac1.lua")
	AddTrapEx1(21,2253,3803,30,"\\script\\feature\\van_tieu\\trap_sontac2.lua")
	AddTrapEx2(21,1974,3758,30,"\\script\\feature\\van_tieu\\trap_sontac3.lua")
end