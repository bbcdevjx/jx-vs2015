--description: 武当派道一真人非任务对话
--author: yuanlan	
--date: 2003/5/14


function wdnpc02_Default()

UTask_wd = GetTask(5);

if (UTask_wd < 10) then								--尚未接10级任务
Say("道一真人：武学有道，步上正道，方能有所大成，倘若误入歧途，无异于南辕北辙。", 0)
end;				

if (UTask_wd == 12) then	
Say("道一真人：凡我武当弟子，都应熟读<color=Red>《道德经》<color>。你先去好好请教一下<color=Red>叶继美<color>师叔，读熟了《道德经》之后再来找为师。叶继美师叔通常在<color=Red>大殿后面西边<color>的<color=Red>清水池<color>畔。", 0);
end;

if (UTask_wd > 12) and (UTask_wd < 15) then					--已经接到10级任务，尚未完成
Say("道一真人：你读熟《道德经》了吗？", 0)
end;				

if (UTask_wd >= 20) and (UTask_wd < 48) then					--已经完成10级任务，尚未完成40级任务
Say("道一真人：为人切不可锋芒必露，韬光养晦，方能厚积薄发，细水常流。", 0)
end;				

if (UTask_wd >= 50) and (UTask_wd < 60) then					--已经完成40级任务，尚未接到出师任务
Say("道一真人：润娘的事你不要对旁人谈起，记住了吗？", 0)
end;				

if (UTask_wd > 60) and (UTask_wd < 65) then					--尚未完成出师任务
Say("道一真人：你必须打开后山<color=Red>太子岩<color>上的<color=Red>三个宝箱<color>，拿到里面的<color=Red>三件宝物<color>，才能顺利出师。", 0)
end;				

if (UTask_wd >= 70) then							--已经出师
Say("道一真人：你虽已出师，为师仍有几句话相赠：对于习武之人，武道固然重要，武德更需用心修养。武德不佳者，终不能达到武学真境，望你好自为之。", 0)
end;				


end;



