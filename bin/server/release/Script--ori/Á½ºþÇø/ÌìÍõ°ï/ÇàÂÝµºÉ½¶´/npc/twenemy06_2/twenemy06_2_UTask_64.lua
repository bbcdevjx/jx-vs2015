--description: 青螺岛山洞敌人出师任务战斗死亡
--author: yuanlan	
--date: 2003/4/28



function twenemy06_2_UTask_64()	

if ( HaveItem("天王遗书") == 0) then	
	i = random(0,2)							--概率为30%
	if (i == 0) then 
		AddEventItem("天王遗书")
		Msg2Player("从金人杀手处夺回《天王遗书》。")
		SetTask(3, 66)
	end
end;	

end;