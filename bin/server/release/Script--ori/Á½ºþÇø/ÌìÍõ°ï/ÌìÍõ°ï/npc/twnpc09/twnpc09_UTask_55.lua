--description: 天王帮地护法夏诚50级任务
--author: yuanlan	
--date: 2003/4/28


function twnpc09_UTask_55()

if ( HaveItem("五彩石") == 1 ) then		
	Say("夏诚：原来使湖面上泛出五彩光芒的是这块石头，而不是水怪！这块五彩石不仅可以安定人心，还可以为本帮带来福祉。真是天佑本帮啊！", 1, "但愿天佑本帮/ok")
else									--丢失处理					
	Say("系统：真糟糕！你不小心把那坛五彩石给弄丢了，如果要完成任务，你必须得有五彩石。", 2, "我再找找/find", "重新做这个任务/redo")
end

end;


function ok()
DelItem("五彩石")
SetRank(48)
SetTask(3, 60)
AddMagic(40)
AddMagic(41)
AddMagic(42)
Msg2Player("恭喜你！你已经升为护岛将军了！")
Msg2Player("学会天王帮武功“断魂刺”。")
Msg2Player("学会天王帮武功“血战八方”。")
Msg2Player("学会天王帮武功“金钟罩”。")
end;

function find()
end;

function redo()
Say("系统：请重新在夏诚处接受任务。", 0)
SetTask(3, 50)	
end;