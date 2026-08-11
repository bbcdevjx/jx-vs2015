--description: 汴京府铁塔三层敌人 天忍教50级任务战斗死亡
--author: yuanlan	
--date: 2003/5/19



function trenemy05_3_UTask_52()

UTask_trsub03 = GetTask(23);

if ( UTask_trsub03 == 0) then	
	if ( HaveItem("铁塔钥匙三") == 0) then	
		i = random(0,2)							--概率为30%
		if (i == 0) then 
			AddEventItem("铁塔钥匙三")
			Msg2Player("得到第三把钥匙。")
		end
	end		
end

end;