Include("\\script\\lib\\worldlibrary.lua")
Include("\\script\\header\\taskid.lua")

function main(nIndex)
	local nTask = GetTask(TASK_RESET5)
	local nLan = GetNumber(1,nTask,7)
	if(nLan >= 5) then
	Talk(1,"","H«m nay b¹n ®· nhËn 5 lÇn råi. Ngµy mai míi cã thÓ tiÕp tôc!")
	return end
	DelNpc(nIndex)
	SetTask(TASK_RESET5, SetNumber(1,nTask,7,nLan+1))
	AddOwnExp(2000000)
	Msg2Player("H«m nay b¹n c­íp tiªu "..GetNumber(1,GetTask(TASK_RESET5),7).."/5 lÇn")
end

function Timeout(nIndex)
	DelNpc(nIndex)
end

function no()
end