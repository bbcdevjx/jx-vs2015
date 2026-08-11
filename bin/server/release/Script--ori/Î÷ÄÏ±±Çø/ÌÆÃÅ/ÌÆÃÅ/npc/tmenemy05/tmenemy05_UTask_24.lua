--description: 唐门翡翠湖敌人 20级任务战斗死亡
--author: yuanlan	
--date: 2003/3/11



function tmenemy05_UTask_24()

if ( HaveItem("金项圈") == 0) then					--没有金项圈
	i = random(0,1)							--概率为50%
	if (i == 0) then 
		AddEventItem("金项圈") 
		Msg2Player("得到金项圈。")
	end;
end;

end;