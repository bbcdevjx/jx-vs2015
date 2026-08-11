--description: 唐门竹海第一关敌人 任务战斗死亡
--author: yuanlan	
--date: 2003/3/10



function tmenemy01_UTask_2()

if ( HaveItem("青色竹杖") == 0) then					--没有青色竹杖
	AddEventItem("青色竹杖") 
	Msg2Player("得到青色竹杖。")
end;

end;