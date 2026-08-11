--description: 峨嵋派妙隐非任务对话
--author: yuanlan	
--date: 2003/3/4


function emnpc07_Default()

UTask_em = GetTask(1);

if (UTask_em == 12) then 
Say("妙隐：<color=Red>另半面铜镜<color>在我<color=Red>相公<color>那儿，他就在<color=Red>山脚下的树林<color>里。", 0)
return
end;

if (UTask_em == 17) then 
Say("妙隐：师妹，请你帮我把这个修补好的铜镜交给我相公，如果他愿意等我三年，三年后，我一定回到他的身边，但是在这三年里，我要潜心修行，以祈求佛祖的谅解。", 0)
return
end;

if (UTask_em < 20) then   						--尚未完成10级任务
	Say("妙隐：佛祖，弟子有罪，请佛祖责罚弟子，不要去降罪于他……", 0)
else									
	if (UTask_em < 70) then   					--已经完成10级任务，尚未出师
		Say("妙隐：师妹，我真不知该怎么谢你！", 0)
	else								--已经出师
		Say("妙隐：师妹，你就要下山了吗？多多保重。", 0)
	end
end;	

end;




