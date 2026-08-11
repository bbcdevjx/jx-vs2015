--description: 峨嵋派清晓师太入门任务
--author: yuanlan	
--date: 2003/3/3



function emnpc01_UTask_enroll()

if ( HaveItem("白玉如意") == 1) then					--拿到白玉如意
	Say("清晓师太：我佛慈悲，既然你一心至诚，贫尼就收你为徒，希望你好生学艺，谨守门规，不要辜负了为师的期望。", 1, "谨遵教诲/ok")
else									--白玉如意丢失
	Say("系统：真糟糕！你不小心把白玉如意给弄丢了，如果要完成这个任务，你必须得到白玉如意。", 2, "我再找找/find1", "重新闯钻天坡/redo1")
end

end;


function ok()
DelItem("白玉如意")
SetFaction("峨嵋派")    			
SetCamp(1)
SetCurCamp(1)
SetRank(13)
AddMagic(80)
SetRevPos(13, 13)  					
SetTask(1, 10)
Msg2Player("欢迎你加入峨嵋派，成为布衣尼！")
Msg2Player("学会武功“飘雪穿云”。")
end;


function find1()
end;

function redo1()
Say("系统：请重新在钻天坡入口谢云萝处接受任务。", 0)
SetTask(1, 6)
end;