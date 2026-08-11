--description: 武当派小道士清风入门任务
--author: yuanlan	
--date: 2003/5/14



function wdnpc01_UTask_8()

if ( HaveItem("木桶") == 1) then					--有木桶
	DelItem("木桶")
	Say("小道士清风：谢谢你帮我捡回木桶！看你的样子不像是本地人，你来武当山是为了拜师学艺，还是为了游玩啊？", 2, "拜师学艺/yes1", "随便逛逛/no1")
else										--丢失处理
	Say("系统：真糟糕！你不小心把捡回来的木桶给弄丢了，如果要完成任务，你必须得有木桶。", 2, "我再找找/find", "重新做这个任务/redo")		
end

end;

function yes1()
Say("小道士清风：哈哈哈，那你找我就对了，我在这里站了好久，你是少数几个愿意帮我捡回木桶的人，你已经通过了本派的入门考验啦！", 1, "日后还望多多关照/ok");
end;


function no1()
Say("小道士清风：原来你也是来玩儿的啊？我给你介绍介绍武当山吧！武当山北通秦岭，南接巴山，连绵起伏，纵横百里，七十二峰，山势各异，雄奇俊伟，每年来这里游玩的人可多啦！本山供奉的是道家最高尊神真武大帝，“非真武不足以当此山”，因此叫做武当山。", 0);
SetTask(5, 9)
end;	


function ok()
SetFaction("武当派")    			
SetCamp(1)
SetCurCamp(1)
SetRank(7)					
AddMagic(153)
SetRevPos(40)  								--设置重生点
SetTask(5, 10)
Msg2Player("欢迎你加入武当派，先从道童做起吧！")
Msg2Player("学会武当派武功“怒雷指”。")
end;


function find()
end;

function redo()
Say("系统：请重新在小道士清风处接受任务。", 0)
Msg2Player("你已选择重做任务，请重新在小道士清风处接受任务。")
SetTask(5, 0)
end;