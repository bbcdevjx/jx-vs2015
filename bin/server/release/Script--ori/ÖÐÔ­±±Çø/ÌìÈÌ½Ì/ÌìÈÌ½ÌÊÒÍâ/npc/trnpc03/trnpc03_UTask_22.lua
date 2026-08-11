--description: 天忍教日月坛主20级任务
--author: yuanlan	
--date: 2003/5/18



function trnpc03_UTask_22()
Say("乌合萨：就算我求你了，帮帮忙吧？", 2, "好吧，我试试/accept3", "我还有别的事/refuse3");
end;

function accept3()
Say("乌合萨：太好了！那小鬼就在<color=Red>东面的树林<color>里，替我好好教训他！", 0);
SetTask(4, 23);  
end;

function refuse3()
Say("乌合萨：连你都不肯帮我，我还能找谁啊，呜呜呜……", 0);
end;
