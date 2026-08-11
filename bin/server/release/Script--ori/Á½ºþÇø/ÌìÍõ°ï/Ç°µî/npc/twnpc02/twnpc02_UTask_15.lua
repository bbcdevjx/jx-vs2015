--description: 天王帮前殿 王佐10级任务
--author: yuanlan	
--date: 2003/4/24



function twnpc02_UTask_15()

if ( HaveItem("鸡血石") == 1) then					--拿到鸡血石
	if ( GetItemCount("鸡血石") >= 3 ) then				--鸡血石数目至少为3
		Say("王佐：做得好！老夫就升你做侍卫长，不过以后还有很多考验等着你，你要继续努力。", 1, "多谢前使/ok")
	else								--鸡血石数目不够
		Say("系统：真糟糕！你不小心把鸡血石弄掉了几个，如果要完成任务，你必须得有三块鸡血石。", 2, "我再找找/find", "重新回山洞去打/redo")	
	end
else									--没有鸡血石
	Say("系统：真糟糕！你不小心把鸡血石都弄丢了，如果要完成任务，你必须得有三块鸡血石。", 2, "我再找找/find", "重新回山洞去打/redo")
end

end;


function ok()
DelItem("鸡血石")
DelItem("鸡血石")
DelItem("鸡血石")
SetRank(44)
SetTask(3, 20)
AddMagic(23)
AddMagic(24)
AddMagic(26)
--AddMagic(27)
AddMagic(30)
Msg2Player("恭喜你！你已经升为侍卫长了！")
Msg2Player("学会天王枪法。")
Msg2Player("学会天王刀法。")
Msg2Player("学会天王锤法。")
Msg2Player("学会天王帮武功“回风落雁”。")
end;


function find()
end;

function redo()
SetTask(3, 12)   
end;