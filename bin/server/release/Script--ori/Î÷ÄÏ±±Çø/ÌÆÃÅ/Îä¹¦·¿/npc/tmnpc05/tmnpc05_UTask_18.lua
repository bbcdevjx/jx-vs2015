--description: 唐门唐鹤 10级任务
--author: yuanlan	
--date: 2003/3/10



function tmnpc05_UTask_18()

if ( HaveItem("魔雨针") == 1) then
	Say("唐鹤：你果然有些本事，能帮本座找回魔雨针，好，本座就教你几招，看好了！", 1, "多谢长老/ok")
else
	Say("系统：真糟糕！你不小心把魔雨针给弄丢了，如果要完成此任务，你必须得到魔雨针。", 2, "我再找找/find", "重新做这个任务/redo")
end;

end;


function ok()
DelItem("魔雨针")
SetRank(26)
SetTask(2, 20)
AddMagic(43)
AddMagic(44)
--AddMagic(46)
Msg2Player("恭喜你！你已升为唐门庄丁！")
Msg2Player("学会唐门暗器。")
Msg2Player("学会唐门刀法。")
end;	


function find()
end;

function redo()
Say("系统：请重新在唐鹤处接受任务。", 0)
SetTask(2, 10)	
end;