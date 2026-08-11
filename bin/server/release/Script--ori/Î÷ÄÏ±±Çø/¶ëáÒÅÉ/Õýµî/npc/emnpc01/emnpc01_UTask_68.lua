--description: 峨嵋派清晓师太出师任务
--author: yuanlan	
--date: 2003/3/6



function emnpc01_UTask_68()

if (HaveItem("烟玉指环") == 1) then
	Talk(2, "select2", "清晓师太：你这次能够成功为本派夺回镇派之宝，功劳不小，以你的智慧和能力，已经可以顺利出师了，日后行走江湖，务必洁身自爱，切记切记！", "恭喜你艺成出师！你已被封为峨嵋派的金顶圣女，从今以后可以自由行走江湖啦！你可以选择加入别的门派继续学艺，也可以去创建帮会扩展自己的江湖势力，又或者做一个独行女侠也不错啊！剑侠江湖，天高海阔，希望你能大展拳脚，一展鸿图！")
else									--丢失处理
	Say("系统：真糟糕！你不小心把烟玉指环给弄丢了，如果要完成这个任务，你必须得到烟玉指环。", 2, "我再找找/find", "重新做这个任务/redo")
end;	

end;


function select2()
DelItem("烟玉指环")
Msg2Player("恭喜你艺成出师！你已被封为峨嵋派的金顶圣女！")
SetRank(64)
SetTask(1, 70)
SetFaction("") 		   					--玩家退出峨嵋派
SetCamp(4)
SetCurCamp(4)
end;	

function find()
end;

function redo()
Say("系统：请重新在清晓师太处接受任务。", 0)
SetTask(1, 60)
end;