--description: 天王帮前殿 王佐非任务对话
--author: yuanlan	
--date: 2003/4/24


function twnpc02_Default()

UTask_tw = GetTask(3);

if (UTask_tw < 10) then								--尚未接10级任务
Say("王佐：帮主就像老夫的亲生女儿一样，无论发生什么事，老夫都会尽全力保护她！", 0)
end;				

if (UTask_tw > 10) and (UTask_tw < 15) then					--已经接到10级任务，尚未完成
Say("王佐：去<color=Red>北面的天王岛山洞<color>拿到<color=Red>三个鸡血石<color>后再来找我吧！", 0)
end;				

if (UTask_tw >= 15) and (UTask_tw < 70) then					--已经完成10级任务，尚未出师
Say("王佐：本帮兄弟都是心胸坦荡的好汉，老夫最见不得那些偷鸡摸狗的孬种！", 0)
end;				

if (UTask_tw >= 70) then							--已经出师
Say("王佐：男子汉大丈夫行走江湖，要顶天立地，如果你做了一些违背江湖道义的事，老夫可饶不了你！", 0)
end;				

end;



