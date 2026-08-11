--description: 武当派徐岱岳30级任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc05_UTask_35()

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
	if ( HaveItem("画眉草") == 1) then				--没有画眉草
		if ( GetItemCount("画眉草") >= 5 ) then			--画眉草数目为5
			StopTimer()					--结束计时
			Say("徐岱岳：看来你的武功果然精进神速啊，可喜可贺！", 1, "多谢师叔夸奖/ok")
			
		else
			Say("系统：真糟糕！你不小心把采到的画眉草弄丢了，如果要完成任务，你必须得到五株画眉草。所幸时间尚未到，你可以再去伏牛山采。", 2, "我再找找/find", "再去伏牛山采/redo")					
		end
	else
		Say("系统：真糟糕！你不小心把采到的画眉草弄丢了，如果要完成任务，你必须得到五株画眉草。所幸时间尚未到，你可以再去伏牛山采。", 2, "我再找找/find", "再去伏牛山采/redo")			
	end
end;	

end;


function ok()
DelItem("画眉草")
DelItem("画眉草")
DelItem("画眉草")
DelItem("画眉草")
DelItem("画眉草")
SetRank(10)
SetTask(5, 40)
AddMagic(158)
AddMagic(159)
AddMagic(160)
Msg2Player("恭喜你！你已经升为巡山道人了！")
Msg2Player("学会武当派武功“剑飞惊天”。")
Msg2Player("学会武当派七星阵。")
Msg2Player("学会武当派武功“梯云纵”。")
end;


function find()
end;


function redo()					--在剩下时间里，在已有画眉草的基础上，重新采到画眉草
Say("系统：请在剩下的时间里去伏牛山重新采回画眉草。", 0)
Msg2Player("你已选择重上伏牛山采画眉草。")
SetTaskTemp(15, 0)
SetTask(5, 32)
end;