--description: 七杀洞敌人 天忍教10级任务战斗死亡
--author: yuanlan	
--date: 2003/5/18



function trenemy02_7_UTask_15()

--if ( HaveItem("令牌碎片七") == 0) then				--取消对任务物品有无的判断，以便重做任务
	AddEventItem("令牌碎片七")
	Msg2Player("得到令牌碎片七。")
	if (HaveItem("令牌碎片一") == 1 and HaveItem("令牌碎片二") == 1 and HaveItem("令牌碎片三") == 1 and HaveItem("令牌碎片四") == 1 and HaveItem("令牌碎片五") == 1 and HaveItem("令牌碎片六") == 1) then 		
		SetTask(4, 18)
	end
--end

end;