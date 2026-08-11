--description: 天王帮 天王岛山洞敌人10级任务战斗死亡
--author: yuanlan	
--date: 2003/4/24



function twenemy01_UTask_12()

--i = random(0,1)							--概率为50%
--if (i == 0) then 
	AddEventItem("鸡血石")
	Msg2Player("得到鸡血石一块。")
	if ( GetItemCount("鸡血石") == 3 ) then			--鸡血石数目为3
		SetTask(3, 15)
	end
--end

end;