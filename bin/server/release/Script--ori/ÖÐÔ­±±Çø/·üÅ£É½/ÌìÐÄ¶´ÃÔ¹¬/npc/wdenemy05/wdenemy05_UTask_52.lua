--description: 伏牛山 天心洞迷宫敌人50级任务战斗死亡
--author: yuanlan	
--date: 22003/5/16



function wdenemy05_UTask_52()

UTask_wdsub05 = GetTask(20);

if ( UTask_wdsub05 == 0) then						--是否第一次得到银两
	i = random(0,1)							--概率为50%
	if (i == 0) then 
		Earn(10000)
		Msg2Player("打败盗匪头目铁棘，得到盗匪们打劫来的一万两银子。")
		SetTask(20, 1)
		SetTask(5, 55)
	end
end

end;