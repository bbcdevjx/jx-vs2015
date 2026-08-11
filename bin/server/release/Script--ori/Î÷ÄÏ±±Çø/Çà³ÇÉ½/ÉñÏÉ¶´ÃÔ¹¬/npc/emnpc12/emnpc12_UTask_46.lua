--description: 峨嵋派高人40级任务
--author: yuanlan	
--date: 2003/3/5



function emnpc12_UTask_46()

if ( HaveItem("芙蓉锦鸡图") == 1) then						--得到芙蓉锦鸡图
	Talk(6, "select", "这是你要的《芙蓉锦鸡图》。", "高人：这真的是徽宗的真迹，哈哈哈，我朝思暮想，终于得到啦！", "现在你可以把《百鸟朝凤》的曲谱给我了吧？", "高人：这……", "你是前辈高人，可不能言而无信，否则会被天下人耻笑的。", "高人：……我又没说不给，这就是曲谱，你拿去吧！")
else										--丢失处理
	Say("系统：真糟糕！你不小心把《芙蓉锦鸡图》弄丢了，如果要得到《百鸟朝凤曲谱》，你必须有《芙蓉锦鸡图》。", 2, "我再找找/find", "重新做这个任务/redo")
end;

end;


function select()
DelItem("芙蓉锦鸡图")	
AddEventItem("百鸟朝凤曲谱")
Msg2Player("得到《百鸟朝凤曲谱》。")
SetTask(1, 48)
end; 


function find()
end;

function redo()
Say("系统：请重新在峨嵋派左偏殿苏词馨处接受任务。", 0)
SetTask(1, 40)
SetTask(29, 0)
SetTask(30, 0)
SetTask(31, 0)
SetTaskTemp(2, 0)
end;


