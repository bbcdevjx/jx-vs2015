--description: 天忍教日月坛主20级任务
--author: yuanlan	
--date: 2003/5/18



function trnpc03_UTask_28()

if ( HaveItem("日月双轮") == 1 ) then	
	Say("乌合萨：你帮我要回日月双轮，简直就是我的救命恩人啊！不不不，你简直就是我的再生父母！", 1, "不客气不客气/ok")
else								--丢失处理						
	Say("系统：真糟糕！你不小心把日月双轮弄丢了，如果要完成任务，你必须得到日月双轮。", 2, "我再找找/find", "重新做这个任务/redo")
end

end;


function ok()
SetRank(57)
DelItem("日月双轮")
SetTask(4, 30)
AddMagic(138)
AddMagic(139)
AddMagic(140)
Msg2Player("你已经晋级为天忍教的死士！")
Msg2Player("学会天忍教武功“推山填海”。")
Msg2Player("学会天忍教武功“浑水摸鱼”。")
Msg2Player("学会天忍教武功“飞鸿无迹”。")
end;


function find()
end;


function redo()
Say("系统：请重新在日月坛主乌合萨处接受任务。", 0)
Msg2Player("你已选择重新在日月坛主乌合萨处接受任务。")
SetTask(4, 20)
end;