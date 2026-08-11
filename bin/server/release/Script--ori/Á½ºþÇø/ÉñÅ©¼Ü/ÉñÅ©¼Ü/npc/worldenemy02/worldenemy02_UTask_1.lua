--description: 神农架地表黑叶猴 世界任务战斗死亡
--author: yuanlan	
--date: 2003/4/30



function worldenemy02_UTask_1()

Task0013 = GetTaskTemp(13);

if (Task0013 < 10) then		--到达十只后不再计数
	Task0013 = Task0013 + 1	
	SetTaskTemp(13, Task0013)
end;
	
end;	
