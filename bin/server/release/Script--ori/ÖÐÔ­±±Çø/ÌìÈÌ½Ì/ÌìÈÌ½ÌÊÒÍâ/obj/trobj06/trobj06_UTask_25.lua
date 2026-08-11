--description: 天忍教20级任务 小灰驴
--author: yuanlan	
--date: 2003/5/18



function trobj06_UTask_25()

--if ( HaveItem("小灰驴") == 0) then					--取消对任务物品有无的判断，以便重做任务
	SetPropState()
	AddEventItem("小灰驴")
	Msg2Player("找到丢失的小灰驴。")
	if ( HaveItem("小黄狗") == 1 ) then 		
		SetTask(4, 26)
	end
--end

end;