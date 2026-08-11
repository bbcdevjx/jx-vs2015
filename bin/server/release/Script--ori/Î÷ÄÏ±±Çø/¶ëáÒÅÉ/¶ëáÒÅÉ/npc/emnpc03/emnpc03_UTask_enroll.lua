--description: 峨嵋派秦倚风入门任务
--author: yuanlan	
--date: 2003/3/3



function emnpc03_UTask_enroll()

Say("秦倚风：本派弟子皆精于琴棋书画，你若想加入门派，必须在音律上略知皮毛，让我来考考你：你知道下面哪一首乐曲是用琵琶演奏的吗？", 3, "苏武牧羊/False4", "高山流水/False4", "十面埋伏/True4");

end;


function False4()
Say("秦倚风：不对。", 3, "苏武牧羊/False4", "高山流水//False4", "十面埋伏/True4");
end;


function True4()
Say("秦倚风：嗯，答对了。第二个问题：下面哪个不属于四大名琴？", 3, "黄钟/True5", "绿绮/False5", "焦尾/False5");
end;


function False5()
Say("秦倚风：答不出来啦？", 3, "黄钟/True5", "绿绮/False5", "焦尾/False5");
end;


function True5()
Say("秦倚风：这都难不倒你？看来我要对你另眼相看了。你知道名曲《广陵散》是谁写的吗？", 3, "老子/False6", "嵇康/True6", "屈原/False6");
end;


function False6()
Say("秦倚风：不知道了吧？我看你还是知难而退吧！", 3, "老子/False6", "嵇康/True6", "屈原/False6");
end;


function True6()
Say("秦倚风：看来你倒不是一个俗人，不过还要<color=Red>何怜飘<color>师妹考考你，她就在上面的<color=Red>半山坡<color>，你去找她吧！", 0);
SetTask(1, 4);
end;