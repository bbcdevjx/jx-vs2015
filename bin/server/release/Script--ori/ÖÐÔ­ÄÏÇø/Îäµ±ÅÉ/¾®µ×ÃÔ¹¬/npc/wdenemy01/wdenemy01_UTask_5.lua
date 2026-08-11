--description: 武当山 井底迷宫敌人入门任务战斗死亡
--author: yuanlan	
--date: 22003/5/14



function wdenemy01_UTask_5()

--if ( HaveItem("木桶") == 0) then		--取消对任务物品有无的判断，以便重做任务
	AddEventItem("木桶")
	Msg2Player("找到木桶。")
	SetTask(5, 8)	
--end

end;