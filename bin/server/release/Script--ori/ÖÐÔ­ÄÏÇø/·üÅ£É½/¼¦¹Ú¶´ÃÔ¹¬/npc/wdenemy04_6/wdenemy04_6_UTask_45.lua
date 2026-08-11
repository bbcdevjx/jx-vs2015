--description: 武当派40级任务 伏牛山鸡冠洞普通怪物 任务战斗死亡
--author: yuanlan	
--date: 22003/5/15



function wdenemy04_6_UTask_45()

--if ( HaveItem("润娘的回信") == 0) then					--取消对任务物品有无的判断，以便重做任务
	i = random(0, 1)							--概率为50%
	if (i == 0) then 
		AddEventItem("润娘的回信")
		Msg2Player("找到润娘的回信。")
		SetTask(5, 48)
	end
--end

end;