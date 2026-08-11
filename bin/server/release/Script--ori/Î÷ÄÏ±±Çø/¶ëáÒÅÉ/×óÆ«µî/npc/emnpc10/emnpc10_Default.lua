--description: 峨嵋派苏词馨非任务对话
--author: yuanlan	
--date: 2003/3/5


function emnpc10_Default()

UTask_em = GetTask(1);

if (UTask_em < 50) then   								--尚未完成40级任务
	Say("苏词馨：那位<color=Red>高人<color>就隐居在<color=Red>青城山中部<color>的<color=Red>神仙洞<color>里。", 0)
else									
	if (UTask_em < 70) then   							--已经完成40级任务，尚未出师
		Say("苏词馨：秦师姐见到曲谱后开心极了，这都多亏你帮忙啊！", 0)
	else										--已经出师
		Say("苏词馨：小师妹，以后行走江湖有了什么难处，别忘了回来找我们啊。", 0)
	end
end;	

end;




