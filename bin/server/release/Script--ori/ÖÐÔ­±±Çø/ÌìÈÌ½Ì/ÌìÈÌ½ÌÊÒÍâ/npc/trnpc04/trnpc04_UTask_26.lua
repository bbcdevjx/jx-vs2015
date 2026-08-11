--description: 天忍教小男孩20级任务
--author: yuanlan	
--date: 2003/5/18



function trnpc04_UTask_26()
if ( HaveItem("小黄狗") == 1 and  HaveItem("小灰驴") == 1 ) then	
	Say("小男孩：啊，小黄！小灰！你们太不乖了，下次不许乱跑了！这两个破轮子既不能吃又不能穿，除了好看以外一点用也没有，只有你们这些傻瓜才把它当成宝贝，还给你吧！", 1, "多谢小弟弟/ok")
return
end;

if ( HaveItem("小黄狗") == 0 and  HaveItem("小灰驴") == 1 ) then	
	Say("系统：真糟糕！你不小心把小黄狗弄丢了，如果要换回日月双轮，你必须得到小黄狗。", 2, "我再找找/find", "重新寻找小黄狗/redo1")	
return
end

if ( HaveItem("小黄狗") == 1 and  HaveItem("小灰驴") == 0 ) then	
	Say("系统：真糟糕！你不小心把小灰驴弄丢了，如果要换回日月双轮，你必须得到小灰驴。", 2, "我再找找/find", "重新寻找小灰驴/redo2")	
return
end

if ( HaveItem("小黄狗") == 0 and  HaveItem("小灰驴") == 0 ) then	
	Say("系统：真糟糕！你不小心把小黄狗和小灰驴弄丢了，如果要换回日月双轮，你必须得到小黄狗和小灰驴。", 2, "我再找找/find", "重新寻找小黄狗和小灰驴/redo3")	
return
end

end;



function ok()
DelItem("小黄狗")
DelItem("小灰驴")
AddEventItem("日月双轮")
Msg2Player("得到日月双轮。")
SetTask(4, 28)
end;


function find()
end;


function redo1()
Say("系统：请重新在去寻找小黄狗。", 0)
Msg2Player("你已选择重新寻找小黄狗。")
SetTask(4, 25)
end;


function redo2()
Say("系统：请重新在去寻找小灰驴。", 0)
Msg2Player("你已选择重新寻找小灰驴。")
SetTask(4, 25)
end;


function redo3()
Say("系统：请重新在去寻找小黄狗和小灰驴。", 0)
Msg2Player("你已选择重新寻找小黄狗和小灰驴。")
SetTask(4, 25)
end;