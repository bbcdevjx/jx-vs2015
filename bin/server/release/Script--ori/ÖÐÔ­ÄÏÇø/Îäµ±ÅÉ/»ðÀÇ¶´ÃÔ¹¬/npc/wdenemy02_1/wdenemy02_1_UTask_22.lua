--description: 武当山 火狼洞迷宫敌人20级任务战斗死亡
--author: yuanlan	
--date: 22003/5/14



function wdenemy02_1_UTask_22()

--if ( HaveItem("残破的天蚕道袍") == 0) then			--取消对任务物品有无的判断，以便重做任务
	AddEventItem("残破的天蚕道袍")
	Msg2Player("找到残破的天蚕道袍。")
	SetTask(5, 23)	
--end

end;