--description: 峨嵋派穆云慈30级任务
--author: yuanlan	
--date: 2003/3/5



function emnpc09_UTask_38()

if ( HaveItem("火狐") == 1) then					--救出火狐
	Say("穆云慈：哎呀，火狐！你这个淘气的小东西，下次可不准乱跑了！谢谢你帮我找回火狐！", 1, "不客气/ok")
else									--火狐丢失	
	Say("系统：真糟糕！你不小心把辛辛苦苦找回来的火狐给丢掉了，如果要完成任务，你必须得有火狐。", 2, "我再找找/find", "重新做这个任务/redo")	
end;

end;


function ok()
DelItem("火狐");
SetRank(16);
SetTask(1, 40);
AddMagic(85);
AddMagic(86);
AddMagic(87);
Msg2Player("恭喜你！你已升为峨嵋派白莲仙子！");
Msg2Player("学会武功“一叶知秋”。");
Msg2Player("学会武功“流水”。");
Msg2Player("学会武功“冰心诀”。");
end;	


function find()
end;

function redo()
Say("系统：请重新在穆云慈处接受任务。", 0)
SetTask(1, 30)
end;

