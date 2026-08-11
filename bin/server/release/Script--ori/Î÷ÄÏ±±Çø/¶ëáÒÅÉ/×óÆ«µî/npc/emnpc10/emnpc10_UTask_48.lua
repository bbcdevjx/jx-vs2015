--description: 峨嵋派苏词馨40级任务
--author: yuanlan	
--date: 2003/3/5



function emnpc10_UTask_48()

if ( HaveItem("百鸟朝凤曲谱") == 1) then					--得到百鸟朝凤曲谱
	Say("苏词馨：《百鸟朝凤》曲谱！太好了！秦师姐见到一定会很开心的，谢谢你，小师妹！", 1, "不客气/ok")
else										--丢失处理
	Say("系统：真糟糕！你不小心把《百鸟朝凤曲谱》给弄丢了，如果要完成任务，你必须得有《百鸟朝凤曲谱》。", 2, "我再找找/find", "重新做这个任务/redo")		
end;

end;

function ok()
DelItem("百鸟朝凤曲谱");
SetRank(17);
SetTask(1, 50);
AddMagic(88);
AddMagic(89);
Msg2Player("恭喜你！你已升为峨嵋派青莲仙子！");
Msg2Player("学会武功“不灭不绝”。");
Msg2Player("学会武功“梦蝶”。");
end;	


function find()
end;

function redo()
Say("系统：请重新在苏词馨处接受任务。", 0)
SetTask(1, 40)
SetTask(29, 0)
SetTask(30, 0)
SetTask(31, 0)
SetTaskTemp(2, 0)
end;

