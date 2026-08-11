--description: 天忍教风堂堂主完颜雪衣30级任务
--author: yuanlan	
--date: 2003/5/19



function trnpc05_UTask_30()
Say("风堂堂主完颜雪衣：再过几日，就是我母后——大金国皇后的生日了，本堂主打算送一件金缕玉衣给母后作为贺礼，但是还缺四种宝石：<color=Red>鸽血红<color>、<color=Red>冰晶蓝<color>、<color=Red>祖母绿<color>、<color=Red>云梦紫<color>。我听说<color=Red>秦陵<color>里有许多价值连城的宝石，你愿意帮我去找找吗？", 2, "为公主效劳荣幸之至/yes", "属下还有别的事/no");
DelItem("鸽血红")
DelItem("冰晶蓝")
DelItem("祖母绿")
DelItem("云梦紫")					--处理重接任务后，玩家捡起任务道具的情况
end;


function yes()
Say("风堂堂主完颜雪衣：太好了，不过我听说通往秦陵的路上很不太平，很多人都死在了寻宝的途中，你可以去汴京坐车，不过<color=Red>乌坛主<color>对西北一带挺熟的，你可以让他带你去。", 0);
SetTask(4, 32);  
end;

function no()
Say("风堂堂主完颜雪衣：……", 0);
end;




