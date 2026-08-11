--description: 峨嵋派叶冰痕非任务对话
--author: yuanlan	
--date: 2003/3/3


function emnpc02_Default()

UTask_em = GetTask(1);

if (UTask_em == 2) then 					--完成第一关
	Say("叶冰痕：你可以继续下面的考验了，下一位是<color=Red>秦倚风<color>师妹，她在<color=Red>迎客石<color>附近", 0)
return	
end;

if (UTask_em < 10) then 					--尚未入门
	Say("叶冰痕：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？", 0)
else
	if (UTask_em < 70) then   				--已经入门，尚未出师
		Say("叶冰痕：师妹，你爱喝茶吗？", 0)
	else							--已经出师
		Say("叶冰痕：石碾轻飞瑟瑟尘，乳香烹出建溪春。世间绝品人难识，闲对茶经忆古人。", 0)
	end
end;	

end;



