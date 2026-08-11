--description: 天忍教右护法耶律辟离40级任务
--author: yuanlan	
--date: 2003/5/19



function trnpc07_UTask_45()

if (HaveItem("天忍密信") == 1) then	
	Talk(2, "select", "玩家：这是属下从廖歧身上搜到的密信。", "右护法耶律辟离：干得漂亮！这次你立了大功，我一定会在教主面前为你美言的！")
else									--丢失处理					
	Say("系统：真糟糕！你不小心把密信弄丢了，这是证明廖歧叛逃的证据，如果要完成任务，你必须得到密信。", 2, "我再找找/find", "重新做这个任务/redo")							
end

end;


function select()
SetRank(59)
DelItem("天忍密信")
SetTask(4, 50)
AddMagic(145)
AddMagic(146)
AddMagic(147)
Msg2Player("恭喜你晋级为天忍教的掌旗使！")
Msg2Player("学会天忍教武功“弹指烈焰”。")
Msg2Player("学会天忍教五行阵。")
Msg2Player("学会天忍教武功“玄冥吸星”。")
end;


function find()
end;


function redo()
Say("系统：请重新在右护法耶律辟离处接受任务。", 0)
Msg2Player("你已选择重新在右护法耶律辟离处接受任务。")
SetTask(4, 40)
end;