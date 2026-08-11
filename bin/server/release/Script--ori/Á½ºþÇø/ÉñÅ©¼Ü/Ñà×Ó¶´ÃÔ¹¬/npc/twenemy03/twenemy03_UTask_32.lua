--description: 神农架 燕子洞敌人30级任务战斗死亡
--author: yuanlan	
--date: 2003/4/25



function twenemy03_UTask_32()

if ( HaveItem("天王令") == 0) then	
	i = random(0,1)							--概率为50%
	if (i == 0) then 
		AddEventItem("天王令")
		Msg2Player("打败强盗，夺回天王令。")
		SetTask(3, 35)
	end
end

end;