--description: 华山敌人 天忍教入门任务战斗死亡
--author: yuanlan	
--date: 2003/5/17



function trenemy01_2_UTask_5()

--if ( HaveItem("禹王剑") == 0) then			--取消对任务物品有无的判断，以便重做任务
	AddEventItem("禹王剑")
	Msg2Player("得到禹王剑。")
	SetTask(4, 8)
--end

end;