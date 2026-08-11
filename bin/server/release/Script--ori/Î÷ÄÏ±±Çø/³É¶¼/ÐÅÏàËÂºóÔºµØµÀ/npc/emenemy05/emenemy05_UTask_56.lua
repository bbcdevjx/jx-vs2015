--description: 峨嵋派 信相寺后院地道敌人 任务战斗死亡
--author: yuanlan	
--date: 2003/3/6



function emenemy05_UTask_56()

if ( HaveItem("金线绣像金刚经") == 1) then
	i = random(0,2)							--救出慈海方丈的概率是30%
	if (i == 0) then  
		Msg2Player("打败叛僧头目，救出被困的慈海方丈，将《金线绣像金刚经》交给他。")
		DelItem("金线绣像金刚经")
		SetTask(1, 58)
	end
else
	Say("系统：真糟糕！你不小心把《金线绣像金刚经》给弄丢了，如果要完成这个任务，你必须得有《金线绣像金刚经》。", 2, "我再找找/find", "重新做这个任务/redo")	
end;

end;


function find()
end;

function redo()
Say("系统：请重新回峨嵋派正殿清晓师太处接受任务。", 0)
SetTask(1, 50)	
end;