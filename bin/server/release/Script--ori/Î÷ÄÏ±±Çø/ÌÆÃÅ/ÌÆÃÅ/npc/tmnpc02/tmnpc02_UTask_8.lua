--description: 唐门普通弟子 竹海三关出口 入门任务
--author: yuanlan	
--date: 2003/3/10



function tmnpc02_UTask_8()

if ( HaveItem("青色竹杖") == 1) and ( HaveItem("白色竹杖") == 1) and ( HaveItem("紫色竹杖") == 1) then
	Say("唐门庄丁：你已经顺利通关，大家以后就是同门兄弟了！", 1, "见过师兄/ok")
return	
end;

if ( HaveItem("青色竹杖") == 0) then
	Say("系统：真糟糕！你不小心把青色竹杖给弄丢了，如果要通过竹海三关，你必须得到青色竹杖，否则只能重新过关。", 2, "我再找找/find", "重新闯竹海三关/redo1")
return		
end;

if ( HaveItem("白色竹杖") == 0) then
	Say("系统：真糟糕！你不小心把白色竹杖给弄丢了，如果要通过竹海三关，你必须得到白色竹杖，否则只能重新过关。", 2, "我再找找/find", "重新闯竹海三关/redo2")
return		
end;

if ( HaveItem("紫色竹杖") == 0) then
	Say("系统：真糟糕！你不小心把紫色竹杖给弄丢了，如果要通过竹海三关，你必须得到紫色竹杖，否则只能重新过关。", 2, "我再找找/find", "重新闯竹海三关/redo3")
return		
end;

end;


function ok()
DelItem("青色竹杖")	
DelItem("白色竹杖")
DelItem("紫色竹杖")
SetFaction("唐门")				
SetRank(25)
SetCamp(3)
SetCurCamp(3)
AddMagic(45)
--SetPos(3840, 5422)							--把玩家传送出迷宫
SetRevPos(15)								--设置重生点
SetTask(2, 10)	
Msg2Player("恭喜你加入唐门，先从杂役做起吧！")
Msg2Player("学会唐门特技“霹雳弹”。")
end;


function find()
end;

function redo1()
Say("系统：请重新在竹海三关入口处接受任务。", 0)
Msg2Player("任务失败，请重新在竹海三关入口处接受任务。")
DelItem("白色竹杖")
DelItem("紫色竹杖")
SetTask(2, 0)
end;

function redo2()
Say("系统：请重新在竹海三关入口处接受任务。", 0)
Msg2Player("任务失败，请重新在竹海三关入口处接受任务。")
DelItem("青色竹杖")
DelItem("紫色竹杖")
SetTask(2, 0)
end;

function redo3()
Say("系统：请重新在竹海三关入口处接受任务。", 0)
Msg2Player("任务失败，请重新在竹海三关入口处接受任务。")
DelItem("青色竹杖")
DelItem("白色竹杖")
SetTask(2, 0)
end;