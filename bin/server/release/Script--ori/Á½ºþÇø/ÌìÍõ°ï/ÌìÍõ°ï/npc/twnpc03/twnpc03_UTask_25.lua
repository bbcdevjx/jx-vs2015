--description: 天王帮右使杨湖20级任务
--author: yuanlan	
--date: 2003/4/25


function twnpc03_UTask_25()

if ( HaveItem(92) == 1 ) then		
	Say(11697 , 0)
	DelItem(92)
	SetRank(45)
	SetTask(3, 30)
	AddMagic(31)
	AddMagic(32)
	AddMagic(33)
	Msg2Player("恭喜你！你已经升为守寨悍将了！")
	Msg2Player("学会天王帮武功“行云诀”。")
	Msg2Player("学会天王帮武功“无心斩”。")
	Msg2Player("学会天王帮武功“静心诀”。")
else								
	Say(11698 , 0)
end

end;
