--description: 峨嵋派秦倚风非任务对话
--author: yuanlan	
--date: 2003/3/3


function emnpc03_Default()

UTask_em = GetTask(1);

if (UTask_em == 4) then 					--完成前两关
	Say("秦倚风：看来你倒不是一个俗人，不过还要<color=Red>何怜飘<color>师妹考考你，她就在上面的<color=Red>半山坡<color>，你去找她吧！", 0)
return	
end;

if (UTask_em < 10) then 					--尚未入门
	Say("秦倚风：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？", 0)
else
	if (UTask_em < 70) then   				--已经入门，尚未出师
		Say("秦倚风：师妹，有空我们一起切磋琴艺如何？", 0)
	else							--已经出师
		Say("秦倚风：欲将心事付瑶琴。知音少，弦断有谁听？", 0)
	end
end;	

end;



