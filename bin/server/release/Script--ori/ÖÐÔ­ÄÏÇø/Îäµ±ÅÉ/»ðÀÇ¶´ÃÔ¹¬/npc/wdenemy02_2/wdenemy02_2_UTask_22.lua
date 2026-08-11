--description: 武当山 火狼洞迷宫敌人20级任务战斗死亡
--author: yuanlan	
--date: 22003/5/14



function wdenemy02_2_UTask_25()

--if ( HaveItem("天蚕") == 0) then					--取消对任务物品有无的判断，以便重做任务
	AddEventItem("天蚕")
	Msg2Player("救出一个被恶狼叼来的采桑男孩，他送给你一只天蚕以作感激。")
	if ( HaveItem("残破的天蚕道袍") == 1) then 			--得到天蚕后，判断有没有残破的天蚕道袍
		SetTask(5, 25)	
	end		
--end

end;