--description: 唐门怪石阵敌人2 20级任务战斗死亡
--author: yuanlan	
--date: 2003/3/11



function tmenemy04_2_UTask_22()

if ( HaveItem("怪石阵丝帕二") == 0) then					--没有怪石阵丝帕二
	AddEventItem("怪石阵丝帕二") 
	Msg2Player("得到第二条丝帕。")
end;

end;
