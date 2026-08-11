--description: 武当派周云泉40级任务
--author: yuanlan	
--date: 2003/5/15



function wdnpc06_UTask_48()

if ( HaveItem("润娘的回信") == 1) then					--有润娘的回信
	Talk(2, "", "玩家：周师兄，信我已经替你送到，这是润娘的回信。", "周云泉：辛苦你了，这封回信你去交给掌门吧！")
else									--丢失处理
	Say("系统：真糟糕！你不小心把润娘的回信给弄丢了，如果要完成任务，你必须有润娘的回信。", 2, "我再找找/find", "重新做这个任务/redo")	
end;

end;


function find()
end;


function redo()
Say("系统：请重新在周云泉处接任务。", 0)
Msg2Player("你已选择重新在周云泉处接任务。")
SetTask(5, 40)
SetTaskTemp(16, 0)
SetTaskTemp(17, 0)
SetTaskTemp(18, 0)
SetTaskTemp(19, 0)
SetTaskTemp(20, 0)
end;