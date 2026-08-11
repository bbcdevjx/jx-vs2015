--description: 天王帮众入门任务
--author: yuanlan	
--date: 2003/4/24



function twnpc01_UTask_8()

if ( HaveItem("蓬莱春") == 1) then					--有蓬莱春
	Say("孙道领：蓬莱春！未启封泥就已香气扑鼻，果然是好酒！哈哈哈哈！看来你也是个性情中人，大家就一起闯荡江湖吧！", 1, "请大哥多关照/ok")
else									--丢失蓬莱春
	Say("系统：真糟糕！你不小心把那坛蓬莱春给弄丢了，如果要完成任务，你必须得有蓬莱春。", 2, "我再找找/find", "重新做这个任务/redo")	
end

end;


function ok()
DelItem("蓬莱春")
SetFaction("天王帮")    			
SetCamp(3)
SetCurCamp(3)
AddMagic(29)
SetRank(43)
SetRevPos(21)  							--设置重生点
SetTask(3, 10)
Msg2Player("欢迎你加入天王帮，先从一个小小的侍卫做起吧！")
Msg2Player("学会天王帮武功“斩龙诀”。")
end;


function find()
end;

function redo()
Say("系统：请重新在孙道领处接受任务。", 0)
SetTask(3, 0)	
SetTask(13, 0)
end;