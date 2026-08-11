--description: 峨嵋派妙隐相公10级任务
--author: yuanlan	
--date: 2003/3/4



function emnpc11_UTask_17()

if ( HaveItem("铜镜") == 1) then					--得到修复好的完整铜镜
	Talk(2, "", "玩家：大哥，妙隐师姐托我把这面修补好的铜镜交给你，她要我问你愿不愿意等她三年，三年后她就会回到你的身边。", "妙隐相公：麻烦你告诉我娘子，别说三年，就是三十年，我也会等下去的！")
	DelItem("铜镜")
	SetTask(1, 18)
else									--铜镜丢失
	Say("系统：真糟糕！你不小心把修补好的铜镜给弄丢了，如果要完成任务，你必须有修补好的铜镜。", 2, "我再找找/find", "重新做这个任务/redo")
end

end;


function find()
end;

function redo()
Say("系统：请重新在妙隐处接受任务。", 0)
SetTask(1, 10)
end;




