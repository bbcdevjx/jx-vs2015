--description: 唐门出师任务 竹丝洞第二层怪物 战斗死亡
--author: yuanlan	
--date: 2003/3/13



function tmenemy09_2_UTask_65()

if ( HaveItem("钥匙三") == 0) then					--没有钥匙三
	i = random(0,4)							--概率为20%
	if (i == 0) then 
		AddEventItem("钥匙三") 
		Msg2Player("得到钥匙三。")
		SetTask(2, 66)
	end
end;
	
end;


