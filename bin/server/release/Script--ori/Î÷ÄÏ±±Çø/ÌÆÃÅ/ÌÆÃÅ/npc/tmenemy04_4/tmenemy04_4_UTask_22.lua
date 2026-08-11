--description: 唐门怪石阵敌人4 20级任务战斗死亡
--author: yuanlan	
--date: 2003/3/11



function tmenemy04_4_UTask_22()

if ( HaveItem("怪石阵丝帕四") == 0) then					--没有怪石阵丝帕四
	AddEventItem("怪石阵丝帕四") 
	Msg2Player("得到第四条丝帕。")
end;

end;
