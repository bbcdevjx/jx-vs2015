--description: 汴京府铁塔二层敌人 天忍教50级任务战斗死亡
--author: yuanlan	
--date: 2003/5/19



function trenemy05_2_UTask_52()

UTask_trsub02 = GetTask(22);

if ( UTask_trsub02 == 0) then	
	if ( HaveItem("铁塔钥匙二") == 0) then	
		i = random(0,1)							--概率为50%
		if (i == 0) then 
			AddEventItem("铁塔钥匙二")
			Msg2Player("得到第二把钥匙。")
		end
	end		
end

end;