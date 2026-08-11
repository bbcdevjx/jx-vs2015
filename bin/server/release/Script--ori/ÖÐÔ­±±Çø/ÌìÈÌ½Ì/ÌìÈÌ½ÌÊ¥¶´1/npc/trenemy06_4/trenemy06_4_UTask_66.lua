--description: 天忍教圣洞一层敌人 天忍教出师任务战斗死亡
--author: yuanlan	
--date: 2003/5/20



function trenemy06_4_UTask_66()

Task0024 = GetTaskTemp(24);

if (Task0024 == 0) then							
	Msg2Player("得到口诀“唯我教王”。")
	SetTaskTemp(24, 1)
end;
	
end;


