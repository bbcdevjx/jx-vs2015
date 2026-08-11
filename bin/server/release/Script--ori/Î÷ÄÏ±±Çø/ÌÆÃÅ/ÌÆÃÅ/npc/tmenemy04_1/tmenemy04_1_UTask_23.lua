--description: 唐门怪石阵敌人1 20级任务战斗死亡
--author: yuanlan	
--date: 2003/3/11



function tmenemy04_1_UTask_23()

if ( HaveItem("怪石阵丝帕一") == 0) then					--没有怪石阵丝帕一
	AddEventItem("怪石阵丝帕一") 
	Msg2Player("得到第一条丝帕，上书“擅”字。")
end;

end;