--description: 唐门出师任务 竹丝洞第一层怪物 战斗死亡
--author: yuanlan	
--date: 2003/3/13



function tmenemy09_1_UTask_62()

if ( HaveItem("钥匙二") == 0) then					--没有钥匙二
	i = random(0,1)							--概率为50%
	if (i == 0) then 
		AddEventItem("钥匙二") 
		Msg2Player("得到钥匙二。")
		SetTask(2, 64)
	end
end;
	
end;


