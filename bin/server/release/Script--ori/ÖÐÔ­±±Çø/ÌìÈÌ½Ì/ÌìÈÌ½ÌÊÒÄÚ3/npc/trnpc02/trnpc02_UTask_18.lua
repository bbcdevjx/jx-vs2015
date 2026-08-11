--description: 天忍教火堂堂主10级任务
--author: yuanlan	
--date: 2003/5/18



function trnpc02_UTask_18()

if ( HaveItem("令牌碎片一") == 1 and  HaveItem("令牌碎片二") == 1 and HaveItem("令牌碎片三") == 1 and HaveItem("令牌碎片四") == 1 and HaveItem("令牌碎片五") == 1 and HaveItem("令牌碎片六") == 1 and HaveItem("令牌碎片七") == 1) then	
	Say("火堂堂主兀敖：很好，七块碎片，一块也不少，你倒是有些本事，看来本堂主之前小瞧了你！", 1, "还请堂主多指教/ok")
else									
	Say("系统：真糟糕！你不小心把七块碎片给弄丢了，如果要完成任务，你必须得到七块碎片，缺一不可。", 2, "我再找找/find", "重新做这个任务/redo")	
end

end;


function ok()
DelItem("令牌碎片一")
DelItem("令牌碎片二")
DelItem("令牌碎片三")
DelItem("令牌碎片四")
DelItem("令牌碎片五")
DelItem("令牌碎片六")
DelItem("令牌碎片七")
SetTask(4, 20)
SetRank(56)
AddMagic(131)
AddMagic(132)
--AddMagic(133)
AddMagic(134)
AddMagic(136)
AddMagic(137)
Msg2Player("你已经晋级为天忍教的无影杀手！")
Msg2Player("学会天忍刀法。")
Msg2Player("学会天忍矛法。")
Msg2Player("学会天忍锤法。")
Msg2Player("学会天忍教武功“火莲焚华”。")
Msg2Player("学会天忍教武功“幻影飞狐”。")
end;


function find()
end;


function redo()
Say("系统：请重新在火堂堂主兀敖处接受任务。", 0)
Msg2Player("你已选择重新在火堂堂主兀敖处接受任务。")
SetTask(4, 10)
DelItem("令牌碎片一")
DelItem("令牌碎片二")
DelItem("令牌碎片三")
DelItem("令牌碎片四")
DelItem("令牌碎片五")
DelItem("令牌碎片六")
DelItem("令牌碎片七")
end;