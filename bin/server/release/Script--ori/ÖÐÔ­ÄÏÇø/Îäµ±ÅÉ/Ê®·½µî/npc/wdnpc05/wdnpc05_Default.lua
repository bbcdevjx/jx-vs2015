--description: 武当派徐岱岳非任务对话
--author: yuanlan	
--date: 2003/5/14


function wdnpc05_Default()

UTask_wd = GetTask(5);

if (UTask_wd < 30) then								--尚未接30级任务
Say("徐岱岳：武学之道，没有难不难，只有懒不懒。天资再好，不勤加练习，也不会成为一流高手。", 0)
end;				

if (UTask_wd > 30) and (UTask_wd < 35) then					--已经接到30级任务，尚未完成
Say("徐岱岳：你要在<color=Red>二十四个时辰<color>里去<color=Red>伏牛山<color>采回<color=Red>五株画眉草<color>，剩下的时间可不多了，你要抓紧啊！", 0)
end;				

if (UTask_wd >= 40) and (UTask_wd < 70) then					--已经完成30级任务，尚未出师
Say("徐岱岳：本派武功十分注重内在的修为，再厉害的招式，没有精纯的内功做底子，也发挥不了其真正的威力。", 0)
end;				

if (UTask_wd >= 70) then							--已经出师
Say("徐岱岳：“宝剑锋从磨砺出 梅花香自苦寒来”，想成为高手，就必须付出比别人更多的汗水。", 0)
end;				


end;



