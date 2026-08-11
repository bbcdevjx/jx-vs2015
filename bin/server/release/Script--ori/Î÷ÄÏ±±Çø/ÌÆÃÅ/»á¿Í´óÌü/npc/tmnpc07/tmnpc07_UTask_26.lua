--description: 唐门唐仇 20级任务
--author: yuanlan	
--date: 2003/3/11



function tmnpc07_UTask_26()

if (HaveItem("金项圈") == 1) then
	Talk(5, "select", "唐仇：这不是幽妹妹的金项圈吗？怎么、怎么会在你这里？", "玩家：这是师姑叫我交给掌门的，她已经原谅掌门了。", "唐仇：幽妹妹她真的原谅我了？她真的愿意回家了？是你说服她的吗？", "玩家：这件事是大师兄安排的，弟子并没有做什么。", "唐仇：不管怎么说，你帮为师解开了这辈子最大的心结，功劳不小，为师绝不会亏待你。")
else											--丢失处理
	Say("系统：真糟糕！你不小心把金项圈给弄丢了，如果要完成此任务，你必须得到金项圈。", 2, "我再找找/find", "重新做这个任务/redo")
end;
	
end;


function select()
DelItem("金项圈")
SetRank(27)	
SetTask(2, 30)
AddMagic(47)
AddMagic(48)
--AddMagic(49)
Msg2Player("恭喜你！你已升为唐门护院！")
Msg2Player("学会唐门夺魂镖。")
Msg2Player("学会唐门武功“心眼”。")
end;
	

function find()
end;

function redo()
Say("系统：请重新在议事大厅唐一尘处接受任务。", 0)
SetTask(2, 20)
end;
