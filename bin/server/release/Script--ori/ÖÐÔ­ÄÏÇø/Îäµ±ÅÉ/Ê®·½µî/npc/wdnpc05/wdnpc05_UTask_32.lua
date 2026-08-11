--description: 武当派徐岱岳30级任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc05_UTask_32()

UTask_wdsub01 = GetTask(16);
	
if (UTask_wdsub01 == 1) then 						--计时已到	
	Say("徐岱岳：你已经超过时间了，真让我失望啊，你平时是不是偷懒啦？拳不离手，曲不离口，一定要勤加练习才行！什么时候准备好了，可以再来找我。", 0)
	DelItem("画眉草")
	DelItem("画眉草")
	DelItem("画眉草")
	DelItem("画眉草")
	DelItem("画眉草")
	SetTaskTemp(15, 0)
	SetTask(5, 30)
	SetTask(16, 0)
else									--计时未到
	Say("徐岱岳：你采到五株画眉草了吗？剩下的时间可不多了，你要抓紧啊！", 0)		
end

end;

