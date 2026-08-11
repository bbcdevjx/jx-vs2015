--description: 唐门50级任务 青城山响水洞怪物 战斗死亡
--author: yuanlan	
--date: 2003/3/12



function tmenemy08_3_UTask_58()

if ( HaveItem("暗器谱") == 0) then					--没有暗器谱
	i = random(0,2)							--概率为33%
	if (i == 0) then 
		AddEventItem("暗器谱") 
		Msg2Player("得到暗器谱。")
	end
end;
	
end;


