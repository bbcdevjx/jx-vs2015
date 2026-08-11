--description: 汴京府铁塔一层敌人 天忍教50级任务战斗死亡
--author: yuanlan	
--date: 2003/5/19



function trenemy05_1_UTask_52()

UTask_trsub01 = GetTask(21);

if ( UTask_trsub01 == 0) then	
	if ( HaveItem("铁塔钥匙一") == 0) then	
		AddEventItem("铁塔钥匙一")
		Msg2Player("得到第一把钥匙。")
	end		
end

end;