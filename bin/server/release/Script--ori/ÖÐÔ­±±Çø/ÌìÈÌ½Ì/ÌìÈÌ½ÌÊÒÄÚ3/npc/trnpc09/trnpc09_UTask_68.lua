--description: 天忍教教主完颜宏烈出师任务
--author: yuanlan	
--date: 2003/5/19



function trnpc09_UTask_68()

if (HaveItem("羊皮书") == 1) then	
	Talk(2, "select", "教主完颜宏烈：这果然就是本教的圣书！好！好！老夫不会看错人，以你目前的武功和胆识，假以时日，必会有一番惊天动地的大作为！希望你出师以后，不会成为老夫的敌人！哈哈哈哈！", "恭喜你艺成出师！你已被封为天忍教的萨满法王，从今以后可以自由行走江湖啦！你可以选择加入别的门派继续学艺，也可以去创建帮会扩展自己的江湖势力，又或者做一个独行客也不错啊！剑侠江湖，天高海阔，希望你能大展拳脚，一展鸿图！")
else									--丢失处理						Say("系统：真糟糕！你不小心把羊皮书弄丢了，如果要顺利出师，你必须得到羊皮书。", 2, "我再找找/find", "重新做这个任务/redo")	
end

end;


function select()
DelItem("羊皮书")
Msg2Player("恭喜你艺成出师！你已被封为天忍教的萨满法王！")
SetRank(71)
SetTask(4, 70)
SetFaction("")	
SetCamp(4)
SetCurCamp(4)
end;


function find()
end;


function redo()
Say("系统：请重新在教主完颜宏烈处接受任务。", 0)
Msg2Player("你已选择重新在教主完颜宏烈处接受任务。")
SetTask(4, 60)
SetTask(24, 0)
SetTask(25, 0)
SetTask(26, 0)
SetTask(27, 0)
SetTask(28, 0)
SetTaskTemp(21,0)
SetTaskTemp(22,0)
SetTaskTemp(23,0)
SetTaskTemp(24,0)
end;