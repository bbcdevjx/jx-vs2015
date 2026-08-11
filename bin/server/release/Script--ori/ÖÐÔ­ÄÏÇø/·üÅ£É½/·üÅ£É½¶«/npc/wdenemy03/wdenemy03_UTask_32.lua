--description: 伏牛山东敌人武当派30级任务战斗死亡
--author: yuanlan	
--date: 22003/5/15



function wdenemy03_UTask_32()

AddEventItem("画眉草")
Msg2Player("得到一株画眉草。")
if ( GetItemCount("画眉草") == 5 ) then			--画眉草数目为5
	SetTask(5, 35)
end

end;