--description: 天忍教风堂堂主完颜雪衣30级任务
--author: yuanlan	
--date: 2003/5/19



function trnpc05_UTask_35()

if ( HaveItem("鸽血红") == 1 and  HaveItem("冰晶蓝") == 1 and HaveItem("祖母绿") == 1 and HaveItem("云梦紫") == 1 ) then
	Say("风堂堂主完颜雪衣：你真能干，这么名贵的宝石都被你找到了！母后一定会喜欢这件金缕玉衣的！", 1, "堂主所托属下理应尽力/ok")	
else								--丢失处理					
	Say("系统：真糟糕！你不小心把宝石给弄丢了，如果要完成任务，你必须得到四种宝石，缺一不可。", 2, "我再找找/find", "重新做这个任务/redo")	
end

end;


function ok()
SetRank(58)
DelItem("鸽血红")
DelItem("冰晶蓝")
DelItem("祖母绿")
DelItem("云梦紫")
SetTask(4, 40)
AddMagic(141)
AddMagic(142)
AddMagic(143)
AddMagic(144)
Msg2Player("佩服佩服！你已经晋级为天忍教的幽冥死士！")
Msg2Player("学会天忍教武功“烈火情天”。")
Msg2Player("学会天忍教武功“偷天换日”。")
Msg2Player("学会天忍教武功“厉魔夺魂”。")
Msg2Player("学会天忍教武功“明尊本生”。")
end;


function find()
end;


function redo()
Say("系统：请重新在风堂堂主完颜雪衣处接受任务。", 0)
Msg2Player("你已选择重新在风堂堂主完颜雪衣处接受任务。")
SetTask(4, 30)
DelItem("鸽血红")
DelItem("冰晶蓝")
DelItem("祖母绿")
DelItem("云梦紫")
end;