--description: 武当派道一真人出师任务
--author: yuanlan	
--date: 2003/5/17



function wdnpc02_UTask_65()

if ( HaveItem("玉清真经") == 1 and HaveItem("上清真经") == 1 and HaveItem("太清真经") == 1) then			
	Talk(2, "select", "道一真人：能够忧天下之忧者，方当得起一个“侠”字。如今正逢乱世，瘟疫、战乱、暴政，百姓苦不堪言，倘若你能以天下为念，以所学技艺造福百姓，为师也就老怀欣慰了。", "恭喜你艺成出师！你已被封为武当派的玄武神侍，从今以后可以自由行走江湖啦！你可以选择加入别的门派继续学艺，也可以去创建帮会扩展自己的江湖势力，又或者做一个独行剑客也不错啊！剑侠江湖，天高海阔，希望你能大展拳脚，一展鸿图！")
return
end;	

if ( HaveItem("玉清真经") == 0 and HaveItem("上清真经") == 0 and HaveItem("太清真经") == 0) then
	Say("系统：真糟糕！你不小心把三本真经都弄丢了，如果要完成任务，你必须有三本真经。", 2, "我再找找/find", "重新做出师任务/redo1")	
return	
end;

if ( HaveItem("玉清真经") == 0 and HaveItem("上清真经") == 0 and HaveItem("太清真经") == 1) then
	Say("系统：真糟糕！你不小心把《玉清真经》和《上清真经》弄丢了，如果要完成任务，你必须有三本真经。", 2, "我再找找/find", "重新做相关子任务/redo2")
return	
end;

if ( HaveItem("玉清真经") == 0 and HaveItem("上清真经") == 1 and HaveItem("太清真经") == 0) then
	Say("系统：真糟糕！你不小心把《玉清真经》和《太清真经》弄丢了，如果要完成任务，你必须有三本真经。", 2, "我再找找/find", "重新做相关子任务/redo3")
return	
end;

if ( HaveItem("玉清真经") == 1 and HaveItem("上清真经") == 0 and HaveItem("太清真经") == 0) then
	Say("系统：真糟糕！你不小心把《上清真经》和《太清真经》弄丢了，如果要完成任务，你必须有三本真经。", 2, "我再找找/find", "重新做相关子任务/redo4")
return	
end;

if ( HaveItem("玉清真经") == 0 and HaveItem("上清真经") == 1 and HaveItem("太清真经") == 1) then
	Say("系统：真糟糕！你不小心把《玉清真经》弄丢了，如果要完成任务，你必须有三本真经。", 2, "我再找找/find", "重新做相关子任务/redo5")
return	
end;

if ( HaveItem("玉清真经") == 1 and HaveItem("上清真经") == 0 and HaveItem("太清真经") == 1) then
	Say("系统：真糟糕！你不小心把《上清真经》弄丢了，如果要完成任务，你必须有三本真经。", 2, "我再找找/find", "重新做相关子任务/redo6")
return	
end;

if ( HaveItem("玉清真经") == 1 and HaveItem("上清真经") == 1 and HaveItem("太清真经") == 0) then
	Say("系统：真糟糕！你不小心把《太清真经》弄丢了，如果要完成任务，你必须有三本真经。", 2, "我再找找/find", "重新做相关子任务/redo7")
return	
end;


end;


function select()
DelItem("玉清真经")
DelItem("上清真经")
DelItem("太清真经")
Msg2Player("恭喜你艺成出师！你已被封为武当派的玄武神侍！")
SetRank(63)
SetTask(5, 70)
SetFaction("")	
SetCamp(4)
SetCurCamp(4)
end;


function find()
end;


function redo1()
Say("系统：请重新在掌门道一真人处接任务。", 0)
Msg2Player("你已选择重新在掌门道一真人处接任务。")
SetTask(5, 60)
SetTask(17, 0)
SetTask(18, 0)	
SetTask(19, 0)
end;


function redo2()
Say("系统：请重新点击太子岩上的宝箱，做《玉清真经》和《上清真经》的相关子任务。", 0)
Msg2Player("你已选择重新做《玉清真经》和《上清真经》的相关子任务。")
SetTask(5, 62)
SetTask(17, 0)
SetTask(18, 0)	
end;


function redo3()
Say("系统：请重新点击太子岩上的宝箱，做《玉清真经》和《太清真经》的相关子任务。", 0)
Msg2Player("你已选择重新做《玉清真经》和《太清真经》的相关子任务。")
SetTask(5, 62)
SetTask(17, 0)
SetTask(19, 0)	
end;


function redo4()
Say("系统：请重新点击太子岩上的宝箱，做《上清真经》和《太清真经》的相关子任务。", 0)
Msg2Player("你已选择重新做《上清真经》和《太清真经》的相关子任务。")
SetTask(5, 62)
SetTask(18, 0)
SetTask(19, 0)	
end;


function redo5()
Say("系统：请重新点击太子岩上的宝箱，做《玉清真经》的相关子任务。", 0)
Msg2Player("你已选择重新做《玉清真经》的相关子任务。")
SetTask(5, 62)
SetTask(17, 0)
end;


function redo6()
Say("系统：请重新点击太子岩上的宝箱，做《上清真经》的相关子任务。", 0)
Msg2Player("你已选择重新做《上清真经》的相关子任务。")
SetTask(5, 62)
SetTask(18, 0)
end;


function redo7()
Say("系统：请重新点击太子岩上的宝箱，做《太清真经》的相关子任务。", 0)
Msg2Player("你已选择重新做《太清真经》的相关子任务。")
SetTask(5, 62)
SetTask(19, 0)
end;