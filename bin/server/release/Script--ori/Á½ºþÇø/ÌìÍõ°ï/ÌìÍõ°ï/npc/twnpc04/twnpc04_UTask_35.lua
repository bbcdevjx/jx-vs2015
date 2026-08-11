--description: 天王帮左使古柏30级任务
--author: yuanlan	
--date: 2003/4/25


function twnpc04_UTask_35()

if ( HaveItem("天王令") == 1 ) then		
	Say("古柏：原来天王令是被苗岭燕子洞的一帮山贼偷去了，幸亏找了回来，否则定会被帮主责怪，你可是帮了我一个大忙啊！本使言出必信，定会保举你做掌舵头领！", 1, "多谢左使/ok")
else								--丢失处理	
	Say("系统：真糟糕！你不小心把天王令给弄丢了，如果要完成任务，你必须得有天王令。", 2, "我再找找/find", "重新做这个任务/redo")		
end

end;


function ok()
DelItem("天王令")
SetRank(46)
SetTask(3, 40)
AddMagic(34)
AddMagic(35)
AddMagic(36)
Msg2Player("恭喜你！你已经升为掌舵头领了！")
Msg2Player("学会天王帮武功“惊雷斩”。")
Msg2Player("学会天王帮武功“阳关三叠”。")
Msg2Player("学会天王帮武功“天王战意”。")
end;


function find()
end;


function redo()
Say("系统：请重新在古柏处接受任务。", 0)
SetTask(3, 30)
end;