--description: 天忍教日月坛主20级任务
--author: yuanlan	
--date: 2003/5/18



function trnpc03_UTask_21()
Say("乌合萨：有一头头朝北的牛，先向右转原地转三圈，然后向后转原地转三圈，接着再往右转，这时候它的尾巴朝哪？", 5, "朝东/no2", "朝南/no2", "朝西/no2", "朝北/no2", "朝地/yes2");
end;

function yes2()
Talk(2, "select3", "玩家：哈哈哈，这个问题太简单啦！不管那头笨牛怎么转，它的尾巴都是朝地的呀！", "乌合萨：哇！你太聪明啦！不如你去帮我教训教训那个小鬼，找他要回<color=Red>日月双轮<color>。");
end;

function no2()
Say("乌合萨：原来你也不知道啊，真是个笨蛋！", 0);
end;

function select3()
Say("乌合萨：就算我求你了，帮帮忙吧？", 2, "好吧，我试试/accept2", "我还有别的事/refuse2");
end;

function accept2()
Say("乌合萨：太好了！那小鬼就在<color=Red>东面的树林<color>里，替我好好教训他！", 0);
SetTask(4, 23);  
end;

function refuse2()
Say("乌合萨：连你都不肯帮我，我还能找谁啊，呜呜呜……", 0);
SetTask(4, 22);  
end;
