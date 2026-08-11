--description: 唐门怪石阵敌人3 20级任务战斗死亡
--author: yuanlan	
--date: 2003/3/11



function tmenemy04_3_UTask_23()

if ( HaveItem("怪石阵丝帕三") == 0) then					--没有怪石阵丝帕三
	AddEventItem("怪石阵丝帕三") 
	Msg2Player("得到第三条丝帕，上书“者”字。")
end;

end;