--description: 武当派姚石门20级任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc04_UTask_28()

if ( HaveItem("补好的天蚕道袍") == 0) then					
	Say("姚石门：修补好的天蚕道袍！太好了，真是谢谢你！", 1, "不客气/ok1")
else
	Say("系统：真糟糕！你不小心把修补好的天蚕道袍给弄丢了，如果要完成任务，你必须得到完好无损的天蚕道袍。", 2, "我再找找/find1", "重新做这个任务/redo1")	
end;

end;


function ok1()
DelItem("补好的天蚕道袍")
SetRank(9)
SetTask(5, 30)
AddMagic(155)
AddMagic(156)
AddMagic(157)
Msg2Player("恭喜你！你已经升为了清修道人！")
Msg2Player("学会武当派武功“沧海明月”。")
Msg2Player("学会武当派武功“纯阳心法”。")
Msg2Player("学会武当派武功“坐忘无我”。")
end;


function find1()
end;

function redo1()
Say("系统：请重新在姚石门处接任务。", 0)
Msg2Player("你已选择重新在姚石门处接任务。")
SetTask(5, 20)
end;	