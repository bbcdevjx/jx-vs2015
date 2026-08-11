--description: 武当派润娘 40级任务
--author: yuanlan	
--date: 2003/5/15



function wdnpc07_UTask_42()

Task0016 = GetTaskTemp(16)
Task0017 = GetTaskTemp(17)
Task0018 = GetTaskTemp(18)
Task0019 = GetTaskTemp(19)
Task0020 = GetTaskTemp(20)
if (Task0016 == 1) and (Task0017 == 1) and (Task0018 == 1) and (Task0019 == 1) and (Task0020 == 1) then  
	if ( HaveItem("武当掌门书信") == 1) then
		Talk(3, "", "润娘：哼！武当派的武功果然不同凡响啊，连我几个最厉害的手下都被你打败了！道一老儿是你什么人？", "玩家：道一真人是晚辈的尊师，他要晚辈将这封信亲手交给您。", "润娘：道一老儿教出来的弟子倒有几分机敏，信呢？拿来我看！……原来他也知道对不起我，早知如此，何必当初！罢罢罢！你既是他的弟子，我也不再为难你。我也有一封信要交给道一，信就放在这个山洞里，有本事你就找到它吧！。") 
		DelItem("武当掌门书信")
		SetTask(5, 45)
	else
		Say("系统：真糟糕！你不小心把掌门的书信给弄丢了，如果要继续任务，你必须有掌门的书信。", 2, "我再找找/find", "重新做这个任务/redo")
	end
else
	Say("润娘：瞧见了那五只白玉虎吗？有本事打败了它们，再来和我说话！", 0)
end;	
	
end;


function find()
end;

function redo()
Say("系统：请重新回武当山找周云泉接任务。", 0)
Msg2Player("你已选择重新回武当山找周云泉接任务。")
SetTask(5, 40)
SetTaskTemp(16, 0)
SetTaskTemp(17, 0)
SetTaskTemp(18, 0)
SetTaskTemp(19, 0)
SetTaskTemp(20, 0)
end;




	


