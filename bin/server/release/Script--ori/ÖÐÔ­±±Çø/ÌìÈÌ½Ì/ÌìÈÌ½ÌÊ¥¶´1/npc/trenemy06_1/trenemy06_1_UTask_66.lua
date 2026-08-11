--description: 天忍教圣洞一层敌人 天忍教出师任务战斗死亡
--author: yuanlan	
--date: 2003/5/20



function trenemy06_1_UTask_66()

Task0021 = GetTaskTemp(21);

if (Task0021 == 0) then							
	Msg2Player("得到口诀“天地玄黄”。")
	SetTaskTemp(21, 1)
end		
	
end;


