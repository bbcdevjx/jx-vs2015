--description: 青螺岛敌人出师任务战斗死亡
--author: yuanlan	
--date: 2003/4/28



function twenemy06_1_UTask_62()	

if ( HaveItem("天王帮钥匙") == 0) then	
	i = random(0,1)							--概率为50%
	if (i == 0) then 
		AddEventItem("天王帮钥匙")
		Msg2Player("得到一把钥匙。")
	end
end;	

end;