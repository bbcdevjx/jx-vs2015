--description: 峨嵋派谢云萝非任务对话
--author: yuanlan	
--date: 2003/3/3


function emnpc05_Default()

UTask_em = GetTask(1);

if (UTask_em < 6) then 							--尚未完成前三关
	Say("谢云萝：要想加入本派，必须先通过茶琴书的考验，你都做到了吗？", 0)
end;

if (UTask_em == 7) then							
	Say("谢云萝：拿到<color=Red>白玉如意<color>后，请从山上的出口离开钻天坡。", 0)
end;	

if (UTask_em == 8) then							--出钻天坡后
	Say("妙尘：你将<color=Red>白玉如意<color>交给<color=Red>掌门<color>，就可以加入本派了。掌门在<color=Red>正殿<color>里。", 0)
end;


if (UTask_em >= 10) and (UTask_em < 70) then   				--已经入门，尚未出师
	Say("谢云萝：你已经是本派弟子，不必再闯钻天坡了。", 0)
end;
	
if (UTask_em >= 70) then   						--已经出师
	Say("谢云萝：有空常回来看看我们啊！", 0)
end;	

end;



