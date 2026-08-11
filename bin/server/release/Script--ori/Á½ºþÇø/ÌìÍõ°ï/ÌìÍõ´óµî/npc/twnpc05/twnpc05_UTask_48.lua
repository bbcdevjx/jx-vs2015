--description: 天王帮天护法路云远40级任务
--author: yuanlan	
--date: 2003/4/26


function twnpc05_UTask_48()

if (HaveItem("火蜥蜴鳞片") == 1) and (HaveItem("绿毛龟") == 1) then		
	Say("路云远：太好了，有了药引，吴刚就有救了！真多亏了你啊！", 1, "老护法过奖了/ok")
else												--丢失处理
	Say("系统：真糟糕！你不小心把救命的药引给弄丢了，如果要完成任务，你必须得有药引。", 2, "我再找找/find", "重新做这个任务/redo")	
end;

end;


function ok()
DelItem("火蜥蜴鳞片")
DelItem("绿毛龟")
SetRank(47)
SetTask(3, 50)
AddMagic(37)
AddMagic(38)
AddMagic(39)
Msg2Player("恭喜你！你已经升为水道统领了！")
Msg2Player("学会天王帮武功“泼风斩”。")
Msg2Player("学会天王帮武功“盘古九式”。")
Msg2Player("学会天王帮武功“沾衣十八跌”。")
end;


function find()
end;

function redo()
Say("系统：请重新在路云远处接受任务。", 0)
DelItem("莲子")
DelItem("三个鸡蛋")
DelItem("五条蚯蚓")
DelItem("火蜥蜴鳞片")
DelItem("绿毛龟")
SetTask(3, 40)
SetTask(14, 0)	
end;