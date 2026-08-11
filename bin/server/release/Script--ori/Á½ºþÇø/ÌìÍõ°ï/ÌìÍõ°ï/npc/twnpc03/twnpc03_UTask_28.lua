--description: 天王帮右使杨湖20级任务
--author: yuanlan	
--date: 2003/4/25


function twnpc03_UTask_28()

if ( HaveItem("一面锦旗") == 1 ) then		
	Say("杨湖：你孤身闯匪穴为民除害，做得很好！本座不会看错人，以你的资质，只要再历练一段时间，必会成为小辈中出类拔萃的人物。", 1, "多谢右使/ok")
else								--丢失处理						
	Say("系统：真糟糕！你不小心把锦旗给弄丢了，如果要完成任务，你必须得有锦旗。", 2, "我再找找/find", "重新做这个任务/redo")	
end

end;


function ok()
DelItem("一面锦旗")
SetRank(45)
SetTask(3, 30)
AddMagic(31)
AddMagic(32)
AddMagic(33)
Msg2Player("恭喜你！你已经升为守寨悍将了！")
Msg2Player("学会天王帮武功“行云诀”。")
Msg2Player("学会天王帮武功“无心斩”。")
Msg2Player("学会天王帮武功“静心诀”。")
end;


function find()
end;

function redo()
Say("系统：请重新在杨湖处接受任务。", 0)
SetTask(3, 20)
SetTaskTemp(10, 0)
SetTaskTemp(11, 0)
SetTaskTemp(12, 0)
end;