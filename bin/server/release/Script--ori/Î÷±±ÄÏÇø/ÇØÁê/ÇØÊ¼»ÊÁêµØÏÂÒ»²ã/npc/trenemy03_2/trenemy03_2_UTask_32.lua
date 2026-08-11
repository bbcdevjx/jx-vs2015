--description: 秦陵地下一层敌人 天忍教30级任务战斗死亡
--author: yuanlan	
--date: 2003/5/19



function trenemy03_2_UTask_32()

--if ( HaveItem("冰晶蓝") == 0) then						--取消对任务物品有无的判断，以便重做任务
	AddEventItem("冰晶蓝")
	Msg2Player("得到宝石冰晶蓝。")
	if (HaveItem("鸽血红") == 1 and HaveItem("祖母绿") == 1 and HaveItem("云梦紫") == 1) then 		
		SetTask(4, 35)
	end
--end;

end;






