--description: 峨嵋派何怜飘非任务对话
--author: yuanlan	
--date: 2003/3/3


function emnpc04_Default()

UTask_em = GetTask(1);

if (UTask_em == 6) then 					--完成前三关
	Say("何怜飘：恭喜你！你已经顺利过了三关考验，现在你去找<color=Red>谢云萝<color>师妹吧，她就在半山腰的<color=Red>钻天坡入口<color>。", 0)
return	
end;

if (UTask_em < 10) then 					--尚未入门
	Say("何怜飘：要想加入本派，必须先通过茶琴书的考验，然后再闯钻天坡得到白玉如意，你都做到了吗？", 0)
else
	if (UTask_em < 70) then   				--已经入门，尚未出师
		Say("何怜飘：现在咱们是同门好姐妹了，我真开心！", 0)
	else							--已经出师
		Say("何怜飘：你出去闯荡江湖，可不要忘了我们这些姐妹哦！", 0)
	end
end;	

end;



