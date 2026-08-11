--description: 天王帮 洞庭湖底第2层敌人50级任务战斗死亡
--author: yuanlan	
--date: 2003/4/28



function twenemy05_UTask_52()

if ( HaveItem("五彩石") == 0) then	
	i = random(0,2)							--概率为30%
	if (i == 0) then 
		AddEventItem("五彩石")
		Msg2Player("打败水怪，得到一块象征幸福保佑平安的五彩石。")
		SetTask(3, 55)
	end
end;	

end;