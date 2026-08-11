--description: 武当派道一真人40级任务
--author: yuanlan	
--date: 2003/5/15



function wdnpc02_UTask_48()

if ( HaveItem("润娘的回信") == 1) then					--有润娘的回信
	Talk(3, "select", "玩家：师父，弟子代周师兄去了一趟伏牛山，把信交给了润娘，这是她的回信。", "道一真人：原来如此……这件事情你不要对旁人谈起，记住了吗？", "玩家：弟子明白！")
else									--丢失处理
	Say("系统：真糟糕！你不小心把润娘的回信给弄丢了，如果要完成任务，你必须有润娘的回信。", 2, "我再找找/find", "重新做这个任务/redo")	

end;

end;


function select()
DelItem("润娘的回信")
SetRank(11)
SetTask(5, 50)
AddMagic(161)
AddMagic(162)
--AddMagic(163)
Msg2Player("恭喜你升为入观道人！")
Msg2Player("学会武当派武功“两仪心法”。")
Msg2Player("学会武当派武功“玄一无象”。")
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