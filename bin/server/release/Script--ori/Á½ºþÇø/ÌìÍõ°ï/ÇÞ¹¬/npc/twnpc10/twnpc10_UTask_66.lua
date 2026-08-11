--description: 天王帮寝宫 杨瑛出师任务
--author: yuanlan	
--date: 2003/4/28



function twnpc10_UTask_66()

if ( HaveItem("天王遗书") == 1) then					--拿到天王遗书
	Talk(3, "select1", "玩家：属下不辱使命，已经将《天王遗书》取回，请帮主过目。", "杨瑛：太好了，夺回《天王遗书》不仅能保全本帮，更能阻止一场武林浩劫！你做得很好，从今天起，你可以自由地闯荡江湖了！", "恭喜你艺成出师！你已被封为天王帮的擎天元帅，从今以后可以自由行走江湖啦！你可以选择加入别的门派继续学艺，也可以去创建帮会扩展自己的江湖势力，又或者做一个独行大侠也不错啊！剑侠江湖，天高海阔，希望你能大展拳脚，一展鸿图！")
else									--丢失处理
	Say("系统：真糟糕！你不小心把《天王遗书》给弄丢了，如果要完成任务，你必须得有《天王遗书》。", 2, "我再找找/find", "重新做这个任务/redo")	
end

end;


function select1()
DelItem("天王遗书")
Msg2Player("恭喜你艺成出师！你已被封为天王帮的擎天元帅！")
SetRank(69)
SetTask(3, 70)
SetFaction("")	 	
SetCamp(4)			   				--玩家退出天王帮
SetCurCamp(4)
end;


function find()
end;

function redo()
Say("系统：请重新在杨瑛处接受任务。", 0)
SetTask(3, 60)
end;