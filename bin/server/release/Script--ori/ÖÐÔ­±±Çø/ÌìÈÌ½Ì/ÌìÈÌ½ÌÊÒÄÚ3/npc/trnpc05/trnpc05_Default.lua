--description: 天忍教风堂堂主完颜雪衣非任务对话
--author: yuanlan	
--date: 2003/5/19


function trnpc05_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 30) then								--尚未接30级任务
Say("风堂堂主完颜雪衣：天忍教主是我大金国的国师，父王十分倚重他，所以让我入教当了现在这个堂主。", 0)
end;				

if (UTask_tr > 30) and (UTask_tr < 35) then					--已经接到30级任务，尚未完成
Say("风堂堂主完颜雪衣：你可以让<color=Red>乌坛主<color>送你去<color=Red>秦陵<color>，记住我要的四种宝石是<color=Red>鸽血红<color>、<color=Red>冰晶蓝<color>、<color=Red>祖母绿<color>、<color=Red>云梦紫<color>。", 0)
end;				

if (UTask_tr >= 40) and (UTask_tr < 70) then					--已经完成30级任务，尚未出师
Say("风堂堂主完颜雪衣：父王需要天忍教帮他收服中原武林，而天忍教如果没有我父王的支持，也不可能这么顺利地发展壮大。", 0)
end;				

if (UTask_tr >= 70) then							--已经出师
Say("风堂堂主完颜雪衣：你是一个不可多得的人才，希望我们以后是朋友而不要成为敌人，如果有机会，我会向父王举荐你的，为我大金国效命，总好过为那个昏庸的南朝皇帝卖命吧？", 0)
end;				


end;



