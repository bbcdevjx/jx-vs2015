--description: 武当派道一真人出师任务
--author: yuanlan	
--date: 2003/5/17



function wdnpc02_UTask_60()
Say("道一真人：在后山<color=Red>太子岩<color>上有<color=Red>三个宝箱<color>，每个宝箱都用一道符咒封印着，如果你能完成符咒上面注明的任务，就可以打开宝箱，宝箱里藏有本派的<color=Red>三件宝物<color>，能够取得宝物者方能出师。", 2, "接受任务/accept", "暂不出师/refuse");
DelItem("玉清真经")
DelItem("上清真经")
DelItem("太清真经")						--防止重接任务后，玩家捡起任务道具
end;

function accept()
Say("道一真人：你必须打开后山<color=Red>太子岩<color>上的<color=Red>三个宝箱<color>，拿到里面的<color=Red>三件宝物<color>，才能顺利出师。", 0);
SetTask(5, 62);	
end;

function refuse()
Say("道一真人：也好，那你就在武当多学艺一段时日吧。", 0);
end;

