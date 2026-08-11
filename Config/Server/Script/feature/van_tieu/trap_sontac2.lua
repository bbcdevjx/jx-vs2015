Include("\\script\\header\\taskid.lua")
function main()
	local nTask = GetTask(TASK_VANTIEU)
	if(GetNumber(1,nTask,1) == 0) then
	return end
	if(GetNumber(1,nTask,2) == 2) then
		Msg2Player("Bπn Æ∑ bﬁ S¨n t∆c trung mai phÙc. H∑y Æ∏nh bπi hæn mÌi c„ th” Æi ti’p!")
		SetPos(2266,3804)
	end
end