--description: 天忍教火堂堂主非任务对话
--author: yuanlan	
--date: 2003/5/18


function trnpc02_Default()

UTask_tr = GetTask(4);

if (UTask_tr < 10) then								--尚未接10级任务
Say("火堂堂主兀敖：不要以为入了本教就可以高枕无忧了，本教可不会养一些没有本事的闲人！", 0)
end;				

if (UTask_tr > 10) and (UTask_tr < 18) then					--已经接到10级任务，尚未完成
Say("火堂堂主兀敖：只要你能够顺利闯过<color=Red>七杀洞<color>，打败<color=Red>七个死囚<color>，得到<color=Red>七块七杀令牌的碎片<color>，就可以晋级为本教的无影杀手。", 0)
end;				

if (UTask_tr >= 20) and (UTask_tr < 70) then					--已经完成10级任务，尚未出师
Say("火堂堂主兀敖：新加入本教的那些年轻人，一个比一个强，你可要当心了！", 0)
end;				

if (UTask_tr >= 70) then							--已经出师
Say("火堂堂主兀敖：只有强者才能在这个世界上生存，强者杀人，弱者被人杀，因为技不如人而被人杀，那是咎由自取，怨不得旁人。", 0)
end;				


end;



