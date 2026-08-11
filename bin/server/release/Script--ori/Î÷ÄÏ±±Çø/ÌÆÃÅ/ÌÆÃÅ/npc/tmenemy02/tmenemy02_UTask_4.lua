--description: 唐门竹海第二关敌人 任务战斗死亡
--author: yuanlan	
--date: 2003/3/10



function tmenemy02_UTask_4()

if ( HaveItem(34) == 0) then					--没有白色竹杖
	i = random(0,4)							
	if (i == 0) then Say(10827 , 0) end;
	if (i == 1) then Say(10828 , 0) end;
	if (i == 2) then Say(10829 , 0) end;
	if (i == 3) then Say(10830 , 0) end;
	if (i == 4) then Say(10831 , 0) end;
end;

end;
