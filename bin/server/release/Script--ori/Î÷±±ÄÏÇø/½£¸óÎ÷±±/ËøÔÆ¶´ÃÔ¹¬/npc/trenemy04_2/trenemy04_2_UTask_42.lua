--description: 剑阁蜀道锁云洞敌人 天忍教40级任务战斗死亡
--author: yuanlan	
--date: 2003/5/19



function trenemy04_2_UTask_42()

--if (HaveItem("天忍密信") == 0) then						--取消对任务物品有无的判断，以便重做任务
	AddEventItem("天忍密信")
	Msg2Player("抓到易容的廖歧，从他身上搜到一封写给宋廷的密信。")
	SetTask(4, 45)
--end;

end;