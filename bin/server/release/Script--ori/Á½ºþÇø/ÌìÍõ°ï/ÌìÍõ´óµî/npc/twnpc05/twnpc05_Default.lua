--description: 天王帮天护法路云远非任务对话
--author: yuanlan	
--date: 2003/4/26


function twnpc05_Default()

UTask_tw = GetTask(3);

if (UTask_tw < 40) then								--尚未接40级任务
Say("路云远：小伙子年轻有为啊，如今是长江后浪推前浪，我们这些老头子都不顶用罗，哈哈哈！", 0)
end;				

if (UTask_tw == 42) then								--已经接到40级任务，尚未完成
Say("路云远：<color=Red>吴神医<color>就在<color=Red>巴陵县<color>，你快去快回！", 0)
end;

if (UTask_tw > 42) and (UTask_tw < 48) then					--已经接到40级任务，尚未完成
Say("路云远：求得解药了吗？", 0)
end;				

if (UTask_tw > 48) and (UTask_tw < 70) then					--已经完成40级任务，尚未出师
Say("路云远：你这孩子不仅武功不错，心地也蛮好的，老头子我很喜欢！", 0)
end;				

if (UTask_tw >= 70) then							--已经出师
Say("路云远：时世造英雄，如今天下群雄并起，人才济济，望你好自为之，将来成就一番惊天动地的作为！", 0)
end;				

end;



