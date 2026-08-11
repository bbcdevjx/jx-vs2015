Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")

function main(nIndex)
dofile("script/feature/van_tieu/tieusu.lua");
	Say("Ta lµ ng­êi cña Long M«n tiªu côc. Ta tiÕp nhËn trung chuyÓn nh÷ng chuyÕn tiªu ë n¬i nµy! Ng­¬i cã viÖc g×?",2,
	"Giao tiªu/giaotieu",
	"Hái th¨m th«i/no")
end

function giaotieu()
	SubWorld = SubWorldID2Idx(21)
	if (SubWorld < 0) then
	return end
	local nTaskValue = GetTask(TASK_VANTIEU)
	local nTask = GetNumber(1,nTaskValue,1)
	if(nTask == 0) then
		Talk(1,"","Hõ! Ng­¬i ®©u ph¶i lµ ng­êi do Long M«n tiªu côc ph¸i tíi!")
	elseif(nTask < 4) then
		local nNpcIdx = FindAroundNpc(GetTask(TASK_NPCVANTIEU))
		if(nNpcIdx > 0) then
			local nKilled = GetNumber(1,nTaskValue,2)
			if (nKilled > 0) then
				Talk(1,"","Trªn ®­êng ng­¬i kh«ng hÒ gÆp chuyÖn g× bÊt tr¾c sao?")
			return end		
			DelNpc(nNpcIdx)
			SetTask(TASK_VANTIEU, SetNumber(1,nTaskValue,1,nTask+3))
		else
			Talk(1,"","Tiªu xa cña ng­¬i ®©u? Ta kh«ng nh×n thÊy!")
		end
	else	-- = 4.5.6
		Talk(1,"","H·y vÒ gÆp «ng chñ ®Ó nhËn lao phİ ®i b¹n trÎ!")
	end
end

function no()
end