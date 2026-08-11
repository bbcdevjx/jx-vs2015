--description: 峨嵋派妙尘非任务对话
--author: yuanlan	
--date: 2003/3/4


function emnpc06_Default()

UTask_em = GetTask(1);

if (UTask_em < 6) then 							--尚未完成前三关
	Say("妙尘：要想加入本派，必须先通过茶琴书的考验，你都做到了吗？", 0)
end;

if (UTask_em == 6) then 							--尚未完成前三关
	Say("妙尘：你已通过茶琴书的考验，接下来你去找<color=Red>谢云萝<color>师妹吧，她就在半山腰的<color=Red>钻天坡入口<color>处。", 0)
	--Say("妙尘：你已通过茶琴书的考验，接下来你必须通过钻天坡，并且得到白玉如意，", 0)
end;
	
if (UTask_em == 8) then							--拿到白玉如意之后
	Say("妙尘：你将<color=Red>白玉如意<color>交给<color=Red>掌门<color>，就可以加入本派了。掌门在<color=Red>正殿<color>里。", 0)
end;

if (UTask_em >= 10) and (UTask_em < 70) then   				--已经入门，尚未出师
	Say("妙尘：你已经是本派弟子，不必再闯钻天坡了。", 0)
end;

if (UTask_em == 70) then   						--已经出师
	Say("妙尘：师妹，你就要下山了吗？我们会想你的。", 0)
end;	

end;



